package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    // Runner file for  *.feature files in the users folder
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
