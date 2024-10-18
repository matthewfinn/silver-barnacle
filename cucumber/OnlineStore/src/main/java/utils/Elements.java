package utils;

public class Elements {

    //Chromedriver stuff
    public static final String CHROME_WEBDRIVER_PROPERTY = "webdriver.chrome.driver";
    public static final String CHROME_WEBDRIVER_PATH = "D:\\Documents\\Repositories\\jars\\chromedriver-win64\\chromedriver.exe";
    public static final String CHROME_WEBDRIVER_MAXIMISED_OPTION = "--start-maximized";

    //URL
    public static final String WEB_URL = "https://demoqa.com/login";

    //XPaths
    public static final String ACCOUNT_XPATH = ".//*[@id='account']/a";
    public static final String LOGIN_BANNER_XPATH = "//*[@id=\"app\"]/div/div/div/div[2]/div[2]/h1";

    //IDs
    public static final String LOGIN_BUTTON_ID = "login";
    public static final String NEW_USER_BUTTON_ID = "newUser";
    public static final String USERNAME_FIELD_TITLE = "userName-label";
    public static final String USERNAME_FIELD = "userName";
    public static final String PASSWORD_FIELD_TITLE = "password-label";
    public static final String PASSWORD_FIELD = "password";
}
