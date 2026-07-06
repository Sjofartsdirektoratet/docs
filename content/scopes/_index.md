---
title: Scopes
description: Maskinporten-scopes som kreves for å bruke Sdir sine API-er.
weight: 12
toc: false
---

## Maskinporten-scopes

For å bruke Sdir sine API-er må virksomheten ha tilgang til de aktuelle
Maskinporten-scopene. Alle Sdir-scopene har prefikset `sdir:`. Virksomheten søker
om tilgang til de scopene den trenger – se [Brukerveileder for systemleverandører](/brukerveileder-systemleverandorer/).

| Scope | Tjeneste |
|---|---|
| `sdir:grants.seafarerstatement.write` | Sjømannserklæring (tilskudd) |
| `sdir:vessel.ecertificate.write` | E-sertifikat / forsikringssertifikat for fartøy |
| `sdir:seafarer.shared.certificates` | Felles sertifikater for sjøfolk |
| `sdir:seafarer.seagoingservice.write` | Fartstid |
| `sdir:seafarer.additionalcompetance.write` | Tilleggskompetanse |
| `sdir:seafarer.course.write` | Kurs |
| `sdir:seafarer.assessment.write` | Bedømmelse |
