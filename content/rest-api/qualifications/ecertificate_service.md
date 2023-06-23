# E-Certificate Service


## Certificate Order
`POST` /api/order
Authorization required


### Body
```json
{
  "CertificateId": "0000000-CLB-YY-0001234", // Required when OperationType is set to Cancel. Remove field if OperationType is set to Create
  "Initiator": "", // Required. e.g. "GARD", "SKULD"
  "CertificateType": "CLB", // ["CLB", "CLC"]
  "OperationType": "Create", // ["Create", "Cancel"]. Defaults to Create
  "ValidFrom": { 
    "Date": "2023-04-20T00:00:00+00:00" // Certificate valid from date
  },
  "ValidTo": {
    "Date": "2024-04-19T23:59:00+00:00" // Certificate valid to date
  },
  "TrialRun": false, // Not required. Defaults to false
  "AwaitingVesselChanges": false, //Not required. Defaults to false. Used on vessels that are not completly ready yet
  "Vessel": { // Vessel data must match the registered data in Skipsregistrene
    "Name": "Color Magic", // Vessel Name
    "CallSign": "CM12", // Vessel Callsign
    "Imo": "1234567", // IMO Number
    "HomePort": "Oslo", // Home Port
    "GrossTonnage": "1234.5", // Gross Tonnage. Not Required for CLB. Format 00000.0 or 00000,0
    "ConstructionNumber": "", // Construction Number. Not required. Used for TrialRun
    "Shipyard": "", // Shipyard. Not required. Used for TrialRun
    "Owners": {
      "Owner": [ // List of all owners who are registered in Skipsregistrene 
        {
          "Name": "Color Line Cruises AS", // Name of owner
          "Address": { // The address must match one of the registered address of to the owner in Skipsregistrene
            "StreetAddress": "Veien 1",
            "PostalCode": "1234", // Postnummer, for some addresses the postcode and postal address are not used, so these are not required
            "City": "Oslo",
            "Country": "Norway"
          }
        }
      ]
    }
  },
  "INSURER": {
    "NAME": "GARD", // Name of the insurance company
    "ADDRESS": "Veien 1, 1234 Oslo, Norway" // The address of the insurance company where the certificate is issued
  },
  "NotificationEmailAddresses": [ // List of emails who will receive the issued certificate
    {
      "Address": "ola@nordmann.no", // Email address 
      "DisplayName": null // Not required. Display name in email client
    }
  ]
}
```


### Response
```json
{
  "orderId": "00000000-0000-0000-0000-000000000000",
  "status": "Order Accepted" // evt. Input validation error
}
```


### A - Utstedelse av sertifikat f.eks. til hovedforfall
1. Submit the order
2. Receive Approval OK or error message ([Read more about Error Messages](#error-messages)).
3. [See General Info](#general-info):


### B - Certificate issuance for vessel name change or change of ownership
1. Submit the order. The field "AwaitingVesselChanges" must be set to TRUE.
2. Receive "On Hold: Awaiting Vessel Changes" with or without an "error message".
3. If the shipowner's email address is provided in the order, they will receive an email confirming receipt of the certificate application and stating that the certificate will be issued once the registration is completed in Skipsregistrene.
4. Relevant "error messages": Validation errors from Skipsregistrene. They indicate the data submitted and the data currently registered as of today. Since the data registered as of today is subject to change, this message serves as a check for the case handler.
5. When the "AwaitingVesselChanges" field is set to TRUE, this order will continuously query Skipsregistrene until the registration is completed. Once Skipsregistrene finish the registration and the query finds a match, a new status message will be received:
    - Receive "Change OK" or "Stopped: new error occurred" with a validation error from Skipsregistrene.
    - If the message "Stopped: new error occurred" is received, the order must be corrected based on the data registered in Skipsregistrene and resubmitted. This time, the "AwaitingVesselChanges" field should be set to FALSE since the registration in Skipsregistrene is now completed.
6. General info (see section G):
    - Remember to update the BC (Blue Card) with the information registered in Skipsregistrene.


### C - Certificate issuance for new builds going on trial run
1. Submit the order. The field "TrialRun" must be set to TRUE. You must include the fields "ConstructionNumber" and "Shipyard". 
2. Receive "Trial OK" or an error message ([Read more about error messages](#error-messages)).
3. [See General Info](#general-info):
    - Trial run orders cannot be combined with "AwaitingVesselChanges".


### D - Certificate issuance when a vessel has more than one registered owner
1. Submit the order. The data package can accommodate up to 3 unique owners with their respective address fields.
2. Receive Approval OK or an error message ([Read more about error messages](#error-messages)).
3. [See General Info](#general-info):
    - Orders with more than one owner can be combined with "AwaitingVesselChanges".


### E - Cancellation of issued certificate
1. Submit the order. The field "OperationType" must be set to "Cancel" and the "CertificateId" (looks like this: "0000000-CLB-YY-0001234" also called UTN) must be included.
2. Receive Cancel OK or an error message ([Read more about error messages](#error-messages)).
3. [See General Info](#general-info):
    - If the shipowner's email address is provided in the order, an email will be sent informing that the current certificate has been marked as invalid.
    - The certificate will be marked as invalid on MinSideFartøy, in our system, and on the Verification page.


### Error Messages
- Validation errors from Skipsregistrene
- Date errors on the insurance periods
- Internal system errors
- Internal system errors from the insurance company
- Internal system errors from TS or Elements, are kept internally at SDIR and not shared with the insurance company


### General info
- The certificate will be sent on the production date if the order includes the email address of the shipowner.
- The certificate will be available on MinSideFartøy when the insurance period starts (e.g. 20.02.2024).
- The certificate will also be available in our case management system and on the verification page when the insurance period starts.
- Currently, only CLB and CLC certificates can be received through this service.
- A separate invoice will be generated for each produced certificate and sent to the shipowner.


## Certificate Status
`POST` /api/status
Authorization required


### Body
```json
{
  "orderId": "00000000-0000-0000-0000-000000000000",
}
```


### Response


#### Order does not exists
```json
{
    "status": "Order not found",
    "errors": null,
    "utn": null
}
```


#### Processing
```json
{
    "status": "Processing",
    "errors": null,
    "utn": null
}
```


#### Processing - Certificate Created
```json
{
    "status": "Processing",
    "errors": null,
    "utn": "9349863-CLB-23-0014083" // The certificate has been created with UTN / ID
}
```


#### Certificate Issued - Job Completed
```json
{
    "status": "Certificate Issued",
    "errors": null,
    "utn": "9349863-CLB-23-0014083"
}
```


#### Error Example 1 - Mismatch Address City
```json
{
    "status": "Error",
    "errors": "Step failed: Vessel owner must match registered vessel owner with messages: Following fields of the payload owners did not match any registered vessel owners fields: Name: 'COLOR LINE CRUISES AS', Address: [StreetAddress: 'Veien 1', PostalCode: '1234', City: 'MISMATCH<FREDRIKSTAD>', Country: 'NORWAY'], Registered owners in SR are: Name: 'COLOR LINE CRUISES AS', Addresses: [StreetAddress: 'Veien 1', PostalCode: '1234', City: 'OSLO', Country: 'NORGE']",
    "utn": null
}
```


#### Error Example 2 - Mismatch Call Sign
```json
{
    "status": "Error",
    "errors": "Step failed: Call sign must match registered vessel call sign with messages: The call sign 'CM12' did not match registered call sign 'COLMAG'",
    "utn": null
}
```


#### Error Example 3 - Multiple fails
```json
{
    "status": "Error",
    "errors": "Step failed: Home port must match registered home port with messages: The homeport 'BERGEN_2' did not match registered homeport 'BERGEN'. Step failed: Gross tonnage is at least 1000 for CLB certificate with messages: Gross tonnage '229,000' too low for CLB requirement '1000'",
    "utn": null
}
```