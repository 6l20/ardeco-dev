package org.mitre.web.service;

import com.google.gson.Gson;
import org.mitre.model.ArdecoUser;
import org.mitre.web.model.ArdecoResponse;
import org.osiam.client.OsiamConnector;
import org.osiam.client.oauth.AccessToken;
import org.osiam.client.oauth.Scope;
import org.osiam.resources.scim.*;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Sylvain
 */
@Service
public class DefaultUserServiceImpl implements UserService {
    @Override
    public ArdecoResponse addUser(String jsonString) {
        ArdecoResponse response = new ArdecoResponse();
        response.setResult(ArdecoResponse.RESULT_OK);
        List<String> addInfo = new ArrayList<>();
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        ArdecoUser u = new Gson().fromJson(jsonString, ArdecoUser.class);
        System.out.println("User registered : " + u.getName());
        addInfo.add("User parsed " + u.getName() );

        OsiamConnector osiamConnector = new OsiamConnector.Builder()
                .withEndpoint("http://localhost:8888")
                .setClientId("client")
                .setClientSecret("69200270-ae81-44d5-a161-1c93fda543ef")
                .build();
        addInfo.add("Connector Built");
        AccessToken accessToken = null;
        try {
             accessToken = osiamConnector.retrieveAccessToken(Scope.ADMIN, Scope.ME);
        }catch (Exception e){
            endStopWatch("Exception occured while connecting Auth server", addInfo, stopWatch);
            return ArdecoResponse.builder()
                    .result(ArdecoResponse.RESULT_KO)
                    .exceptionType(e.getClass().toString())
                    .exception(e.getMessage())
                    .additionalInfo(addInfo)
                    .build();
        }
        System.out.println("Access Token : " + accessToken);
        User user = buildUser(u);


        try {
            osiamConnector.createUser(user, accessToken);
        }catch (Exception e){
            endStopWatch("Exception occured while creating user", addInfo, stopWatch);
            return ArdecoResponse.builder()
                    .result(ArdecoResponse.RESULT_KO)
                    .exceptionType(e.getClass().toString())
                    .exception(e.getMessage())
                    .additionalInfo(addInfo)
                    .build();
        }
        endStopWatch("Process done.", addInfo, stopWatch);

        response.setAdditionalInfo(addInfo);

        return response;
    }

    private User buildUser(ArdecoUser u) {
        String[] names = u.getFirstname().split(";");
        String firstName="";
        String middleName ="";
        for (int i=0; i< names.length;i++){
            if (i==0){
                firstName = names[i];
            }else{
                middleName+=names[i] + ",";
            }
        }
        User user =  new User.Builder()

                .setUserName(names[0] + "-" + u.getLastname())
                .setName(new Name.Builder()
                        .setGivenName(firstName)
                        .setMiddleName(middleName)
                        .setFamilyName(u.getLastname())
                        .build())
                .addEmail(new Email.Builder().setValue(u.getEmail()).build())
                .addAddress(new Address.Builder()
                        .setCountry(u.getCountry())
                        .setPostalCode(u.getZipcode())
                        .setLocality(u.getCity())
                        .setStreetAddress(u.getAddress())
                        .setLocality(u.getCity()).build())
                .addPhoneNumber(new PhoneNumber.Builder()
                        .setPrimary(true)
                        .setValue(u.getPhone()).build())
                .build();


        return user;

    }

    private void endStopWatch(String msg, List<String> addInfo, StopWatch stopWatch) {
        stopWatch.stop();
        addInfo.add(msg);
        addInfo.add("Took : " + stopWatch.getTotalTimeMillis() + " ms");
    }
}
