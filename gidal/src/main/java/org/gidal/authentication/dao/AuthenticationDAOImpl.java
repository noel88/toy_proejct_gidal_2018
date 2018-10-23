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
	public UserVO user_check(UserVO vo) {	// 로그인 정보와 맞는 일반유저 조회
		return session.selectOne(namespace + ".user_check", vo);
	}
	
	@Override
	public EnterpriseVO enterprise_check(EnterpriseVO vo) {	// 로그인 정보와 맞는 기업유저 조회
		return session.selectOne(namespace + ".enterprise_check", vo);
	}

	@Override
	public int user_password_foget(UserVO vo) {	// 새로운 비밀번호로 비밀번호 변경
		return session.update(namespace + ".user_forget", vo);
	}

	@Override
	public int enterprise_password_foget(EnterpriseVO vo) {	// 새로운 비밀번호로 비밀번호 변경
		return session.update(namespace + ".enterprise_forget", vo);
	}


}
