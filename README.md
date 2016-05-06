# README

This application serves a few purposes for my day job, focusing on improving coordination with better communication tools. With better tools productivity can be increased.

## To-Do
- Refactor Inventory Reports to make room for Wireless Routers & Technician selection via dropdown
- Figure out a way to scope Inventory Reports weekly, so on Monday when reports are entered it goes for a week until the next Monday.
- Finish up Service Request's functionality.
- Add 'Activity' to Service Requests to allow users to update ServiceRequests with notes/actions taken.
- Allow the ability to upload photos to Service Requests. (Useful for things like Speedtests/Damages etc.)
- Determine a way to have notifications for Messages/Service Requests etc.
- Metrics for service requests, most common complaint, reasons for issues etc.

## User Stories to work towards
- **As a user I want to be able to message technicians and receive replies to the messages.(DONE)**
  - The ability to send predetermined messages would be useful. (Ex: 'Looking for an ETA for your PM jobs', 'What did you do on your Repairs?')
- **As a user I want to be able to see the location of all of the technician's homes on a map on the technicians page.(DONE)**
- As a user I want to be able to deactivate / reactivate technicians when they leave or are hired back.
- As a user I want to be able to select a Technician's name from a dropdown on the Inventory Reports page.

## Notes
Activity:
```
Activity.rb
---
belongs_to :service_request
has_one :user
has_many :photos

Service Request:
has_many :activities
```

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
