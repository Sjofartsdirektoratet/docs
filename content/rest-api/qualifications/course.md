---
title: Course
description: The course API is used to report passed education and courses for a seafarer that is relevant when applying for a Certificate issued by the Norwegian Maritime Authorithy (NMA). Educational institutions and course centers must be approved by NMA to report on this API. 
toc: true
weight: 2
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-course.
{{% /panel %}}

## Educational and course codes 

Two types of codes are accepted in the field *code* in the payload for data transfer; educational code and course code. The educational codes are referring to an education completed in an educational institution listed in **table 3**, while as the course codes are referring to shorter courses listed in **table 2**. A list of both the educational- and course codes can be obtained by using the operation "Fetch a list over valid education codes" in the APIs, this list will contain the latest update. 

As an educational institution or a course center, you can only report courses and educations that you are approved by NMA to deliever. 

**Table 2 - Course codes**  

| Kursnavn                                                                                                                                                                          | Kurskode |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Assessement om bord (modell kurs 1.30)                                                                                                                                            | ASSO     |
| Assessor kurs, STCW regel 1/6 (modellkurs 3.12)                                                                                                                                   | ASS      |
| Assessorkurs for Simulator instruktører, STCW regel I/12 (modellkurs 6.10)                                                                                                        | SIASS    |
| Begrenset radio operatørsertifikat (ROC), STCW regel IV/2, tabel A-IV/2                                                                                                           | ROC      |
| Begrenset sikkerhetsopplæring for sjøfolk på skip under 300 bt. i fartsområde 1 i perioden 1 mai til 30 september, FOR 22.12.2011 nr 1523 § 8 (3) (Endres i Juni)                 | GSKBG    |
| D5 Privatist eksamen uten simulator                                                                                                                                               | D5PRIV   |
| Dekkskadett begrenset fartsområde, systematisk opplæring om bord (FOR 2011-12-22 nr 1523 §12)                                                                                     | WEBCAB   |
| Dekkskadett, systematisk opplæring om bord (FOR 2011-12-22 nr 1523 §12)                                                                                                           | WEBCAD   |
| FPSO kurs, STCW A-II/1, A-II/2, A-II/3                                                                                                                                            | FPSO     |
| Fritidsskipper, fører iht. gjeldende læreplan eller STCW regel II/3 , ubegrenset fartsområde                                                                                      | D5LA     |
| Fritidsskippersertifikat, fører iht. gjeldende læreplan eller STCW regel II/3, stor kystfart (Blandet inn utdanning VD3, stor kystfart skal stå)                                  | D5L      |
| Generelt Operatørsertifikat (GOC), STCW regel IV/2, tabell A-IV/2                                                                                                                 | GOC      |
| Grunleggende IGF. STCW regel V/3, tabell A-V/3-1                                                                                                                                  | IGFB     |
| Grunnleggende kurs for sjøfolk på skip som opererer i polare vann, STCW regel V/4, tabell A-V/4-1                                                                                 | POLB     |
| Grunnleggende sikkerhetskurs, STCW regel VI/1, tabell A-VI/1-1, A-VI/1-2, A-VI/1-3, A-VI/1-4                                                                                      | GSK      |
| Grunnleggende Sikkerhetsopplæring for fiskere STCW-F Kapitel III regel 1                                                                                                          | SOF      |
| Grunnleggende Sikkerhetsopplæring oppdatering for fiskere STCW-F, Kapitel III, regel 1                                                                                            | SOFO     |
| Grunnleggende sikkerhetsopplæring oppdatering, STCW regel VI/1; STCW tabell A-VI/1-1, A-VI/1-2, A-VI/1-3                                                                          | GSKR     |
| Hurtigbåt assessorkurs, FOR 22.12.2011 nr 1523 § 65 (1)                                                                                                                           | HASS     |
| Hurtigbåtoperasjoner oppdatering, FOR 22.12.2011 nr. 1523  § 65                                                                                                                   | HRØB     |
| Hurtiggående mann over bord båt kurs (HMOB), STCW-regel VI/2, tabell A-VI/2-2                                                                                                     | HMOB     |
| Hurtiggående mann over bord båt oppdateringskurs, STCW-regel VI/2, tabell A-VI/2-2                                                                                                | HMOBR    |
| Instruktørkurs, STCW regel 1/6 (modellkurs 6.09)                                                                                                                                  | IK       |
| Instruktørkurs for simulator, STCW regel 1/6 (modellkurs 6.10)                                                                                                                    | IKS      |
| Hurtigbåtoperasjoner for øvrig besetning, Forskrift av 22.12.2011 nr. 1523 § 65                                                                                                   | HOØB     |
| Hurtigbåtoperasjoner for navigatør, Forskrift av 22.12.2011 nr. 1523 § 66                                                                                                         | HONM     |
| Vedlikehold av yrkeskompetanse for dekksoffiserer, STCW regel 1/11, regel II/1, II/2, II/3, tabell A-II/1, A-II/2, A-II/3                                                         | VYD      |
| Vedlikehold av yrkeskompetanse for maskinoffiserer, STCW regel 1/11, regel III/1, III/2, III/3, tabell A-III/1, A-III/2, A-III/3                                                  | VYM      |
| Ledelse i brannslokking oppdatering, STCW regel VI/3, tabell A-VI/3                                                                                                               | LBSR     |
| Ledelse i brannslokking, STCW regel VI/3, tabell A-VI/3                                                                                                                           | LBS      |
| Livbåtfører oppdatering, STCW regel VI/2, tabell A-VI/2-1                                                                                                                         | LBR      |
| Livbåtfører, STCW regel VI/2, tabell A-VI/2-1                                                                                                                                     | LB       |
| Maskinkadett, systematisk opplæring om bord (FOR 2011-12-22 nr 1523 §12)                                                                                                          | WEBCAM   |
| Matros VG3 opplæring i bedrift (Lærlinger), STCW regel II/4, II/5, tabell A-II/4, A-II/5                                                                                          | MATVG3   |
| Medisinsk behandling oppdatering, STCW regel VI/4,  tabell A-VI/4-2                                                                                                               | MBHR     |
| Medisinsk behandling, STCW regel VI/4,  tabell A-VI/4-2                                                                                                                           | MBH      |
| Medisinsk førstehjelp oppdatering, STCW regel VI/4, tabell A-VI/4-1                                                                                                               | MFHR     |
| Medisinsk førstehjelp, STCW regel VI/4, tabell A-VI/4-1                                                                                                                           | MFH      |
| Motormann VG3 opplæring i bedrift (Lærlinger), STCW regel III/4, III/5, tabell A-III/4, A-III/5                                                                                   | MOVG3    |
| Navigasjonssimulator ARPA, ECDIS & BRM for privatister D5 (STCW II/3)                                                                                                             | NSIMD5   |
| Norsk maritimt regelverk, STCW regel I/10 (NIS kurs)                                                                                                                              | REG      |
| Høyspentkurs, oppgradering for maskinoffiserer  STCW regel III/1, III/2, III/3, tabell A-III/1, A-III/2                                                                           | OGMOH    |
| Oppgradering for skipselektrikere med sertifikat etter gammel ordning, iht. STCW regel III/6 og III/7, tabeller A-III/6 og A-III/7                                                | OGSEL    |
| Oppgraderingskurs sikkerhetskompetanse for dekkeoffiserer (66 t.), STCW regel VI/1, VI/2, VI/3, VI/4, tabeller A-VI/1-1, A-VI/1-2, A-VI/1-3, A-VI/2-1, A-VI/3, A-VI/4-1, A-VI/4-2 | OGD      |
| Oppgraderingskurs sikkerhetskompetanse for maskinoffiserer (66 t.), STCW regel VI/1, VI/2, VI/3, VI/4, tabeller A-VI/1-1, A-VI/1-2, A-VI/1-3, A-VI/2-1, A-VI/3, A-VI/4-1          | OGM      |
| Passasjer- og krisehåndtering, STCW regel V/2, avsnitt A-V/2, tabeller A-V/2-1 og A-V/2-2                                                                                         | PK       |
| Prøve Yrkeskompetanse dekk STCW regel II/1, II/2, II/3, tabell A-II/1, A-II/2, A-II/3                                                                                             | PYKD     |
| Prøve yrkeskompetanse maskin STCW regel III/1, III/2, III/3, tabell A-III/1, A-III/2                                                                                              | PYKM     |
| Påbygg grunnleggende sikkerhetsopplæring fra NOG til STCW regel VI/1, tabeller A-VI/1-1, 1-2, 1-3, 1-4                                                                            | PNOG     |
| Påbygg Livbåtfører fra NOG til STCW regel VI/2, tabell A-VI/2-1                                                                                                                   | PNOGL    |
| Ship Simulator og Bridge Teamwork (modell kurs 1.22)                                                                                                                              | SSBT     |
| Short Range Certificate (SRC), STCW regel IV/1                                                                                                                                    | SRC      |
| Sikkerhets- og terrorberedskapsoffiser (SSO), STCW regel VI/5, tabell A-VI/5                                                                                                      | SSO      |
| Sikringsbevissthet, STCW regel VI/6, tabell A-VI/6-1                                                                                                                              | SB       |
| Skipselektrikere- Høyspentkurs STCW regel III/6                                                                                                                                   | HSETR    |
| Skipselektrikeroffiser (maritim-elektriker), VG4 opplæring i bedrift                                                                                                              | ETOVG4   |
|  Særlige  sikringplikter, STCW regel VI/6, tabell A-VI/6-2                                                                                                                        | SP       |
| Tankermann høyeste grad Gass, STCW regel V/1-2, tabell A-V/1-2-2                                                                                                                  | TMKGH    |
| Tankermann høyeste grad Kjemikalie, STCW  regel V/1-1, tabell A-V/1-1-3                                                                                                           | TMKKH    |
| Tankermann høyeste grad Olje, STCW  regel V/1-1, tabell A-V/1-1-2                                                                                                                 | TMKOH    |
| Tankermann laveste grad Gass, STCW  regel V/1-2, tabell A-V/1-2-1                                                                                                                 | TMKGL    |
| Tankermann laveste grad Olje og Kjemikalie, STCW  regel V/1-1, tabell A-V/1-1-1                                                                                                   | TMKOKL   |
| Utvidet re-treningskurs - tidligere utsjekket fører og navigatør, FOR 22.12.2011 nr 1523 § 65                                                                                     | URFN     |
| Videregående IGF, STCW regel V/3, tabell A-V/3-2                                                                                                                                  | IGFA     |
| Videregående kurs for sjøfolk på skip som opererer i polare vann, STCW regel V/4, tabell A-V/4-2                                                                                  | POLA     |
| Videregående sikkerhetskurs oppdatering, STCW regel VI/2, VI/3, VI/4, tabell A-VI/2-1, A-VI/3, A-VI/4-1                                                                           | VSKR     |
| Videregående sikkerhetskurs, STCW regel VI/2, VI/3, VI/4, tabell A-VI/2-1, A-VI/3, A-VI/4-1                                                                                       | VSK      |
| Kurs i vedlikehold av yrkeskompetanse for skipselektrikeroffiser - (Ikke aktivt 02.09.20)                                                                                         | VYE      |



**Table 3 - Educational codes**


| Utdanningskoder                                                                | Kode            |
|--------------------------------------------------------------------------------|-----------------|
|     Dekksoffiser ledelsesnivå   - Vitnemål STCW A-II/2                         |     VD2         |
|     Dekksoffiser ledelsesnivå - Vitnemål STCW A-II/2.3 (Fører 3000 tonn)       |     VD3         |
|     Dekksoffiser operativt nivå - Vitnemål STCW A-II/1                         |     VD4         |
|     Dekksoffiser lavere operativt  nivå - Vitnemål STCW   A-II/3               |     VD5         |
|     Matros - Vitnemål   STCW A-II/5                                            |     MATR        |
|     Maskinoffiser operativt nivå, STCW regel III/1, tabell A-III/1             |     VM4         |
|     Maskinoffiser ledelsesnivå (Maskinkraft 3000 kW), ref. STCW regel III/1    |     VM3         |
|     Maskinoffiser ledelsesnivå, ref. STCW regel III/2                          |     VM2         |
|     Skipselektrikeroffiser,STCW   regel III/6, tabell A-III/6                  |     VETO        |
|     Verkstedkurs for maskinoffiser iht. STCW regel III/1, tabell A-III/1       |     VKM         |
|     Matros STCW regel II/5, tabell A-II/5                                      |     VMATR       |
|     Matros VG3 i skole, STCW regel II/4, II/5, tabell A-II/4, A-II/5           |     MATRVG3S    |
|     Motormann STCW regel III/5, tabell A-III/5                                 |     MOT         |
|     Motormann VG3 i skole, STCW regel III/4, III/5, tabell A-III/4, A-III/5    |     MOTVG3S     |
|     Skipselektriker VG2, STCW regel III/7, tabell A-III/7                      |     ETR         |
|     Fritidsskippper utdanning                                                  |     D5L         |
|     Kadettbok dekk                                                             |     KADE        |
|     Kadettbok maskin                                                           |     KAMA        |
|     Fagbrev motormann                                                          |     FMO         |
|     Fagbrev matros                                                             |     FMA         |
|     Fagbrev skipselektriker offiser                                            |     FSEO        |

## Available functionality   
**Get a list of existing course registrations** 

GET operation to obtain a list of already reported education and courses using the *uid* received in an earlier response. 

**Get a list of seafareses who have completed a course**

GET operation to obtain a list of seafarers that have completed a course at the organization you are representing. 

**Get an existing course registration from the register**

GET operation to obtain an earlier report using the *uid*.

**Register a new course**

POST operation to register a new course or education. 

**Update an existing course registration property**

PATCH operation to updata an already registered course using the *uid* receieved in the response from an earlier report.    

**Updae an existing course registration**

PUT operation to update "completedAt"  in an exisiting course registration using the *uid* receieved in the response from an earlier report.    

