---
title: Additional Competence
description: The Additional Competence API is used to register Additional Qualifications obtained by a seafarer that is relevant when applying for a Certificate of Competence. Additional Competence is accepted when the sender is a ship owner, or an appointed representative i.e Master and Chief Engineer. 
toc: true
weight: 3
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-additionalcompetence.  
{{% /panel %}}

## List of additional competence 
The Norwegian Maritime Authority will accept the additional competence listed in Table 4. When using the API operations the *code field* should contain one of the codes listed in the table.  

**Table 4 (Updated 03.09.20) **

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

**Adds an additional competence** 

POST operation to register additional competence. 

**Adds list of additional competence** 

POST operation to register additional competence on more than one seafarer, or several additional competences. 

**Get additional competence by uid**

GET operation to access previous delieverd additional competance using the UID. 


**Get additional competences using uid**

GET operation to access more than one previous delieverd additional competence using UIDs. 

**Update an additional competence**

PUT operation to update an already reported additional competance using the UID. 

**Update list of additional competence**

PUT operation to update a list of already reported additional competences using the UID. 




