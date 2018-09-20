package org.gidal.authentication.service;

import javax.servlet.http.HttpSession;

import org.gidal.authentication.dto.LoginDTO;

public interface AuthenticationService {


	public String login(LoginDTO loginInfo);

	public String password_foget(String email);
	public void logout(HttpSession session);
	public void delete(String email);





}
