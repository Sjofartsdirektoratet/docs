---
title: REST API
description: "Sdir REST APIs can be used to report data electronically to Sdir and integrate own IT systems with APIs that Sdir provide." 
toc: true
weight: 10
aliases:
- /api/
---

## OpenAPI Specification

Sdirs REST APIs have been created using the [OpenAPI 3.x](https://swagger.io/specification/) specification which is a widely adopted standard to describe modern RESTful APIs.  

An OpenAPI definition can then be used by documentation generation tools to display the API, code generation tools to generate servers and clients in various programming languages, testing tools, and many other use cases.

## Authentication with API-key

To be able to use Sdir public services you need to ble able to authenticate to Sdir and have the necessary permissions. In order to consume Sdir public services a Maskinporten-integration need to be established. For more information regarding how to configure and use Maskinporten-integration, please see [Slik bruker du Maskinporten som API-konsument](https://difi.github.io/felleslosninger/maskinporten_guide_apikonsument.html) 

## Format 

Supported data format is JSON and is passed either in the request body or returned in the response body. REST request to the Sdir API should have the header content type set to 'Content-Type: application/json'.

## Versioning

Sdir REST API will use versioned urls to support versioning of services. If there is a major change in an existing API, the version number will be incremented to a new version, to indicate that there are major changes in the API. 
When a new version of an API is released, the old version will be availible for a limitied period of time allowing customers to migrate to the new version. 
If there are only minor nonbreaking changes to an existing API it will keep the version number if basic functionality is not affected. 

**Version 1:** <br>
https:<span></span>//sdir-t-apim-common.azure-api.net/aps-additionalcompetence/additionalcompetence/**v1**/additionalcompetence/{id}

**Version 2:** <br> 
https:<span></span>//sdir-t-apim-common.azure-api.net/aps-additionalcompetence/additionalcompetence/**v2**/additionalcompetence/{id}

## Batch operations

Some of the Sdir APIs have a batch version of the API. This means that it will accept a list of objects to create or update for effiency. Due to the nature of REST it is very slow to update a large collection one by one. 
The batch APIs are designed so that if one of the update/create operations fail, the whole operation will be aborted and no changes are saved.

