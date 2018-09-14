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
	public boolean user_login(UserVO vo) {
		return session.selectOne(namespace + ".user_login", vo);
	}

	@Override
	public boolean enterpirse_login(EnterpriseVO vo) {
		return session.selectOne(namespace + ".enterprise_login");
	}


	@Override
	public int user_password_foget(UserVO vo) {
		return session.update(namespace + ".user_forget", vo);
	}

	@Override
	public int enterprise_password_foget(EnterpriseVO vo) {
		return session.update(namespace + ".enterprise_forget", vo);
	}

	@Override
	public void user_delete(UserVO vo) {
		session.delete(namespace + "user_delete");
	}

	@Override
	public void enterprise_delete(EnterpriseVO vo) {
		session.delete(namespace + ".enterprise");
	}

	@Override
	public boolean user_check(UserVO vo) {
		return session.selectOne(namespace + ".user_check");

	}

	@Override
	public boolean enterprise_check(EnterpriseVO vo) {
		return session.selectOne(namespace + ".enterprise_check");
	}















}
