---
title: Basic data types
description: Here we explain the usage of some of the basic data types used in our REST API.
toc: true
weight: 1
---

## Date and DateTime

Data types used as input in the Sdir REST API are of type string and will be parsed following the [ISO 8601 standard](https://en.wikipedia.org/wiki/ISO_8601). 
An example date would be `2020-08-17` and an example with date and time `2020-08-17T13:57:31+00:00` 

Date returned in the response will be returned as a Json DateTime on the form `2020-08-17T13:57:31+00:00` 

