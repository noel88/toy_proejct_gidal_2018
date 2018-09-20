package org.gidal.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlsession; 
	
	private static String namespace = "org.gidal.mapper.UserMapper";
	
	@Override
	public int user_join(UserVO vo) {
		System.out.println("1212121");
		System.out.println(vo.getUser_email());
		return sqlsession.insert(namespace + ".userjoin", vo);
	}

	@Override
	public int userBoard_update(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> userBoard_list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> userBoard_view() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".boardlist");
	}

}
