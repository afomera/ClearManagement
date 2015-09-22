# README

This application is for improving the ability to track equipment for my day job.

## Notes

Inventory Reports should include:
* Tech it belongs to
* \# of Dishes
* \# of Cannisters
* \# of Modems
* \# of Radios
* \# of upgrade kits (raven & prodilin)
* \# of VoIPs/ATA's
* \# of Trimasts
* \# of HN9000 Equipment

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
* Location
* assigned_to


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
