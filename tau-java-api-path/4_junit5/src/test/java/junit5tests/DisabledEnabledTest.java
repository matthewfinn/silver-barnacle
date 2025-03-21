package junit5tests;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.*;

import java.time.DayOfWeek;
import java.time.LocalDateTime;

public class DisabledEnabledTest {

    @Test
    @Disabled
    void firstTest() {
        System.out.println("This is the first test method");
    }

    @Test
    @Disabled(value = "Disabled for demo")
    void secondTest() {
        System.out.println("This is the second test method");
    }

    @Test
    @DisabledOnOs(OS.WINDOWS)
    void thirdTest() {
        System.out.println("This is the third test method");
    }

    @Test
    @DisabledOnOs(value = OS.WINDOWS, disabledReason = "Disabled for demo of " +
            "@DisabledOnOs")
    void fourthTest() {
        System.out.println("This is the fourth test method");
    }

    @Test
    @EnabledOnOs(OS.WINDOWS)
    void fifthTest() {
        System.out.println("This is the fifth test method");
    }

    @Test
    @DisabledIfSystemProperty(named = "env", matches = "staging",
            disabledReason = "Disabled for demo of @DisabledIfSystemProperty")
    void sixthTest() {
        System.out.println("This is the sixth test method");
    }

    @Test
    @DisabledIf(value = "provider", disabledReason = "Disabled for demo of @DisabledIf")
    void seventhTest() {
        System.out.println("This is the seventh test method");
    }
    @Test
    void eighthTest() {
        System.out.println("This is the eighth test method");
    }

    boolean provider() {
        return LocalDateTime.now().getDayOfWeek().equals(DayOfWeek.WEDNESDAY);
    }

}