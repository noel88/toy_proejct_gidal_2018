package org.gidal.authentication.service;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.authentication.dao.AuthenticationDAO;
import org.gidal.authentication.dto.LoginDTO;
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
		
		vo1 = dao.user_login(vo1);

		if(vo1 == null) {
			vo2.setEnterprise_email(loginInfo.getLogin_email());
			vo2.setEnterprise_password(loginInfo.getLogin_password());
			
			vo2 = dao.enterpirse_login(vo2);
			
			if(vo2 == null) {
				
				if(loginInfo.getLogin_email().equals(adminID) && loginInfo.getLogin_password().equals(sha.getSHA256(adminPW))) {
					loginCheck = "admin";
				}
		
			} else {
				loginCheck = "enterpirse";
			}
		} else {
			loginCheck = "user";
		}
		
		return loginCheck;
		

/*
		if(dao.user_login(vo1)) {

			session.setAttribute("email", email);

			return true;

		}else if (dao.enterpirse_login(vo2)) {

			session.setAttribute("email", vo2.getEnterprise_email());
			session.setAttribute("cod", vo2.getEnterprise_code());

			return true;

		}else {

			//둘다 일치하지 않음
			return false;

		}
*/

	}

	@Override
	public String password_foget(String email) {

		SHA256 sha = new SHA256();
		UserVO vo1 = new UserVO();
		EnterpriseVO vo2 = new EnterpriseVO();
		String new_password;

		if (dao.user_check(vo1)) {

			new_password = sha.getSHA256(email);
			vo1.setUser_password(new_password);
			dao.user_password_foget(vo1);

			return new_password;

		} else if (dao.enterprise_check(vo2)) {

			new_password = sha.getSHA256(email);
			vo2.setEnterprise_password(new_password);
			dao.enterprise_password_foget(vo2);

			return new_password;

		} else {

			// 회원, 기업 둘다 아니므로 오류
			return null;

		}


	}




	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}


	@Override
	public void delete(String email) {


		UserVO vo1 = new UserVO();
		EnterpriseVO vo2 = new EnterpriseVO();


		if (dao.user_check(vo1)) {

			dao.user_delete(vo1);

		} else if (dao.enterprise_check(vo2)) {

			dao.enterprise_delete(vo2);

		} else {

			// 회원, 기업 둘다 아니므로 오류

		}


	}






}
