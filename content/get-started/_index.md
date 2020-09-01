---
title: Getting started
description: To be able to use Sdir public services you need to ble able to authenticate to Sdir and have the necessary permissions. 
weight: 5
aliases:
- /getting-started/
---

## Maskinporten integration 

In order to consume Sdir public services a Maskinporten-integration need to be established. For more information regarding how to configure and use Maskinporten-integration, please see [Maskinporten - API-konsument](https://difi.github.io/felleslosninger/maskinporten_guide_apikonsument.html)

### Short Story
1. Create a Keystore containing the SDIR Enterprise Certificate
2. Run jwt-grant-generator targeting Maskinporten
3. You will then receive a Bearer Token to access our services

### Create keystore
To create a keystore you first need a Enterprise Certificate, This can be obtained by...

Once you have a valid Enterprise Certificate you need to add it to a Keystore file for Java to be able to use it. We use [Keystore Explorer](https://keystore-explorer.org/)

1. From Windows Explorer open the Certificate in Keystore explorer and unlock it using the Sdir password.
2. Save the keystore to a suitable location, preferably in the same folder as jwt-grant-generator, name is something suitable, for expample "sdir_test_keys.jks"

### Run Jwt-grant-generator
First Clone [jwt-grant-generator](https://github.com/difi/jwt-grant-generator) in a suitable location on your computer. You then put the keystore in the program folder.

Then create a configuration file called client.properties in the program folder. 

#### Sample config file:

```
issuer=636132b5-1363-440f-a06d-a218c4592c3a
audience=https://oidc-ver1.difi.no/idporten-oidc-provider/
token.endpoint=https://oidc-ver1.difi.no/idporten-oidc-provider/token
scope=sdir:apstest

keystore.file=sdir_test_keys.jks
keystore.password=myNotSoSecretPassword 

keystore.alias=sdir_test
keystore.alias.password=myNotSoSecretPassword
```

Then you need to run it using this command using these two commands(requires Maven and JAVA to be installed):
```
mvn package
java -jar target\jwt-grant-generator-1.0-SNAPSHOT-jar-with-dependencies.jar client.properties
```

### Token

The output from jwt-grant-generator contains the access token retrieved from Maskinporten. thsi can then be used when acessing the API
