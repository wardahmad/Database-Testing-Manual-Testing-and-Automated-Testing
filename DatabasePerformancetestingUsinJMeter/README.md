## Database Performance Testing
### Testing Database server using `JMeter`:

- Download and install `MySQL` Free Community Edition.
- Download `apache jmeter`.
- Create a Database from <a href='../DbBankManagment-MySQL.sql'>Here</a>
- <b>Prerequisite:</b>
- From your Database you need:
    - Database Name: `dbbankmanagement`
    - Server Name: `localhost`
    - Port number: `3306`
    - User Name: `root`
    - Password: `XXXX` >> My Password :) 
    - Add `mySQL Connector` Jar file to `lib` folder of Jmeter.
    - https://dev.mysql.com/downloads/connector/j/8.0.html
    - Platform Independent > Download the ZIP File
- Unzip `apache-jmeter-5.5` Go to `bin` and Double Click on `jmeter` type `Windows Batch File`

<img src='img/img1.png' /></br></br>
<img src='img/img2.png' /></br></br>

- Right Click on `Test Plan` > `Add` > `Thread Group` 
- Save `DatabaseTesting.jmx`
- Add `mySQL Connector` Jar file to `lib` folder of JMeter.

<img src='img/img3.png' /></br>

- Restart JMeter.

## Database testing JMeter:

### Step 1: Make Connection with Database

- Go To `JMeter`.
- Right Click on `Test Plan` > `Add` > `Config Element` > `JDBC Connection Configuration` : To Configure JMeter Connection with the Database.
- Inside `Database Connection Configuration`:
	- Database URL: `jdbc:mysql://localhost:3306/dbbankmanagement`.
	- JDBC Driver class: `com.mysql.jdbc.Driver` >> Becose I'm Using MySQL Server.
	- Username: `root`.
	- Password: `XXXX`.
- You Can change `Connection Pool Configuration` and `Connection Validation by Pool`, But I'll keep it with the default values.
- Provide a variable Name, Inside Variable Name for created pool: `dBVariableName`.

<img src='img/img4.png' /></br>
<img src='img/img5.png' /></br>

### Step 2: Write SQL Query
- Add Sampler Request
- Right Click on `Thread Group` > `Add` > `Sampler` > `JDBC Request`
- Put the variable name: `dBVariableName`
- Choose the `Query Type` and Write the Query you want in the `Query TextBox`.
- Add Listener, Right Click on `Thread Group` > `Add` > `Listener` > `View Results Tree` and `View Results in Table`.
- Add more `JDBC Request`, Based on Project Requirements.

<img src='img/img6.png' /></br>
<img src='img/img7.png' /></br>
<img src='img/img8.png' /></br>
<img src='img/img9.png' /></br>


### Step 3: Execute the Test
- Start the Execution.

- <a href='https://youtu.be/NFYAov9EvWI'>Recorded video, while Automated testing using JMeter is running</a></br>

<img src='img/img11.png' /></br>
<img src='img/img12.png' /></br>
<img src='img/img13.png' /></br>
<img src='img/img14.gif' /></br>
<img src='img/img10.gif' /></br>


