package taudemo;

import browser.BrowserGetter;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.openqa.selenium.WebDriver;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.TestInstance.Lifecycle.PER_CLASS;

@TestInstance(PER_CLASS)
public class WithConfigTest {

    private static BrowserGetter browserGetter = new BrowserGetter();
    private static WebDriver webDriver;

    @BeforeAll
    public static void beforeAll() {
        webDriver = browserGetter.getDriver();

    }

    @AfterAll
    public static void afterAll() {
        webDriver.quit();
    }

    @Test
    public void sampleTest(){
        webDriver.get("https://www.example.com");
        assertEquals("Example Domain", webDriver.getTitle());
    }
}
