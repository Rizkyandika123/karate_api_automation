package Petstore_user;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }

}
