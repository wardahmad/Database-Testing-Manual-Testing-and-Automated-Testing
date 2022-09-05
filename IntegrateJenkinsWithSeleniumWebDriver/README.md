### Continuous integration: Integrate Jenkins With Selenium WebDriver 
### I'll use <a href='../DatabaseTestingUsingSelenium'>This Project</a>, to Integrate Jenkins With it.
### Setup Jenkins:
- Setup Jenkins in your local Machine
    - Download and Install Jenkins, https://www.jenkins.io/download/
    - Open `CMD`
    - Run `Java -version`, to check if java is Installed Successfully.
    - Run `java -jar jenkins.war`
    - If you are getting any errors try this command: `java -jar jenkins.war --enable-future-java --httpPort=9090`
    - Save the password.

<img src='img/img1.png' /></br>

- Open the browser: http://localhost:9090/
- Enter the password and click continue

<img src='img/img2.png' /></br>

- Click Install Suggested plugins

<img src='img/img3.png' /></br>

- Fill in the Details

<img src='img/img4.png' /></br>
<img src='img/img5.png' /></br>
<img src='img/img6.png' /></br>
<img src='img/img7.png' /></br>

### Selenium WebDriver Project

- In the project folder, create the `lib` folder.
- Add all JARs files in this folder `lib`.
- Create `bat` File in the project Folder.
- the `bat` file content:

```bat
cd C:\Users\white\eclipse-workspace\DatabaseTestingUsingSelenium
set ProjectPath=C:\Users\white\eclipse-workspace\DatabaseTestingUsingSelenium
echo %ProjectPath%
set classpath=%ProjectPath%\bin;%ProjectPath%\lib\*
echo %classpath%
java org.testng.TestNG %ProjectPath%\testng.xml
```

### Jenkin Dashboard is Ready
- Click on `New Item`
- Enter a Project name
- Click on `Freestyle Project`

<img src='img/img8.png' /></br>

- Advanced > Use custom workspace.
- Enter the project path.

<img src='img/img9.png' /></br>

- Build > Execute Windows batch command > Click on Apply

<img src='img/img10.png' /></br>

- Click on Save

<img src='img/img11.png' /></br>

- Click on Build Now

<img src='img/img12.png' /></br>






