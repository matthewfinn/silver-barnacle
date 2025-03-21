# Chapter 8 - Using Locators for Testing

## Coded versus Codeless Tools
When it comes to automating Web UI tests, there are two main categories of tools: codeless and coded.

"Codeless" tools enable testers to write test procedures using some sort of form, builder, or recorder without the use of a programming language.

"Coded" automation tools are test automation frameworks and programming packages. 

The “big three” these days are:

Selenium WebDriver
Cypress
Playwright
There are other great tools as well, such as WebdriverIO, Robot Framework, Puppeteer, TestCafe, and Nightwatch

## Automating Tests with Selenium WebDriver (Java)
Java using JUnit and Selenium WebDriver
Example code:

[sourcecode](https://github.com/AndyLPK247/tau-locators-java-webdriver)

Very basic test
```java
package tests;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

public class SimpleWebTest {

    private WebDriver driver;
    private WebDriverWait wait;

    @BeforeEach
    public void initWebDriver() {
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, 30);
    }

    @Test
    public void searchDuckDuckGo() {
        // Load the page
        driver.get("https://www.duckduckgo.com");

        // Enter search phrase
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("search_form_input_homepage")));
        WebElement searchInput = driver.findElement(By.id("search_form_input_homepage"));
        searchInput.sendKeys("giant panda");

        // Click search button
        WebElement searchButton = driver.findElement(By.id("search_button_homepage"));
        searchButton.click();

        // Wait for results to appear
        wait.until(ExpectedConditions.titleContains("giant panda"));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.results_links_deep a.result__a")));

        // Make sure each result contains the word "panda"
        List<WebElement> resultLinks = driver.findElements(By.cssSelector("div.results_links_deep a.result__a"));
        for (WebElement link : resultLinks) {
            assertTrue(link.getText().matches("(?i).*panda.*"));
        }
    }

    @AfterEach
    public void quitWebDriver() {
        driver.quit();
    }
}
```


Arguably, the most popular design pattern for modeling Web UI interactions for test automation is called the page object model.
This just provides some basic attributes to be shared by all pages.

```java
package pageobjects;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class DuckDuckGoSearchPage extends AbstractPage {

    public final static By searchInput = By.name("q");
    public final static By searchButton = By.id("search_button_homepage");

    public DuckDuckGoSearchPage(WebDriver driver) {
        super(driver);
    }

    public void loadPage() {
        getDriver().get("https://www.duckduckgo.com");
    }

    public void search(String phrase) {
        getWait().until(ExpectedConditions.visibilityOfElementLocated(searchInput));
        getDriver().findElement(searchInput).sendKeys(phrase);
        getDriver().findElement(searchButton).click();
    }
}
```

Also, it's fairly common practice to have a base page like our abstract page here.
```java
package pageobjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

public abstract class AbstractPage {

    private final static int TIMEOUT = 30;

    private WebDriver driver;
    private WebDriverWait wait;

    public AbstractPage(WebDriver driver) {
        this.driver = driver;
        this.wait = new WebDriverWait(driver, TIMEOUT);
    }

    public WebDriver getDriver() {
        return driver;
    }

    public WebDriverWait getWait() {
        return wait;
    }
}
```

Test re-written with page objects 
```java
package tests;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import pageobjects.DuckDuckGoResultsPage;
import pageobjects.DuckDuckGoSearchPage;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class PageObjectWebTest {

    private WebDriver driver;

    @BeforeEach
    public void initWebDriver() {
        driver = new ChromeDriver();
    }

    @Test
    public void searchDuckDuckGo() {
        DuckDuckGoSearchPage searchPage = new DuckDuckGoSearchPage(driver);
        searchPage.loadPage();
        searchPage.search("giant panda");

        DuckDuckGoResultsPage resultsPage = new DuckDuckGoResultsPage(driver);
        List<String> linkTexts = resultsPage.getResultsLinkText("panda");

        for (String text : linkTexts) {
            assertTrue(text.matches("(?i).*panda.*"));
        }
    }

    @AfterEach
    public void quitWebDriver() {
        driver.quit();
    }
}
```

## Better Interactions with the Screenplay Pattern
Page objects are okay for small-scale test automation projects, but for larger projects, 
I strongly recommend the Screenplay Pattern. Screenplay is like a SOLID refactoring of page objects.
The Screenplay Pattern separates concerns by splitting locators and interactions into separate classes for even greater reusability and composability.

There are a few major Screenplay implementations available:
* In Java, use Serenity BDD
* In JavaScript, use Serenity/JS
* In C#, use Boa Constrictor

## Resources
* [automationpanda](https://automationpanda.com/2019/01/15/web-element-locators-for-test-automation/) 
* [selenium hq](https://www.seleniumhq.org/) 
* [page object](https://martinfowler.com/bliki/PageObject.html) 
* [Beyond-Page-Objects-Test-Automation-Serenity-Screenplay](https://www.infoq.com/articles/Beyond-Page-Objects-Test-Automation-Serenity-Screenplay)  
* [SOLID](https://en.wikipedia.org/wiki/SOLID) 
* Screenplay Pattern implementations:
  * In Java: [Serenity BDD](https://serenity-bdd.info/)
  * In JavaScript: [Serenity/JS](https://serenity-js.org/)
  * In C#: [Boa Constrictor](https://q2ebanking.github.io/boa-constrictor/)