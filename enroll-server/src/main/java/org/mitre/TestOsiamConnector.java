package org.mitre;

import org.osiam.client.OsiamConnector;
import org.osiam.client.oauth.AccessToken;
import org.osiam.client.oauth.Scope;
import org.osiam.resources.scim.Name;
import org.osiam.resources.scim.User;

import java.util.List;
import java.util.Map;

/**
 * @author Sylvain
 */
public class TestOsiamConnector {

    public TestOsiamConnector() {

    }

    public static void main (String args[]){

        Map<String, String> env = System.getenv();
        for (String key : env.keySet())
        {
            System.out.println(key + ":" + env.get(key));
        }

        System.out.println(System.getenv("CATALINA_HOME"));
        String home = System.getenv("JAVA_HOME");
        System.out.println("System.getenv(\"PATH\") = ");
        System.out.println(System.getenv("PATH"));

        OsiamConnector osiamConnector = new OsiamConnector.Builder()
                .withEndpoint("http://localhost:8888")
                .setClientId("client")
                .setClientSecret("69200270-ae81-44d5-a161-1c93fda543ef")
                .build();
        AccessToken accessToken = osiamConnector.retrieveAccessToken(Scope.ADMIN, Scope.ME);
        System.out.println("Access Token : " + accessToken);
        User user = new User.Builder().setUserName("Sylvain").setPassword("toto").setName(new Name.Builder().setFamilyName("Decourval").build()).build();

        osiamConnector.createUser(user, accessToken);
        // replace / update user
        List<User> userList = osiamConnector.getAllUsers(accessToken,"userName", "name", "address");

        for (User u : userList){
            if (!u.getUserName().equals("admin")) {
                osiamConnector.replaceUser(u.getId(), u, accessToken);
                osiamConnector.deleteUser(u.getId(), accessToken);
            }
        }

    }
}
