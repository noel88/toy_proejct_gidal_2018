package org.gidal.authentication.service;

import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.authentication.dao.AuthenticationDAO;
import org.gidal.authentication.dto.LoginDTO;
import org.gidal.authentication.dto.ReissuePasswordDTO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.util.SHA256;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {


	@Inject
	private AuthenticationDAO dao;
	
	@Resource(name = "adminID")
	private String adminID;
	@Resource(name = "adminPW")
	private String adminPW;

	@Override
	public String login(LoginDTO loginInfo) {
	
		String loginCheck = "";

		SHA256 sha = new SHA256();
		UserVO vo1 = new UserVO();
		EnterpriseVO vo2 = new EnterpriseVO();
		
		String password = sha.getSHA256(loginInfo.getLogin_password());
		
		loginInfo.setLogin_password(password);
		
		vo1.setUser_email(loginInfo.getLogin_email());
		vo1.setUser_password(loginInfo.getLogin_password());
		
		vo1 = dao.user_check(vo1);

		if(vo1 != null) {
			loginCheck = "user";
		} else {
			vo2.setEnterprise_email(loginInfo.getLogin_email());
			vo2.setEnterprise_password(loginInfo.getLogin_password());

			vo2 = dao.enterprise_check(vo2);
			
			if(vo2 != null) {
				loginCheck = "enterpirse";
			} else if(loginInfo.getLogin_email().equals(adminID) && loginInfo.getLogin_password().equals(sha.getSHA256(adminPW))) {
				loginCheck = "admin";
			}
		}
		
		return loginCheck;

	}
	
	@Override
	public String reissuePassword(ReissuePasswordDTO reissuePassword) {
		
		String newPassword = "";

		SHA256 sha = new SHA256();
		UserVO vo1 = new UserVO();
		EnterpriseVO vo2 = new EnterpriseVO();
		
		vo1.setUser_email(reissuePassword.getReissuePassword_email());
		vo1.setUser_name(reissuePassword.getReissuePassword_name());
		vo1.setUser_phoneNum(reissuePassword.getReissuePassword_phoneNum());
		
		vo1 = dao.user_check(vo1);
		
		if(vo1 != null) {
			newPassword = createNewPassword();
			vo1.setUser_password(sha.getSHA256(newPassword));
			dao.user_password_foget(vo1);
		} else {
			vo2.setEnterprise_email(reissuePassword.getReissuePassword_email());
			vo2.setEnterprise_name(reissuePassword.getReissuePassword_name());
			vo2.setEnterprise_phone(reissuePassword.getReissuePassword_phoneNum());
			
			vo2 = dao.enterprise_check(vo2);
			
			if(vo2 != null) {
				newPassword = createNewPassword();
				vo2.setEnterprise_password(sha.getSHA256(newPassword));
				dao.enterprise_password_foget(vo2);
			}
		}
		
		return newPassword;
	}

	public String createNewPassword() {
		String newPassword = "";

		for (int i = 0; i < 10; i++) {

			Random ran = new Random();

			int category = ran.nextInt(3);
				
			if (category == 0) {
				newPassword = newPassword + (char)(ran.nextInt(26) + 65); 
			} else if (category == 1) {
				newPassword = newPassword + (char)(ran.nextInt(26) + 97); 
			} else {
				newPassword = newPassword + ran.nextInt(10); 
			}

		}
		
		return newPassword;

	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}


}
