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
- inventory
- employee
- product
- return
- region
- firmware
- department
- supplier


## Conceptual diagram


<img width="831" height="881" alt="conceptual" src="https://github.com/user-attachments/assets/f10ef388-b01d-44f8-85ca-b2b3ce1eba8d" />





