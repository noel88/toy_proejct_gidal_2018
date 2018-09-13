package org.gidal.authentication.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class AuthenticationDAOImpl implements AuthenticationDAO {


	@Inject
	private SqlSession session;

	private static String namespace = "org.gidal.mapper.AuthenticationMapper";

	@Override
	public void enterprise_password_foget(EnterpriseVO vo) {
		session.update(namespace + ".enterprise_forget", vo);
	}

	@Override
	public void user_password_foget(UserVO vo) {
		session.update(namespace + ".user_forget", vo);
	}

	@Override
	public boolean enterprise_login(EnterpriseVO vo) {
		return session.selectOne(namespace + ".enterprise_login",vo);

	}

	@Override
	public boolean user_login(UserVO vo) {
		return session.selectOne(namespace + ".user_login",vo);
	}

	@Override
	public void enterprise_delete(EnterpriseVO vo) {
		session.delete(namespace + ".enterprise_delete", vo);

	}

	@Override
	public void user_delete(UserVO vo) {
		session.delete(namespace + ".user_delete", vo);

	}






}
