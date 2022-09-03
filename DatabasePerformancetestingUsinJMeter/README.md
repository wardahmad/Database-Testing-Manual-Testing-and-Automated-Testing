## Database Performance Testing
### Test Database server using JMeter:

- Download and install `MySQL` Free Community Edition.
- Download `apache jmeter`
- Create a Database from <a href='../DbBankManagment-MySQL.sql'>Here</a>
- <b>Prerequisite:</b>
- From your Database you need:
    - Database Name: `dbbankmanagement`
    - Server Name: `localhost`
    - Port number: `3306`
    - User Name: `root`
    - Password: `1234` >> My Password :) 
    - Add `mySQL Connector` Jar file to `lib` folder of Jmeter 
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