# Solution

## Functional Requirements

- Tenant can view and book property viewing from a set of scheduled time slots
- Property manager can schedule availabilities (time slots) with some restrictions (See below).
- Property manager can view details of who made bookings

## Implementation Details

> 
> Because the requirement was meant to be ambiguous, I made a number of assumptions, particularly around the time slots restrictions

### Database Design

**Tables:**
- availabilities
- listings
- booking
- users

Property manager ie **user** manages listings. He/She can schedule availabilities or viewing time slots for each listing. The restrictions are:

- Time slot has to be in the future and its start time has to be within operation hours of the manager. It's currently hardcoded to be between 9am and 5pm everyday
- Time slot needs to be 30 minutes minimum.
- Only one tenant can book a time slot. If someone else tries to book the same time, they will get an error message.
- Availabilities cannot overlap. Each one is associated with only one booking as previously stated.

### Technical Details

Even though the requirement excluded authentication. I used rails default authentication mechanism to distinguish property manager and tenant access. This mechanism is limited but serves this POC well.

Turbo rails is used to handle UI interaction in admin view. There's no custom javascript except *modals_controller.js* which is used to control Bootstrap modal.

Scheduling availabilities is handled by a scheduler service which is extended from **Schedule::Base**. The goal here is we can have different way to schedule availabilities. One idea is batch scheduling which allows creating multple availabilities within a day or across multiple days. I ran out of time to implement this service however. The provided service **Schedule::Single** can schedule one time slot at a time.

### Productionisation

**Questions to clarify due to ambiguity**

- Can tenant make more than one booking per listing? Currently they can book as many as they want, as long as there are available time slots
- Time slot duration flexibility. Should it be fixed ie 1 hour instead of letting admin choosing any number at the moment?Also what is its sensible limit?


**Improvements to consider**

- User session does not expire. We want it to be expired after certain time, ideally a sliding window timeout so that admin user can continue working without interruption.
- Move hardcoded operation hours into an app config if it is a global setting.
- Even though not needed, having background jobs to notify changes are crucial for this type of app. For example, tenant and property manager should receive emails about confirmed viewing respectively.


**Other ideas to make the app more useful**

- Ability to cancel or reschedule viewing
- Booking notification eg sms reminder
- Allow tenant to inquire for viewings when there are no available time slots, possibly a separate submission form.



