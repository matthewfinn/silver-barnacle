package examples;

import com.intuit.karate.junit5.Karate;

class ExamplesTest {

    @Karate.Test
    Karate testAll() {
        // Runs all feature files under "examples" package
        return Karate.run("classpath:examples").relativeTo(getClass());
    }
}
