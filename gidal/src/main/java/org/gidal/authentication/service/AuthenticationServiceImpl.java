package org.gidal.authentication.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.authentication.dao.AuthenticationDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.util.SHA256;
import org.springframework.stereotype.Service;
@Service
public class AuthenticationServiceImpl implements AuthenticationService {


	@Inject
	private AuthenticationDAO dao;





	@Override
	public String enterprise_password_foget(EnterpriseVO vo) {

		SHA256 sha = new SHA256();
		String new_password = sha.getSHA256(vo.getEnterprise_email());

		vo.setEnterprise_password(new_password);
		dao.enterprise_password_foget(vo);

		return new_password;
	}


	@Override
	public String user_password_foget(UserVO vo) {

		SHA256 sha = new SHA256();
		String new_password = sha.getSHA256(vo.getUser_email());

		vo.setUser_password(new_password);
		dao.user_password_foget(vo);

		return new_password;
	}

	@Override
	public boolean enterprise_login(EnterpriseVO vo, HttpSession session) {

		boolean isCheck = dao.enterprise_login(vo);


		if(isCheck) {

			session.setAttribute("email", vo.getEnterprise_email());
			session.setAttribute("password", vo.getEnterprise_password());

		}
		return isCheck;

	}

	@Override
	public boolean user_login(UserVO vo, HttpSession session) {
		boolean isCheck = dao.user_login(vo);


		if(isCheck) {

			session.setAttribute("email", vo.getUser_email());
			session.setAttribute("password", vo.getUser_password());

		}
		return isCheck;

	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}


	@Override
	public void enterprise_delete(EnterpriseVO vo) {
		dao.enterprise_delete(vo);

	}


	@Override
	public void user_delete(UserVO vo) {
		dao.user_delete(vo);

	}



}
