package org.gidal.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlsession; 
	
	
	
	@Override
	public int user_join(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
