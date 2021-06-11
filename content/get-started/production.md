---
title: Production enviroment
description: When you are ready for production please us the following steps to get access
weight: 25
---

### Step one: Apply for access to the Sdir API production scopes
Send a email to apsinfo@sdir.no and request access to the Sdir API production scope.

### Step two: Maskinport intergration
Create Maskinport intergration for production in the [Samarbeidsportalen](https://minside-samarbeid.difi.no/) to the Sdir API scopes. Take a note of the integration id.

### Step three: API subscription
Sign up for the [production enviroment](https://sdir-p-apim-common.developer.azure-api.net/apis) and the select the product (API endpoints) you what to subscribe for. 
Take a note of the subscripton key, which is needed in the HTTP requests.


{{% panel %}}
**Settings** <br><br>
_API url_=https://sdir-p-apim-common.developer.azure-api.net
_ClientId_=[your production integration id]<br>
_MaskinportenBaseAddress_=https://maskinporten.no/<br>
_Scope_=sdir:sdir2022
{{% /panel %}}
