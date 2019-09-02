Online competence test app, dedicated to NGOs. It allows NGOs to find out which competencies volunteers developed through its projects.

##Table of contents

* [Background](#background)
* [Features](#features)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Status](#status)
* [Contact](#contact)

##Background

BACKGROUND/ GENERAL DESCRIPTION:

Volunteers support non-governmental organisations (NGOs) with different activities: they do administrative works (e.g. project coordination, office assistance), (co-)organize events, do promotion and fundraising, share their skills, etc. There are different reasons they do it: sometimes NGO's mission is important for them (e.g. they care for ecology), sometimes they want to gain some job experience, and sometimes they just want to pay-off, because someone helped them in the past.
But no matter the reason, the fact is that every volunteering experience is an opportunity for them to develop crucial soft skills and transversal competencies that may be valuable on the labour market.

Thanks to this app NGOs can:

    1. Generate a competence test for a particular project,
    2. Ask volunteers to fill it in by sendng them an automatic invitation,
    3. View the results: find out, what volunteers learnt through this project.

Benefits:

    - NGO becomes more aware on which competencies can be developed within its projects - thus, it becomes more attractive for volunteers.
    - Volunteers are empowered - they become more aware of their competencies and learn how to valuate their experience.

##Features

HOW IT WORKS?

NGOs' perspective:

    - NGO regiesters.
    - After logging-in, the NGO generates a competence test for its project: enters project's name and description, and saves it.
    - Then, the NGO can invite volunteers: types volunteer's name and email address, and the app: 
        1). checks, whether such volunteer is already in the database. If, so, it updates his/her "competenceTests" field. If not, creates new record in the database, 
        2). sends the email invitation to the volunteer.
    - Volunteer logs in, takes the competence test and saves it. (S)he is redirected to the results page.
    - NGO can view cumulative results for the project.
    - In it's dashoboard, the NGO can: create a new project, view and edit all its competence tests, as well as view the overall tests' statistics (for all tests alogether).

Volunteer's perspective:

    - Volunteer receives an invitation.
    - (S)he clicks on the link and log-in.
    - (S)he takes the competence test and saves it.
    - (S)he is redirected to the results page where (s)he can see her/his results, together with the development tips for each competence.
    - On her/his dashboard volunteer can view all competenceTests, take the test and view the results of the tests already taken.
    
    Note: volunteer cannot register himself/herself - (s)he must receive an intivation to use to app.

##Screenshots

![choose-screening](/img/CompetenceTest_Home.png)
![choose-tickets](/img/CompetenceTest_Home2.png)
![choose-tickets](/img/CompetenceTest_Home3.png)
![choose-tickets](/img/CompetenceTest_Home4.png)
![choose-tickets](/img/CompetenceTest_Home5.png)

##Technologies

USED TOOLS/FRAMEWORKS:

- Java: Spring MVC 
- Database: MySQL + JPA: Hibernate + Spring Data
- Layout: HTML (.jsp, taglibs: JSTL, Spring's form tag library)
- Styling: CSS/Bootstrap, libraries: font-awesome, ionicons, animate, Chart.js
- Scripting: Javascript
- IntelliJ Ultimate Edition, Workbench

## Setup

You can use several ways to run this app:
1. If you use IDE (e.g. IntelliJ, Eclipse), download the whole project. Double-click on the pom.xml file (Project Object Model - it is the fundamental unit of work in Maven that contains information about the project and configuration details used by Maven to build the project). Double-clicking should call "open as a project" option of your IDE.  

2. If you use application Java EE-compliant server like Tomcat, JBoss, Glassfish, etc., download the whole project, open project and use command:
> mvn clean install

It will build a project and create a WAR file - WAR (Web ARchive) is the standard container file format for packaging Java EE applications as a single, deployable unit which can be deployed on such application servers. You can use this tutorial: https://www.baeldung.com/tomcat-deploy-war

## Status

Project is: _in progress_ 

To-do list (for future development):
* move the business logic from the OrderingProcessController to services.
* do the refactoring.
* add Lombok.
* add unit tests.

## Contact

Created by [Marzena Kacprowicz](http://zrobtowinternecie.pl/) - feel free to contact me!

