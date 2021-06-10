---
title: Additional Competence
description: The Additional Competence API is used to register Additional Qualifications obtained by a seafarer that is relevant when applying for a Certificate of Competence. Additional Competence is accepted when the sender is a ship owner, or an appointed representative i.e Master and Chief Engineer. 
toc: true
weight: 3
---

## List of additional competence 
The Norwegian Maritime Authority will accept the additional competence listed in Table 4. When using the API operations the *code field* should contain one of the codes listed in the table. The _List additional competence codes_ API endpoint will contain up to date list of codes.

**Table 4 - Additional Competence Codes**

| Code     | Description of Additional Competence                                                                                |
|----------|---------------------------------------------------------------------------------------------------------------------|
| BS0      | Båtmann                                                                                                             |
| BUNK3    | Deltatt på 3 bunkringsoperasjoner ombord på skip som bruker eller fører drivstoff med flammepunkt under 60 grader C |
| BV       | Brovakt, STCW regel II/4                                                                                            |
| BVSJEKK  | Brovakt sjekkliste                                                                                                  |
| GOLALO   | Grunnleggende opplæring i sikre laste- og losseoperasjoner olje- og kjemikalietankskip                              |
| GOIGF    | 3 gjennomførte lasteoperasjoner om bord på gasstankskip                                                             |
| MV       | Maskinromsvakt, STCW regel III/4, tabell A-III/4                                                                    |
| GOPOLFAR | Grunnleggende opplæring polare farvann                                                                              |
| VOPOLFAR | Videregående opplæring polare farvann                                                                               |
| UTMOB8   | Føring av mob-båt og redningsfarkost - 8 timers utsjekk                                                             |
| GOLALG   | Grunnleggende opplæring i sikre laste- og losseoperasjoner gasstankskip                                             |

## Available functionality 

### List additional competence codes
GET operation to obtain the complete list of competence codes listed in table 4. This list will always contain the newest version.

### Create additional competences*
POST operation to register additional competences. 

### Retrive an additional competence
GET operation to obtain an already reported additional competence using UIDs. 

### List additional competences
GET operation to obtain  already reported additional competences. 




