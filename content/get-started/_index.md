---
title: Getting started
description: The getting started section covers basic information about where you can find information about the availible Sdir APIs and how to get an access token to be able to call an API. 
weight: 5
---

### Step one: Enterprise Certificate
Your company must authenticate  against Maskinporten with a Enterprise Certificate. The Enterprise Certificate can be ordered from [Commfides](https://www.commfides.com/commfides-virksomhetssertifikat/) or [Buypass](https://www.buypass.no/produkter/virksomhetssertifikat-esegl). You will need a test and a production certificate. 

### Step two: Apply for access to Samarbeidsportalen
Sdir uses Maskinporten for access control. The solution guarantees identity between companies, and ensures machine-to-machine authentication.
Contact Norwegian Digitalisation Agency, servicedesk@digdir.no, to get access to Samarbeidsportalen and Maskinporten.

### Step three: Apply for access to the Sdir API scopes
Send a email to apsinfo@sdir.no and request access to the Sdir API test scope.

### Step four: Maskinport intergration
Create Maskinport intergration for test in the [Samarbeidsportalen](https://minside-samarbeid.difi.no/) to the Sdir API scopes. We use _ver1_ for the test enviroment.

### Step five: API subscription
Developers who need to consume the published APIs must include a valid subscription key in HTTP requests when they make calls to those APIs.
Sign up for the [test enviroment](https://sdir-t-apim-common.developer.azure-api.net/apis) and the select the product (API endpoints) you what to subscribe for. Take a note of the subscripton key, which is needed in the HTTP requests.

### Step six. Getting Access Token from Maskinporten
A JWT grant is a request sent by the client towards Maskinporten, in order to obtain an Access Token.
We have a [guide](/get-started/token/) covering the aquisition of the token using the JWT grant generator here. We have also a [ASP.NET Core code sample](/get-started/codeexample/).

### Step seven: Make your first request
You are now ready to start using the Sdir API. You need to add the following to the header of the HTTP requests:

- _Ocp-Apim-Subscription-Key_ with the primary subscription key as value. 
- _Authorization_ with the value "Bearer " + Access Token.


{{% panel %}}
**Base API URL Test environment** <br><br>
https://sdir-t-apim-common.developer.azure-api.net
{{% /panel %}}
