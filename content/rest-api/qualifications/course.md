---
title: Course
description: The Course API is used to register information approved course providers and courses that are currently availible.
toc: true
weight: 3
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-course.
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
}
```