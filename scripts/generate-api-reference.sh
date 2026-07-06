#!/usr/bin/env bash
#
# Generates the "API Reference" section for the Hugo site from Azure API Management.
#
# For every APIM product whose name ends with "-external" it:
#   1. lists the APIs in the product,
#   2. exports each API's OpenAPI (v3) definition to  static/api-specs/<path>.json,
#   3. writes a Hugo page under  content/api-reference/<product>/<path>.md
#      that embeds the spec with the {{< redoc >}} shortcode.
#
# Requires: az (logged in / AzureCLI@2 service connection), curl, jq.
#
# Environment variables (set by the pipeline):
#   APIM_SUBSCRIPTION_ID   Azure subscription id of the APIM instance
#   APIM_RESOURCE_GROUP    Resource group of the APIM instance
#   APIM_SERVICE_NAME      APIM instance name
#
set -euo pipefail

API_VERSION="2022-08-01"

# API paths to exclude from the reference entirely (space-separated). These are
# external in APIM but not meant for the public developer reference.
EXCLUDED_PATHS="core-externallookup-external core-externaluserprovider core-identityserver core-search-external los-rasmus-external"

# Everything is derived from the Azure CLI context provided by the pipeline's
# service connection, so no subscription id / resource names live in this public
# repo. Each value can still be overridden with an env var if needed.
SUB="${APIM_SUBSCRIPTION_ID:-$(az account show --query id -o tsv)}"
RG="${APIM_RESOURCE_GROUP:-}"
SVC="${APIM_SERVICE_NAME:-}"
if [ -z "$RG" ] || [ -z "$SVC" ]; then
  # There is exactly one "*-apim-common" instance per subscription.
  read -r RG SVC < <(az apim list --subscription "$SUB" \
    --query "[?contains(name,'apim-common')] | [0].[resourceGroup,name]" -o tsv)
fi
: "${RG:?could not determine APIM resource group}"
: "${SVC:?could not determine APIM service name}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONTENT_DIR="$ROOT/content/api-reference"
SPEC_DIR="$ROOT/static/api-specs"
# Optional Norwegian display-name overrides, keyed by API path. Edit this file
# to change how an API is named in the reference; English is used as fallback.
TITLES_FILE="$ROOT/scripts/api-titles.no.json"

echo "Generating API reference from $SVC (rg=$RG, sub=$SUB)"

# Fresh output every build so removed/renamed APIs don't linger.
rm -rf "$CONTENT_DIR" "$SPEC_DIR"
mkdir -p "$CONTENT_DIR" "$SPEC_DIR"

az account set --subscription "$SUB"
TOKEN="$(az account get-access-token --resource https://management.azure.com --query accessToken -o tsv)"

# YAML-escape a value for use inside a double-quoted front-matter string.
yq_escape() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

# --- section landing page -------------------------------------------------
cat > "$CONTENT_DIR/_index.md" <<'EOF'
---
title: API-referanse
description: "Referanse for de eksterne REST-API-ene Sjøfartsdirektoratet tilbyr gjennom API Management."
weight: 15
toc: false
---

Denne siden genereres automatisk fra Azure API Management og viser alle eksternt
tilgjengelige API-er. Hver API-side viser hele OpenAPI-spesifikasjonen –
endepunkter, parametere, modeller og autentisering – i en Swagger-stil.

{{% children description="true" %}}
EOF

product_count=0
api_count=0
skipped=0

# --- iterate external products -------------------------------------------
products_json="$(az apim product list \
  --resource-group "$RG" --service-name "$SVC" \
  --query "[?ends_with(name,'-external')].{name:name,displayName:displayName,description:description}" \
  -o json)"

echo "$products_json" | jq -c '.[]' | while read -r product; do
  pid="$(jq -r '.name'        <<<"$product")"

  product_count=$((product_count + 1))

  # --- iterate APIs in the product ---------------------------------------
  # All API pages are written directly under the API Reference section (flat),
  # so the product grouping is not reflected in the navigation.
  apis_json="$(az apim product api list \
    --resource-group "$RG" --service-name "$SVC" --product-id "$pid" \
    --query "[].{name:name,displayName:displayName,path:path}" -o json)"

  echo "$apis_json" | jq -c '.[]' | while read -r api; do
    aid="$(jq -r '.name'        <<<"$api")"
    adisp="$(jq -r '.displayName' <<<"$api")"
    apath="$(jq -r '.path'        <<<"$api")"
    # Public slug used in URLs and spec filenames: hide the internal project
    # prefix (aps/core/et/los/grants) and the "-external" suffix.
    slug="$(printf '%s' "$apath" | sed -E 's/^(aps|core|et|los|grants)-//; s/-external$//')"

    # Skip explicitly excluded APIs.
    case " $EXCLUDED_PATHS " in
      *" $apath "*)
        echo "  -- excluding $apath (excluded list)"
        skipped=$((skipped + 1))
        continue ;;
    esac

    # Export the OpenAPI (v3) definition via ARM. %2B == '+' in openapi+json-link.
    export_url="https://management.azure.com/subscriptions/$SUB/resourceGroups/$RG/providers/Microsoft.ApiManagement/service/$SVC/apis/$aid?export=true&format=openapi%2Bjson-link&api-version=$API_VERSION"
    link="$(curl -fsS -H "Authorization: Bearer $TOKEN" "$export_url" | jq -r '.value.link // empty')"

    if [ -z "$link" ]; then
      echo "  !! skipping $aid (no OpenAPI export available)"
      skipped=$((skipped + 1))
      continue
    fi

    if ! curl -fsS "$link" -o "$SPEC_DIR/$slug.json"; then
      echo "  !! skipping $aid (failed to download spec)"
      skipped=$((skipped + 1))
      continue
    fi

    # Many external APIs are pass-through: registered in APIM with a path but no
    # operations imported, so their OpenAPI export has no endpoints. Skip those
    # rather than publish an empty reference page.
    op_count="$(jq '[.paths // {} | keys[]] | length' "$SPEC_DIR/$slug.json")"
    if [ "$op_count" -eq 0 ]; then
      echo "  -- skipping $apath (no operations defined in APIM)"
      rm -f "$SPEC_DIR/$slug.json"
      skipped=$((skipped + 1))
      continue
    fi

    # Prefer real metadata from the spec, fall back to APIM display data.
    title="$(jq -r '.info.title // empty'       "$SPEC_DIR/$slug.json")"; [ -z "$title" ] && title="$adisp"
    # Normalise the title: drop any leading internal team prefix and the trailing
    # " External", then add a friendly group label based on the product the API
    # belongs to (so e.g. all APS APIs are grouped under "Sjøfolk - ").
    title="$(printf '%s' "$title" | sed -E 's/^(APS|Core|ET|Los|Grants)[[:space:]]+//; s/[[:space:]]+External$//')"
    # Apply a Norwegian display-name override if one exists for this API path.
    if [ -f "$TITLES_FILE" ]; then
      override="$(jq -r --arg p "$apath" '.[$p] // empty' "$TITLES_FILE")"
      [ -n "$override" ] && title="$override"
    fi
    case "$pid" in
      aps-*) title="Sjøfolk - $title" ;;
    esac
    # Rewrite the title inside the spec too, so Redoc doesn't show the internal
    # project name in its own header.
    jq --arg t "$title" '.info.title = $t' "$SPEC_DIR/$slug.json" > "$SPEC_DIR/$slug.json.tmp" \
      && mv "$SPEC_DIR/$slug.json.tmp" "$SPEC_DIR/$slug.json"
    desc="$(jq -r '.info.description // empty'   "$SPEC_DIR/$slug.json")"; [ -z "$desc" ] && desc="OpenAPI-referanse for $title."
    ver="$(jq -r '.info.version // ""'           "$SPEC_DIR/$slug.json")"
    # keep the description a single, short line for front matter
    desc="$(printf '%s' "$desc" | tr '\n' ' ' | cut -c1-240)"

    # Optional hand-written companion pages live in api-extras/<path>/*.md, kept
    # outside the regenerated content dir so they survive every build. If any
    # exist, the API becomes a bundle: an _index.md holding the Redoc reference,
    # with those pages as child pages beneath it. Otherwise a single flat page.
    extra_dir="$ROOT/api-extras/$apath"
    if compgen -G "$extra_dir/*.md" > /dev/null 2>&1; then
      mkdir -p "$CONTENT_DIR/$slug"
      cat > "$CONTENT_DIR/$slug/_index.md" <<EOF
---
title: "$(yq_escape "$title")"
description: "$(yq_escape "$desc")"
toc: false
apiPath: "$apath"
apiVersion: "$ver"
---

{{< redoc spec="/api-specs/$slug.json" height="720px" >}}

{{% children description="true" %}}
EOF
      cp "$extra_dir"/*.md "$CONTENT_DIR/$slug/"
    else
      # Flat page: sorted alphabetically by title (no weight).
      cat > "$CONTENT_DIR/$slug.md" <<EOF
---
title: "$(yq_escape "$title")"
description: "$(yq_escape "$desc")"
toc: false
apiPath: "$apath"
apiVersion: "$ver"
---

{{< redoc spec="/api-specs/$slug.json" >}}
EOF
    fi

    echo "  -> $pid / $apath"
    api_count=$((api_count + 1))
  done
done

echo "Done. Products: $product_count. Specs written to static/api-specs."
