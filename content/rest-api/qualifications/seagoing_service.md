---
title: Seagoing Service
description: Seagoing service is the period a seafarer has signed on board a ship and is used as the basis for issuance of certificates. As a shipowner the Seagoing API is used to register seagoing service on a specific seafarer or several seafarers. The seagoing service is connected to a position on board a specific ship, the accepted positions are listed in table 1.
toc: true
weight: 4
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-seagoing.
{{% /panel %}}

The positions available for reporting with the respective STYRK code are listed in table 1. This list can also be obtained with XXX command. The table instances are listed in norwegian. 

**Table 1**

| Category   | STYRK title                | STYRK code |
|------------|----------------------------|------------|
| Dekk       | Skipsfører                 | 3142118    |
|            | Overstyrmann               | 3142115    |
|            | Styrmann                   | 3142122    |
|            | Matros                     | 8341107    |
|            | Lett matros                | 8341106    |
|            | Matros lærling             | 8341108    |
|            | Offiseraspirant dekk       | 3142110    |
| Maskin     | Maskinsjef                 | 3141113    |
|            | Førstemaskinist            | 3141102    |
|            | Maskinist                  | 3141103    |
|            | Motormann                  | 8342101    |
|            | Smører (skip)              | 8342102    |
|            | Motormann lærling          | 8342113    |
|            | Offiseraspirant (maskin)   | 3141106    |
| Elektriker | Skipeselektriker (offiser) | 3113149    |
|            | Skipselektriker            | 7241110    |
|            | Skipselektriker (lærling)  | 7241161    |
| Andre      | Los                        | 3142104    |
|            | Radiooperatør (skip)       | 3132108    |
|            | Fisker                     | 6411104    |

## Get Additional competence

GET operation for additional competence:
```HTTP
GET https://sdir-d-apim-common.azure-api.net/aps-additionalcompetence/additionalcompetence/v1/additionalcompetence/{id} HTTP/1.1
Ocp-Apim-Subscription-Key: myAPIKey
Accept: application/json
```

Response:
```JSON
{
    // "Name": "HÅKON TRANA",
    // "AddressLine1": "",
    // "AddressLine2": "Borgermester Platous gate 7",
    // "AddressLine3": "5008 BERGEN",
    // "UserName": "haakon@trana.net",
    // "MobileNumber": "99988888",
    // "PreferredLanguage": "NorwegianNO",
    // "ShowClientUnits": true,
    // "PrivateConsent": true,
    // "ProfessionalConsent": true,
    // "ContactInformation": {
    //     "Email": "haakon@trana.net",
    //     "Mobile": "99988888",
    //     "RequestsEmailReceipts": false
    // },
    // "_links": {
    //     "self": {
    //         "href": "https://www.altinn.no/api/my/profile"
    //     },
    //     "portalview": {
    //         "href": "https://www.altinn.no/Pages/Profile/MyUserSettings.aspx"
    //     }
    // }
}
```
