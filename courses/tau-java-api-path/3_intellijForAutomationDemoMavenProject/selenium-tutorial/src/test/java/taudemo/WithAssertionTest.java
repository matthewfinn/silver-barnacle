package taudemo;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class WithAssertionTest {

    @Test
    public void testOne(){
        assertEquals(1,2);
    }

    @Test
    public void testTwo(){
        assertEquals(1,1);
    }
}
