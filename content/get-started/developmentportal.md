---
title: Development Portal
description: The technical spesification of the Sdir APIs are provided by the Azure development portal.
weight: 10
---

## Development portal

The Azure development portal contains detailed specification of the availible Sdir APIs. The portal provides a high technical detail and is mostly targeted for application developers that want to integrate with Sdir programatically.      

To use the apis, login to the [development portal](https://sdir-t-apim-common.developer.azure-api.net/apis), to access the api from a web based frontend.

### Navigating APIs

The first page allows you to navigate the different APIs

![](../images/API_Navigation.png)

After selecting a API you get the available endpionts to the API. You can try them using the green "Try it" Button
![](../images/apsadditionalcompetence.png)

When you scroll down the API operation description you see parameter samples and responses you can expect 

### Fetching data

Enter the subscription key, uid and Authorization header neads to be set with the Bearer token. Remember to write 'Bearer' before the long token string.

![](../images/tryit.png)

### Inserting data

To insert data you need the same header information as a Get but instead you need to fill in the body with a JSON document containing data.

![](../images/postadditionalcompetence.png)

If you receive a 201 Created status code back from the API the request is successfull and a row in the database is created.

Otherwise Inspect the return message for details on what went wrong. Usually its validation errors or some field that is missing

### SqlServer sleeping
Sqlserver in Azure tend to sleep when not in use. this results in an SQLClient related error message first time you call the api. This will only happen in the Test envirnment as we are running on a lower pricing Tier than Production.