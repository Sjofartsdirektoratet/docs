---
title: Additional Competence
description: The Additional Competence API is used to register Additional Qualifications obtained by a seafarer that is relevant when applying for a Certificate of Competence. Additional Competence is accepted when the sender is a ship owner, or an appointed representative i.e Sjøkaptein and maskinsjef.
toc: true
weight: 2
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-additionalcompetence.  
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

## Put Additional competence

Update an additional competence

## Post Additional competence

Create a new additional competence for a person

## Put Batch Additional competence

Update a list of additional competences

## Post Batch Additional competence

Create multiple additional competences

