---
title: Getting started
description: Documentation for basic introduction to the APIs and their usage. 
weight: 5
aliases:
- /getting-started/
---

## Getting started using the apis

There are many ways you could use for accessing the api. For exampl making your own client or using a tool like [Postman](https://www.postman.com/). This guide will explain it with a built in browser based tool.

To use the apis you login to the [development portal](https://sdir-d-apim-common.developer.azure-api.net/apis), there you can access the api from a web based frontend.

### Getting token

To access the api and data within you need a valid Bearer token, obtaining this is covered in [this guide](token). Once you have a valid Bearer Token you can access data relevant to your organisation.

### Navigating APIs

The first page allows you to navigate the different APIs

![](API_Navigation.png)

After selecting a API you get the available endpionts to the API. You can try them using the green "Try it" Button
![](apsadditionalcompetence.png)

When you scroll down the API operation description you see parameter samples and responses you can expect 

### Fetching data

Enter the subscription key, uid and Authorization header neads to be set with the Bearer token. Remember to write 'Bearer' before the long token string.

![](tryit.png)

### Inserting data

To insert data you need the same header information as a Get but instead you need to fill in the body with a JSON document containing data.

![](postadditionalcompetence.png)

If you receive a 201 Created status code back fro mthe API the request is successfull and a row in the database is created.

### White/Gray hat Hackers
If you find any issues or security vulnerabilities in the apis, we would be deeply thankfull if you report it to [this email address](@sdir.no)
