package org.gidal.authentication.service;

import javax.servlet.http.HttpSession;

import org.gidal.authentication.dto.LoginDTO;
import org.gidal.authentication.dto.ReissuePasswordDTO;

public interface AuthenticationService {


	public String login(LoginDTO loginInfo);
	public String reissuePassword(ReissuePasswordDTO reissuePassword);
	public void logout(HttpSession session);

}
