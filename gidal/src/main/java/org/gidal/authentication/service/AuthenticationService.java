package org.gidal.authentication.service;

import javax.servlet.http.HttpSession;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;

public interface AuthenticationService {


	public String enterprise_password_foget(EnterpriseVO vo);
	public String user_password_foget(UserVO vo);
	public boolean enterprise_login(EnterpriseVO vo, HttpSession session);
	public boolean user_login(UserVO vo, HttpSession session);
	public void logout(HttpSession session);
	public void enterprise_delete(EnterpriseVO vo);
	public void user_delete(UserVO vo);




}
