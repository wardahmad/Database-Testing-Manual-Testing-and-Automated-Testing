## Database Testing using Selenium:

### How to set up the testing environment:
- Open `MySQL Workbench`.
- Create `dbBank` DataBase.
- Create `UserLogins` Table.
- Insert the values into the Table.
```sql

create database dbBank;
use dbBank;

CREATE TABLE UserLogins
(
	UserLoginID SMALLINT NOT NULL,
	UserLogin VARCHAR(50) NOT NULL,
	UserPassword VARCHAR(20) NOT NULL,
	CONSTRAINT pk_UL_UserLoginID PRIMARY KEY(UserLoginID)
);

/** INSERT rows section **/
insert into UserLogins values(0, 'SamiUser', 'Pass1');
insert into UserLogins values(1, 'AsmaUser', 'Pass2');
insert into UserLogins values(2, 'AdelUser', 'Pass3');
insert into UserLogins values(3, 'ReemUser', 'Pass4');
insert into UserLogins values(4, 'WardahUser', 'Pass5');
```
<img src='img/img1.png' /><br/>

- Open Eclipse.
- Create a new project `DatabaseTestingUsingSelenium`.
- Create a new package > Create a new Class `DatabaseTestingUsingSelenium`.
- You can Download `mysql-connector-java-X.X.XX.jar` jar file from here: https://dev.mysql.com/downloads/connector/j/ , Choose `Platform Independent` and download the ZIP folder.
- Click on Modulepath > Click on Add External JARs, and choose `mysql-connector-java-X.X.XX.jar`, the jar file from your device.
- You can Download `selenium-server-X.X.X.jar` file from here: https://www.selenium.dev/downloads/
- Click on Classpath > Click on Add External JARs, and choose `selenium-server-X.X.X.jar`,the jar file from your device.
- Click on Classpath > Add Library > TestNg > Next > Finish.
- Click on `Apply and Close`.
<img src='img/img2.png' /><br/>