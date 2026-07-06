---
title: Brukerveileder for systemleverandører
description: Veileder for systemleverandører som skal koble seg til Sdir sine API-er på vegne av en virksomhet.
weight: 10
toc: true
aliases:
- /systemleverandor/
---

## Oppkobling til Sdir API på vegne av en virksomhet

Sjøfartsdirektoratet (Sdir) tilbyr systemleverandører tilgang til API-ene våre, slik at dere kan hente og rapportere opplysninger på vegne av en virksomhet.

I denne veilederen skiller vi mellom to roller:

- **Virksomheten** er kunden som selv eier tilgangen til dataene – for eksempel et rederi, en kursleverandør eller en annen aktør som bruker tjenestene til Sdir.
- **Systemleverandøren** er dere som utvikler og drifter fagsystemet, og som kobler dere til Sdir sine API-er på vegne av virksomheten.

Oppkoblingen bygger på at systemleverandøren integrerer sine systemer mot Sdir sine API-er via **Maskinporten**, med bruk av selvbetjening i Samarbeidsportalen.

## Dette trenger du

1. Avtale med virksomheten du skal opptre på vegne av
2. Bekreftelse på at virksomheten har fått tilgang til de aktuelle Sdir API-ene
3. Bekreftelse på at virksomheten har delegert tilgangen til din virksomhet i Samarbeidsportalen
4. Tilgang til Maskinporten
5. Tilgang til Sdir API (abonnement / subscription key)

## Slik går du fram

### 1. Avtale med virksomheten

Inngå en avtale med virksomheten om at dere skal koble dere til Sdir sine API-er på deres vegne. Dersom løsningen behandler personopplysninger, må dere også ha en databehandleravtale som regulerer dette.

### 2. Bekreftelse på at virksomheten har tilgang til Sdir API

Virksomheten må selv ha bedt om og fått tilgang til de aktuelle API-ene hos Sdir. Tilgang bestilles ved å sende en e-post til [post@sdir.no](mailto:post@sdir.no) med informasjon om hvilke tjenester det gjelder. Innhent en bekreftelse fra virksomheten på at tilgangen er på plass før dere går videre.

### 3. Bekreftelse på at virksomheten har delegert tilgangen til deg

Virksomheten delegerer tilgangen (scopet) til din virksomhet i Samarbeidsportalen, slik at dere kan opptre som leverandør på deres vegne i Maskinporten. Se Digdir sin veiledning for [konsument delegert til leverandør](https://samarbeid.digdir.no/maskinporten/konsument-delegert-til-leverandor/120). Innhent en bekreftelse på at delegeringen er utført.

### 4. Tilgang til Maskinporten

Sdir bruker Maskinporten for autentisering og tilgangskontroll. Løsningen garanterer identitet mellom virksomheter og sikrer maskin-til-maskin-autentisering. For å autentisere mot Maskinporten trenger dere et virksomhetssertifikat, som kan bestilles fra [Commfides](https://www.commfides.com/) eller [Buypass](https://www.buypass.no/). Dere trenger ett sertifikat for test og ett for produksjon.

- **a) Les veiledningen.** Se Digdir sine sider for [å ta i bruk Maskinporten](https://samarbeid.digdir.no/maskinporten/ta-i-bruk-maskinporten/97) og [leverandør på vegne av konsument](https://samarbeid.digdir.no/maskinporten/konsument-delegert-til-leverandor/120).
- **b) Inngå avtale med Digdir.** Bruk av Maskinporten er kostnadsfritt.
- **c) Etabler tilgang.** Registrer integrasjonen i Samarbeidsportalen mot de aktuelle Sdir-scopene. For test bruker vi _ver2_-miljøet.
- **d) Test tilgangen.** Verifiser at dere får hentet et access token fra Maskinporten.

Teknisk dokumentasjon: [Maskinporten – guide for API-konsument](https://docs.digdir.no/docs/Maskinporten/maskinporten_guide_apikonsument). Spørsmål om Maskinporten rettes til Digdir på [servicedesk@digdir.no](mailto:servicedesk@digdir.no).

### 5. Tilgang til Sdir API

- **a) Les den tekniske dokumentasjonen.** Se [API-referansen](/api-reference/) for de enkelte tjenestene, med endepunkter, parametere og modeller.
- **b) Sett opp abonnement.** Registrer dere i utviklerportalen og abonnér på produktet (API-ene) dere trenger. Ta vare på subscription-nøkkelen, som skal med i HTTP-forespørslene.
    - Test: [utviklerportal for test](https://sdir-t-apim-common.developer.azure-api.net/signin)
    - Produksjon: [utviklerportal for produksjon](https://api.developer.sdir.no/signin)
- **c) Utvikle og test.** Bygg integrasjonen mot testmiljøet før dere går i produksjon. I hver HTTP-forespørsel legger dere ved `Ocp-Apim-Subscription-Key` med subscription-nøkkelen og `Authorization: Bearer <access token>` med token fra Maskinporten.

Spørsmål om tilgang til Sdir sine API-er rettes til [post@sdir.no](mailto:post@sdir.no).

{{% panel %}}
**Base-URL for Sdir API** <br><br>
Test: <code>https://sdir-t-apim-common.azure-api.net</code> <br>
Produksjon: <code>https://api.sdir.no</code>
{{% /panel %}}

## Andre nyttige lenker

- [Maskinporten (Digdir)](https://samarbeid.digdir.no/maskinporten)
- [Driftsmeldinger fra Digdir](https://status.digdir.no/)
- [Scopes](/scopes/)
- [API-referanse](/api-reference/)
