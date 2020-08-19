---
title: Seagoing
description: The Seagoing API is used to register information about a persons professional work experience onboard a vessel.
toc: true
weight: 4
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-seagoing.
{{% /panel %}}

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
    "Name": "HÅKON TRANA",
    "AddressLine1": "",
    "AddressLine2": "Borgermester Platous gate 7",
    "AddressLine3": "5008 BERGEN",
    "UserName": "haakon@trana.net",
    "MobileNumber": "99988888",
    "PreferredLanguage": "NorwegianNO",
    "ShowClientUnits": true,
    "PrivateConsent": true,
    "ProfessionalConsent": true,
    "ContactInformation": {
        "Email": "haakon@trana.net",
        "Mobile": "99988888",
        "RequestsEmailReceipts": false
    },
    "_links": {
        "self": {
            "href": "https://www.altinn.no/api/my/profile"
        },
        "portalview": {
            "href": "https://www.altinn.no/Pages/Profile/MyUserSettings.aspx"
        }
    }
}
```