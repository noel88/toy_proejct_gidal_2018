package org.gidal.enterprise.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.enterprise.dao.EnterpriseBoardDAO;
import org.gidal.enterprise.dao.EnterpriseDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class EnterpriseServiceImpl implements EnterpriseService{



	@Inject
	private EnterpriseDAO dao;
	private EnterpriseBoardDAO boardDao;


	@Override
	public int enterprise_join(EnterpriseVO vo) {

		//패스워드 암호화, 상호코드 작성


		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	        System.out.println(vo.toString());
	        //암호화 하기전
	          String password = scpwd.encode(vo.getEnterprise_password());
	          String code = scpwd.encode(vo.getEnterprise_businessName());
	        //암호화 하여 저장
	        vo.setEnterprise_password(password);
	        vo.setEnterprise_code(code);
	        System.out.println(vo.toString());

		return dao.enterprise_join(vo);

	}


	@Override
	public EnterpriseVO enterprise_password_foget() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int enterprise_login() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void enterprise_delete() {
		// TODO Auto-generated method stub

	}

	@Override
	public void enterprise_logout() {
		// TODO Auto-generated method stub

	}

	@Override
	public int enterpriseBoard_update(EnterpriseVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<EnterpriseVO> enterpriseBoard_view() {
		// TODO Auto-generated method stub
		return null;
	}




}
