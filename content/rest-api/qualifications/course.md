---
title: Course
description: The course API is used to report passed education and courses for a seafarer that is relevant when applying for a Certificate issued by the Norwegian Maritime Authorithy (NMA). Educational institutions and course centers must be approved by NMA to report on this API. 
toc: true
weight: 2
---

## Educational and course codes 

Two types of codes are accepted in the field *code* in the payload for data transfer; educational code and course code.  A list of both the educational- and course codes can be obtained by using the API operation *List valid course and education codes*, this list will always be updated with newest version. 

As an educational institution or a course center, you can only report courses and educations that you are approved by NMA to deliever. 


## Available functionality  

### List valid course and education codes
GET operation to obtain the complete list of bot course and education codes listed in table 2 and 3. This list will always contain the newest version. 

### Create passed course participants
POST operation to register a new course or education participants. The course and educational codes in Table 2 and 3 must be used. 

### List passed course participants
GET operation to obtain an already reported education or course participants. 

### Retrieve a passed course participant
GET operation to obtain acourse participants. 
