package org.mitre.web.service;

import org.mitre.web.model.ArdecoResponse;

/**
 * @author Sylvain
 */

public interface UserService {

    ArdecoResponse addUser(String jsonString);
}
