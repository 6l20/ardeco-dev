package org.mitre.web;

import org.mitre.web.model.ArdecoResponse;
import org.mitre.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author SylvainDecourval-dej on 07/09/2016.
 */
@RestController
@RequestMapping(value = "/api")
public class ApiController {


    @Autowired
    private UserService userService;

    @RequestMapping(value = "/addUser", method = RequestMethod.POST, consumes = {"application/json"})
    public @ResponseBody
    ArdecoResponse addUser(@RequestBody String user,
                           Model model) {
        System.out.println("user " + user);


        return userService.addUser(user);

    }
}
