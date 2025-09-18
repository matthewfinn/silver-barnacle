package examples;

import com.intuit.karate.junit5.Karate;

class ExamplesTest {

    // this will run all *.feature files that exist in subdirectories
    @Karate.Test
    Karate testAll(){
        return Karate.run().relativeTo(getClass());
    }
}
