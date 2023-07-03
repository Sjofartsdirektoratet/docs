---
title: Access Token (Jwt-grant-generator)
description: To be able to use Sdir public APIs you need to ble able to authenticate and have the necessary permissions. 
weight: 15
---

## Maskinporten integration 

To access our api and data within you need a valid Bearer token, this token proves who you are and contains information about you. 

In order to consume Sdir public services a Maskinporten-integration need to be established. For more information regarding how to configure and use Maskinporten-integration, please see [Maskinporten - API-konsument](https://docs.digdir.no/docs/Maskinporten/maskinporten_guide_apikonsument)

### Short Story
this is a short story and is directed towards people familiar with the concepts in this quide and as a to-do list for those who have done this before. More details will follow

1. Create a Keystore containing the your organisation's Enterprise Certificate
2. Run jwt-grant-generator tool targeting Maskinporten
3. You will then receive a Bearer Token to access our services

We will also give some resources on how to implement the authorization flow programatically.

### Create keystore

A Keystore is a Key and Certificate managing tool. It is used to Encapsulate certificates to make them more easily accessible for applications to use them.

To create a keystore you first need a Enterprise Certificate. The Enterprise Certificate can be ordered from [Commfides](https://www.commfides.com/commfides-virksomhetssertifikat/) or [Buypass](https://www.buypass.no/produkter/virksomhetssertifikat-esegl)

Once you have a valid Enterprise Certificate you need to add it to a Keystore file to be able to use it programatically. We use [Keystore Explorer](https://keystore-explorer.org/)

1. Start the Keystore Explorer application and open your Enterprise Certificate. After opening you will be prompted for the certificates password
2. Next choose Save As. Select a location, preferably in the same folder as jwt-grant-generator, and name the file something suitable, for expample "sdir_test_keys.jks"
3. Next we would want to set a password for the keystore, select Tool -> Set Keystore password and give in a secure password(we will need this for the next step)
4. Also make sure that the certificate in the keystore has a machine readable sertificate alias(without spaces and special characters). Right click and rename "Entry name" if necessary. It is also possible to change the certificate password by rightclicking and Set password. Remember to save again.

### Run Jwt-grant-generator

Jwt grant generator is a tool for generating a JWT sending it to Maskiporten and returning an access token. This token is used for accessing the api.

First Clone or download [jwt-grant-generator](https://github.com/difi/jwt-grant-generator) in a suitable location on your computer. You then put the keystore created in the root folder.

Then create a configuration file called client.properties in the program folder and populate it with keystore and certificate details. 

#### Sample configuration file:

```
// your maskinporten integration id
issuer=myIntegrationId

// this is the values for the test enviroment
audience=https://ver2.maskinporten.no/
token.endpoint=https://ver1.maskinporten.no//token
scope=sdir:apstest

keystore.file=sdir_test_keys.jks
keystore.password=myKeystorePassword 

//certificate alias name in keystore
keystore.alias=sdir_test 
keystore.alias.password=myCertificatePassword
```

Then you need to run it using this command using these two commands(requires [Maven](https://maven.apache.org/install.html) and [JAVA](https://tutorials.visualstudio.com/Java/hello-world/install-jdk) to be installed):

Run once to build project:
```
mvn package
```
Run every time you need a new token(they expire after one hour):
```
java -jar target\jwt-grant-generator-1.0-SNAPSHOT-jar-with-dependencies.jar client.properties
```

### Token

The output from jwt-grant-generator contains the access token. This can then be used when acessing the API.
![](../images/jwtgrantgenrun.png)

### Implement your own authentication to Maskinporten

In most scenarios it is not practical to use a tool to generate the authorization token. You would probably want to implement your own authentication flow to Maskinporten from within your application code.

[JWT Grant Generator](https://github.com/difi/jwt-grant-generator) shows how to read certificate from keystore and implement the authorization flow in Java

[Maskinporten Consumer Guide](https://docs.digdir.no/docs/Maskinporten/maskinporten_guide_apikonsument) explains the technical details of consuming an API protected by Maskinporten

When developing a custom solution it can be beneficial to use the Jwt-grant-generator guide to verify that the certificates and settings are working correctly.
