## Automate SQL Stored Procedures (Using TestNG Framework - JDBC)

- Download and Run Eclipse.
- Create a new Maven project.
    - From the File menu, select New > Project.
    - The New Project screen opens.
    - Expand Maven, select Maven Project, and click Next.
    - The New Maven project wizard opens.
    - Select Create a simple project, and Click Next

<img src='img/img1.png' /></br>

- Enter Group ID and Artifact ID

<img src='img/img2.png' /></br>
<img src='img/img3.png' /></br>

- In `\src\test\java` Create a new Packege, `StoredProceduresTesting`
- In `pom.xml` Add Dependency >
    - Go to https://mvnrepository.com/
    - Search For `MySql`, `lang3` and `TestNG`, Click on the latest version, Copy the Dependency, and Paste it inside `<dependencies></dependencies>` Tag.

<img src='img/img4.png' /></br>

- Create a `TestNG` class `SP_MySQL_Testing`, In the `StoredProceduresTesting` Packege.
- Create the Test Cases.
