package dBAndSelenium;

import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class DatabaseTestingUsingSelenium {
	public WebDriver driver;

	@Test
	public void databaseTestingUsingSelenium() throws ClassNotFoundException, SQLException, InterruptedException {

		// chrome driver path
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\white\\Desktop\\QA\\Auto\\chromedriver14\\chromedriver.exe");

		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.navigate().to("https://new.alahlionline.com/ui/#/login/full-login-login");

		Class.forName("com.mysql.cj.jdbc.Driver");

		// here dbbank is the database name, root is serverName and 1234 is
		// serverPassword
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbbank", "root", "1234");
		Statement stmt = con.createStatement();

		// Select all rows in userlogins table
		ResultSet rs = stmt.executeQuery("select * from userlogins");

		// Read every row
		while (rs.next()) {

			// Declare a variable and assign to it the value of the column in the
			// `userlogins` tabel
			String userName = rs.getString(2);
			String userPassword = rs.getString(3);

			WebElement userElement = (new WebDriverWait(driver, Duration.ofSeconds(100)))
					.until(ExpectedConditions.elementToBeClickable(By.id("login-username")));

			userElement.sendKeys(userName);
			Thread.sleep(1000);

			WebElement passwordElement = driver.findElement(By.id("login-password"));
			passwordElement.sendKeys(userPassword);
			Thread.sleep(1000);

			WebElement buttonElement = driver.findElement(By.xpath("//*[@buttonid='button-login1']"));
			buttonElement.click();
			Thread.sleep(1000);

			// Clear the input value
			userElement.clear();
			passwordElement.clear();

			// Refresh the page
			driver.navigate().refresh();
			Thread.sleep(1000);

		}
		// Close the database connection
		con.close();
		// close the chrome page
		driver.close();

	}

}
