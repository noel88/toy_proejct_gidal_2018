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
	public String login(LoginDTO loginInfo) {	// 로그인 실행
	
		String loginCheck = "";

		SHA256 sha = new SHA256();
		UserVO vo1 = new UserVO();
		EnterpriseVO vo2 = new EnterpriseVO();
		
		String password = sha.getSHA256(loginInfo.getLogin_password());
		loginInfo.setLogin_password(password);
		// 로그인시 입력한 패스워드 암호화 후 암호화 된 패스워드 입력
		
		vo1.setUser_email(loginInfo.getLogin_email());
		vo1.setUser_password(loginInfo.getLogin_password());
		vo1 = dao.user_check(vo1);
		// 로그인 정보를 일반유저에 입력 후 조회
		
		if(vo1 != null) {
			loginCheck = "user";
			// 로그인 정보에 맞는 정보가 일반유저에 있으면 user로 로그인
			
		} else { 
			vo2.setEnterprise_email(loginInfo.getLogin_email());
			vo2.setEnterprise_password(loginInfo.getLogin_password());
			vo2 = dao.enterprise_check(vo2);
			// 로그인 정보에 맞는 정보가 일반유저가 없으면
			// 로그인 정보를 기업유저에 입력 후 조회
			
			if(vo2 != null) {
				loginCheck = "enterprise";
				// 로그인 정보에 맞는 정보가 기업유저에 있으면 enterprise로 로그인
			} else if(loginInfo.getLogin_email().equals(adminID) && loginInfo.getLogin_password().equals(sha.getSHA256(adminPW))) {
				loginCheck = "admin";
				// 로그인 정보가 관리자계정이라면 admin으로 로그인
			}
		}
		
		return loginCheck;

	}
	
	@Override
	public String reissuePassword(ReissuePasswordDTO reissuePassword) {	// 비밀번호 재발급 처리
		
		String newPassword = "";

		SHA256 sha = new SHA256();
		UserVO vo1 = new UserVO();
		EnterpriseVO vo2 = new EnterpriseVO();
		
		vo1.setUser_email(reissuePassword.getReissuePassword_email());
		vo1.setUser_name(reissuePassword.getReissuePassword_name());
		vo1.setUser_phoneNum(reissuePassword.getReissuePassword_phoneNum());
		vo1 = dao.user_check(vo1);
		// 재발급 정보를 이용하여 일반유저 조회
		
		if(vo1 != null) {
			newPassword = createNewPassword();
			vo1.setUser_password(sha.getSHA256(newPassword));
			dao.user_password_foget(vo1);
			// 재발급 정보와 일치하는 일반유저가 있다면
			// 새로운 비밀번호 생성 후 암호화하여 새로운 비밀번호로 비밀번호 변경
		} else {
			vo2.setEnterprise_email(reissuePassword.getReissuePassword_email());
			vo2.setEnterprise_name(reissuePassword.getReissuePassword_name());
			vo2.setEnterprise_phone(reissuePassword.getReissuePassword_phoneNum());
			vo2 = dao.enterprise_check(vo2);
			// 재발급 정보와 일치하는 일반유저가 없다면
			// 재발급 정보를 이용하여 기업유저 조회
			if(vo2 != null) {
				newPassword = createNewPassword();
				vo2.setEnterprise_password(sha.getSHA256(newPassword));
				dao.enterprise_password_foget(vo2);
				// 재발급 정보와 일치하는 기업유저가 있다면
				// 새로운 비밀번호 생성 후 암호화하여 새로운 비밀번호로 비밀번호 변경
			}
		}
		
		return newPassword;
	}

	public String createNewPassword() {	// 새로운 비밀번호 생성 
		String newPassword = "";

		for (int i = 0; i < 10; i++) {
		// 알파벳 대소문자, 숫자로 구성된 10자리 문자열 생성
			
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
	public void logout(HttpSession session) {	// 로그아웃 처리
		session.invalidate();
	}


}
