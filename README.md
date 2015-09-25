# README

This application is for improving the ability to track equipment for my day job.

## Notes
Service Requests should include:
* Status (Open, In Progress, Completed, Closed)
* Location
* Customer Name
* Customer Phone Number
* Customer Email Address

Time Management should include:
- Ability to Track time spent on jobs
* Needs: Date of work, job site, Time start, Time end, Description
* Would like: Ability when generating card, to add up time spent to hours, and if the user is enabled for 2 hour min, then use that option for them if (time.end - time.start < 2 hours)

Inventory Reports should include:
* Tech it belongs to
* \# of Dishes
* \# of Cannisters
* \# of Modems
* \# of Radios
* \# of upgrade kits (raven & prodilin)
* \# of VoIPs/ATA's
* \# of Trimasts
* Notes with HN9000 EQ or other things to note

**User Roles**
> These roles help to define what a User can or cannot do based of the role. I.E Some users who are 'technicians' should not be able to do things like add technicians

* Guest (cannot do anything. Needs to be 'promoted')
* Technician (base level access, see Dashboard with information they may need/be relevant)
* Lead Technician (manages techs, able to promote or demote Tech <-> Guest, able to see all of the techs information)
* Employee
* Administration

**Technician**
> This is a Technician but could be considered a Stocking Location

* Name
* Phone Number
* Email Address
* Address
* Drop Location (where we drop shipments off)


**Small Parts:**
>This is consumable material used by the Technician on the job site.

* Part Name
* Part Number
* Part Description
* Vendor

**Vendor:**
>This is who/where we buy material or equipment from.

* Vendor Name
* Vender Address
* Vender Phone Number
* Sales Rep
* Vendor Website (Not required)

**Equipment**
>This is a piece of equipment that's trackable/assignable. For example 4 Dishes are
assignable to a Technician but not trackable and a Modem or Radio is assignable AND trackable because it has a serial number with it.

* Part
* Technician


## Associations
```
Vendor:
has_many :parts

Parts:
belong_to :vendor
```

## Wants / Goals
* Ability to allow techs to 'request/order' Small Parts/Material
* Ability to Invoice / Credit Technicians accounts
* Ability to only get past 7 days of Inventory Reports
* Pagination on Reports
* Email Reminders to Technicians to submit reports & Email Reminder to Staff to send in compiled report Monday AM.
