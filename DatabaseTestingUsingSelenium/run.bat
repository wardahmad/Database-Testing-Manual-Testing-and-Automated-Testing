cd C:\Users\white\eclipse-workspace\DatabaseTestingWithSelenium
set ProjectPath=C:\Users\white\eclipse-workspace\DatabaseTestingWithSelenium
echo %ProjectPath%
set classpath=%ProjectPath%\bin;%ProjectPath%\lib\*
echo %classpath%
java org.testng.TestNG %ProjectPath%\testng.xml