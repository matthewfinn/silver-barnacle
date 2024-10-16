package cucumberTest;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class SeleniumTest {
    private static WebDriver driver = null;
    private static String chromeWebdriverProperty = "webdriver.chrome.driver";
    private static String chromeWebdriverPath = "D:\\Documents\\Repositories\\jars\\chromedriver-win64\\chromedriver.exe";
    private static String launchUrl = "https://demoqa.com/login";
    public static void main(String[] args) {

        System.out.println("Start Successfully");

        // set location of chromedriver on machine
        System.setProperty(chromeWebdriverProperty, chromeWebdriverPath);

        // Create a new instance of the Chrome driver
        driver = new ChromeDriver();
        System.out.println("Start Successfully 1");

        //puts an implicit wait, this means that any search for elements on the page could take the time the implicit wait is set for before throwing exception
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        //Launch the Online Store Website
        driver.get(launchUrl);

        driver.manage().window().maximize();

        // Find the element that's ID attribute is 'account'(My Account)

        //driver.findElement(By.xpath(".//*[@id='account']/a")).click();

        // Find the element that's ID attribute is 'log' (Username)

        // Enter Username on the element found by above desc.

        driver.findElement(By.id("userName")).sendKeys("testuser_1");

        // Find the element that's ID attribute is 'pwd' (Password)

        // Enter Password on the element found by the above desc.

        driver.findElement(By.id("password")).sendKeys("Test@123");

        // Now submit the form. WebDriver will find the form for us from the element

        driver.findElement(By.id("login")).click();

        // Print a Log In message to the screen

        System.out.println("Login Successfully");

        // Find the element that's ID attribute is 'account_logout' (Log Out)

        driver.findElement (By.xpath(".//*[@id=\"submit\"]")).click();

        // Print a Log In message to the screen

        System.out.println("LogOut Successfully");

        // Close the driver

        driver.quit();

    }

}