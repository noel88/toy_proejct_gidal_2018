package org.gidal.authentication.service;

import javax.servlet.http.HttpSession;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;

public interface AuthenticationService {


	public String password_foget(String email);
	public boolean login(String email, String pwd, HttpSession session);
	public void logout(HttpSession session);
	public void delete(String email);





}
