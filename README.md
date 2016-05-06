# README

This application is for improving the ability to track equipment for my day job.


## User Stories to work towards
- As a user I want to be able to message technicians and receive replies to the messages.
  - The ability to send predetermined messages would be useful. (Ex: 'Looking for an ETA for your PM jobs', 'What did you do on your Repairs?')
- **As a user I want to be able to see the location of all of the technician's homes on a map on the technicians page.(DONE)**
- As a user I want to be able to deactivate / reactivate technicians when they leave or are hired back.

## Misc Thoughts on the Messaging Situation
- Need to be able to see the conversation between the technician and the sender/staff (be it app user/company or whatnot).
- When a reply comes in from a phone number that is known it will be added to the conversation itself.
- when a reply comes in from a phone number that is unknown an error will dispatch an email to the admins
- When a message is sent from the staff it is sent via twilio's api to the phone number of the tech on file / added to the conversation
- Conversation belongs_to :technician & :user, allows us to do current_user.conversations/technician.conversations?(would a has_one be better for the technician as they can only have one)
- Would like the conversation to be in a modal window similar to how Twitters DMs are. Easy to type a reply and click enter/send. replying on the techs side is just a reply via text so format on mobile really doesn't matter here too much.

## More ideas real quick to jot down
- Technician view can hold the Conversation which holds all the messages / gives a form to send a reply
- also can act as a sort of dashboard of records for the future like payment records/equipment stock and so forth.
- For the moment, going with a Conversations view which you can click on a person -> then see the messages, ideally will move this to the technician page in the future.


```Message.rb
# https://www.twilio.com/docs/api/rest/message
status - pending, sent, delivered, received, undelivered, failed
body - content of the text message (up to 1600 characters long)
Direction - The direction of this message. inbound for incoming messages, outbound-api for messages initiated via the REST API, outbound-call for messages initiated during a call or outbound-reply for messages initiated in response to an incoming message.
sid - Unique ID that identifies the resource
MessagingServiceSid - MessagingService SID if used, otherwise will be null
From - Outgoing messages will be from one of the Twilio numbers on the account, incoming messages it will be from the sender.
To - Recipient of the message, for outgoing ones, it'll be the destination phone number, incoming will be one of the Twilio numbers
media -
```


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
