package org.mitre.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

/**
 * @author SylvainDecourval-dej on 05/09/2016.
 */
@Data
@AllArgsConstructor
@ToString
public class ArdecoUser {
    private String name;
    private String age;
    private String id;
    private String firstname;
    private String lastname;
    private String dob;
    private String birthcity;
    private String birthcountry;
    private String address;
    private String city;
    private String zipcode;
    private String country;
    private String phone;
    private String email;

}
