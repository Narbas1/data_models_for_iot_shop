# Project purpose

Complete data model for imaginary IoT devices online shop. This includes both normalized schema for OLTP and denormalized schema for OLAP.


## How this business operates?

- Orders IoT devices from single supplier
- Writes firmware to the devices
- Sells devices to customer either in retail or in bulk
- Can issue returns in a certain time window for all order types
- Has a single inventory space for all devices


## Tables

- customer
- order
- payment
- employee
- product
- deviceUnit
- return
- address
- firmware
- firmwareInstall
- developmentParticipation
- department
- supplier
- supplyAgreement


## Conceptual diagram

<img width="881" height="881" alt="final_conceptual" src="https://github.com/user-attachments/assets/7d854dfb-c68f-40cc-b44e-d9c461dd5db1" />







