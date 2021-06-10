---
title: Seagoing Service
description: Seagoing service is the period a seafarer has signed on board a ship and is used as the basis for issuance of certificates. As a shipowner the Seagoing API is used to register seagoing service on a specific seafarer or several seafarers. Seagoing service is accepted when the sender is a ship owner, or an appointed representative i.e Master and Chief Engineer. 
toc: true 
weight: 4
---


## Occupation codes
The Norwegian Maritime Authorithy has decided a set of acceptable occupations when reporting seagoing service time. These occupations are the same as used in the "A-melding", namely the *STYRK codes*. The acceptable STYRK codes are listed in **Table 1**. 

All codes can also be obtained using the API operation *List reference occupation codes*, this list will always be updated. If the seafarer has worked in an occupation not listed in Table 1, a list of corresponding occupations can be found by using the API operation *List reference occupation code mappings*. For example the occupation "Platform chief" can be reported as "skipsfører".  


**Table 1 - List of acceptable occupation codes**

| Category   | STYRK title                | STYRK code |
|------------|----------------------------|------------|
| Dekk       | Skipsfører                 | 3142118    |
|            | Overstyrmann               | 3142115    |
|            | Styrmann                   | 3142122    |
|            | Matros                     | 8341107    |
|            | Lett matros                | 8341106    |
|            | Matros lærling             | 8341108    |
|            | Offiseraspirant dekk       | 3142110    |
| Maskin     | Maskinsjef                 | 3141113    |
|            | Førstemaskinist            | 3141102    |
|            | Maskinist                  | 3141103    |
|            | Motormann                  | 8342101    |
|            | Smører (skip)              | 8342102    |
|            | Motormann lærling          | 8342113    |
|            | Offiseraspirant (maskin)   | 3141106    |
| Elektriker | Skipeselektriker (offiser) | 3113149    |
|            | Skipselektriker            | 7241110    |
|            | Skipselektriker (lærling)  | 7241161    |
| Andre      | Los                        | 3142104    |
|            | Radiooperatør (skip)       | 3132108    |
|            | Fisker                     | 6411104    |

## Available functionality 

### Create multiple seagoing services

POST operation to add a new seagoing service report on one seafarer. 


### Retrieve seagoing service

GET operation to obtain a seagoing service  by the *uid*.

### List seagoing services

GET operation to obtain seagoing services. 


### List reference occupation codes
GET operation to obtain a list of the acceptable occupations codes. This list will always be updated with the correct set of codes. 

### List reference occupation code mappings
GET operation to obtain an overview of occupation codes in the maritime sector related to the set of acceptable codes defined in Table 1. 





