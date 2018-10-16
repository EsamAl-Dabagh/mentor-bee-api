# Mentor-Bee API

### Find the perfect mentor.

**Front-End:** https://github.com/freddie1221/mentor-bee-frontend

### Created by:

* [Freddie Lawson](https://github.com/freddie1221)
* [Kar-ho Lee](https://github.com/leekarho)
* [Becky Sedgwick](https://github.com/rebeccasedgwick)
* [Esam Al-Dabagh](https://github.com/EsamAl-Dabagh)

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
##Models & Associations

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
| skills           |               |


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

_Having a Mentorships table allows each mentoring relationship to have an unique ID_  
This table shows mentoring relationships:  
Alice mentors Bob  
Emma mentors Charlie  
Dave mentors Alice  
