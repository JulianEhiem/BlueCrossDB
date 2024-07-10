
## Instructions/Notes:

This beginner SQL project uses a database to store information about medical patients for a blood bank. When designing the database or thinking about the data you want to store or query, consider the patient's name, unique ID, blood type, medical history, and phone number as a starting point.

If these concepts seem a little fuzzy, consider refreshing your memory with an [SQL book](https://hackr.io/blog/best-sql-books) or online documentation.

It’s also a good idea to create an Entity-Relationship (E-R) diagram and a schema to start implementing these fields within a database before trying to normalize it.

## Entity-Relationship Diagram:
**Refer to Diagram:** /bloodblank_ERD_diagram.png

## Information needed from applicant:
- Name
- Age (>= 16 years old)
- blood type
- Gender
- date since last whole blood donation (>= 56 days ago)
- weight (>= 110 lbs)
- contact info

## Links
- General information about whole blood donation [here](https://www.redcrossblood.org/donate-blood/how-to-donate/types-of-blood-donations/whole-blood-donation.html)
- Common reasons for donation ineligibility:
    - Illness deferrals, more [info](https://www.redcrossblood.org/faq.html#eligibility-health)
    - Medication deferrals, more [info](https://www.redcrossblood.org/faq.html#eligibility-medications)
    - Travel deferrals, more [info](https://www.redcrossblood.org/faq.html#eligibility-travel)
    -  Low iron deferrals, more [info](https://www.redcrossblood.org/donate-blood/blood-donation-process/before-during-after/iron-blood-donation.html)

## Scope Definition
### MVP:
- As a user, I want to have the ability to add a new donation
- As a user, I want to have the ability to add a new transfusion
- As a user, I want to have the ability to see the last donation
- As a user, I want to have the ability to see the last transfusion
#### Database capabilities:
- [x] Add new data
- [x] Edit data
- [x] Select/ Read data
- [x] Delete data

### Version 1:
- [x] Calculate the blood volume in each blood bank
    - [x] Calculate the blood volume in each blood bank by blood type
- [x] Calculate the current volume in testing
- [x] Calculate the days since a patients last donation
### Version 2:
### Version 3: