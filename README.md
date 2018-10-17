# Mentor-Bee API

### Find the perfect mentor.

**Front-End:** https://github.com/freddie1221/mentor-bee-frontend

### Created by:

* [Freddie Lawson](https://github.com/freddie1221)
* [Kar-ho Lee](https://github.com/leekarho)
* [Becky Sedgwick](https://github.com/rebeccasedgwick)
* [Esam Al-Dabagh](https://github.com/EsamAl-Dabagh)

### Quickstart Guide
Clone this repo:
```
$ git clone git@github.com:EsamAl-Dabagh/mentor-bee-api.git
```
Run bundler to install all dependencies:
```
$ bundle install
```
Create the database tables, and run migrations:
```
$ rails db:create
$ rails db:migrate
```
You will also need to run the migrations in the testing environment:
```
$ rails db:migrate RAILS_ENV="test"
```

To run the linter and then the test suite:
```
$ rubocop
$ rspec
```
Test coverage will be displayed after the results of the tests, as Simplecov is configured to automatically run.

### User Stories

```
As a user
So that I can see who is available
I want to be able to see a list of all mentors
```

```
As a user
So that I can find a mentor
I want to be able to sign up
```

```
As a user
So that I can see more info about a potential mentor
I want to be able to view their profile
```

```
As a mentor
So that I can make myself available
I want to be able to create a mentor profile
```

----
## Models & Associations

Notes on associations:
- User has_one mentor / mentee, this has been set to optional (i.e. if a user wanted to only be a mentor or mentee).
- Association of `has_one` has been used, so that a User only has one set of info for them as either a Mentor or Mentee: they cannot have multiple 'profiles' as a Mentee, for example.
- A User may be a mentor to multiple mentees (or be a mentee to multiple users); however as the Mentor and Mentee tables are for the bio / interest / skills data, any given user can only appear once in these tables. The actual mentorship relationships (of which they can have multiple) are held in the Mentorships table.

**Users**  
CRC card:

| Responsibilities | Collaborators |
|------------------|---------------|
| create           |               |
| name             |               |
| email            |               |
| password         |               |
| picture          |               |

Database table: Users

| id | name    | email             | password | picture |
|----|---------|-------------------|----------|---------|
| 01 | Alice   | alice@email.com   | ******   | url     |
| 02 | Bob     | bob@email.com     | ******   | url     |
| 03 | Charlie | charlie@email.com | ******   | url     |
| 04 | Dave    | dave@email.com    | ******   | url     |
| 05 | Emma    | emma@email.com    | ******   | url     |

---
**Mentor**  
CRC card:


| Responsibilities | Collaborators |
|------------------|---------------|
| user id          | User          |
| bio              |               |
| skills           |               |

Database tables: Mentors  
_Contains the skills mentors are able to share with mentees_

| id | user_id | bio               | skills                      |
|----|---------|-------------------|-----------------------------|
| 01 | 01      | Marine biologist  | Cetology (dolphinology)     |
| 02 | 05      | Parachuting       | Aerodynamics and ergonomics |
| 03 | 04      | Retired astronaut | Astronomy and astrophysics  |


---
**Mentee CRC**  
CRC card:


| Responsibilities | Collaborators |
|------------------|---------------|
| user id          | User          |
| bio              |               |
| interests        |               |


Database tables: Mentees  
_Contains the interests mentees are looking to be mentored_

| id | user_id | bio                | interest                 |
|----|---------|--------------------|--------------------------|
| 01 | 02      | Ex-mathematician   | Rocket building          |
| 02 | 03      | Landscape gardener | Paper plane optimisation |
| 03 | 03      | Landscape gardener | Costal flora             |

---
**Mentorships**  
CRC card:

| Responsibilities | Collaborators |
|------------------|---------------|
| mentor user id   | Mentor        |
| mentee user id   | Mentee        |

Database table: Mentorships

| id | mentor_id | mentee_id |
|----|-----------|-----------|
| 01 | 03        | 02        |
| 02 | 02        | 01        |
| 03 | 01        | 03        |

- Having a Mentorships table allows each mentoring relationship to have an unique ID
- This table shows mentoring relationships:  
  - Alice mentors Bob  
  - Emma mentors Charlie  
  - Dave mentors Alice  
