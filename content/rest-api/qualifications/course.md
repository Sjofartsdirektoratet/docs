---
title: Course
description: The course API is used to report passed education and courses for a seafarer that is relevant when applying for a Certificate issued by the Norwegian Maritime Authorithy (NMA). Educational institutions and course centers must be approved by NMA to report on this API. 
toc: true
weight: 2
---

{{% panel %}}
**Development environment API URL** <br>
The latest version of this API can be found deployed in our test environment at: https://sdir-d-apim-common.portal.azure-api.net/docs/services/sdir-d-api-aps-course.
{{% /panel %}}

Two types of codes are accepted in the field *code* in the payload for data transfer; educational code and course code. The educational codes are referring to an education completed in an educational institution, while as the course codes are referring to shorter courses. A list of both the educational- and course codes can be obtained by using the operations in the APIs. 

The reported courses and educations will be validated against the organization delievering the data. 

## Available functionality  
**Get a list of existing course registrations** 

GET operation to obtain a list of already reported education and courses using the *uid* received in an earlier response. 

**Get a list of seafareses who have completed a course**


**Get an existing course registration from the register**

GET operation to obtain an earlier report using the *uid*.

**Register a new course**

POST operation to register a new course or education. 

**Update an existing course registration property**

PATCH operation to updata an already registered course using the *uid* receieved in the response from an earlier report.    

**Updae an existing course registration**

PUT operation to update "completedAt"  in an exisiting course registration using the *uid* receieved in the response from an earlier report.    

