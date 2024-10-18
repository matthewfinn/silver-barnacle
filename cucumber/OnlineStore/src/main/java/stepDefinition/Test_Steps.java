package stepDefinition;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.PendingException;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.concurrent.TimeUnit;

import static utils.Elements.*;

public class Test_Steps {
    public static WebDriver driver;

    @Before
    public void setupDriver(){

        // Sets the location of the chromedriver executable used to control the browser
        System.setProperty(CHROME_WEBDRIVER_PROPERTY, CHROME_WEBDRIVER_PATH);

        // Instantiate chrome options so we can specify some details later
        ChromeOptions opts = new ChromeOptions();

        // Add option to maximise the browser
        opts.addArguments(CHROME_WEBDRIVER_MAXIMISED_OPTION);

        // Instantiate ChromeDriver with options
        driver = new ChromeDriver(opts);

        // Specify the amount of time the driver should spend looking for an element before failure
        // TODO: 10 seconds is probably too lengthy but fine for now when I'm playing around with the code
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

    }

    @After
    public void cleanup(){
        if(driver!=null) driver.quit();
    }

    @Given("^User is on the login page$")
    public void user_is_on_the_login_page() {
        // launch the URL
        driver.get(WEB_URL);
        // check that we can see the login banner, located by xpath
        driver.findElement(By.xpath(LOGIN_BANNER_XPATH));

        driver.findElement(By.id(USERNAME_FIELD_TITLE));
        driver.findElement(By.id(USERNAME_FIELD));
        driver.findElement(By.id(PASSWORD_FIELD_TITLE));
        driver.findElement(By.id(PASSWORD_FIELD));


        driver.findElement(By.id(LOGIN_BUTTON_ID));
        driver.findElement(By.id(NEW_USER_BUTTON_ID));
    }
//
//    @When("^User navigates to login page$")
//    public void user_navigates_to_login_page() {
//
//
//    }

    @When("^User enters username and password$")
    public void user_enters_username_and_password() {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Then("^Message displayed login successfully$")
    public void message_displayed_login_successfully() {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @When("^User logs out from the application$")
    public void user_logs_out_from_the_application() {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Then("^Message displayed logout successfully$")
    public void message_displayed_logout_successfully() {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

}
