package org.gidal.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.UserPageVO;
import org.gidal.user.domain.UserPageWaitingVO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.gidal.mapper.UserMapper";

	@Override
	public int user_join(UserVO vo) {
		
		
		return sqlsession.insert(namespace + ".userjoin", vo);
	}

	@Override
	public int user_revise(UserVO vo) {
	
		return sqlsession.insert(namespace + ".userRevise", vo) ;
	}

	@Override
	public List<UserVO> userBoard_view() {
		return null;
	}

	@Override
	public int user_check(UserVO vo) {
		return sqlsession.selectOne(namespace + ".emailCheck", vo);
	}

	@Override
	public List<UserPageVO> UserPageReserve(int startRow) throws Exception {
		return sqlsession.selectList(namespace + ".UserPageReserve", startRow);
		
	}

	@Override
	public int UserPageReserveCount() {
		return sqlsession.selectOne(namespace + ".UserPageReserveCount");
	}

	@Override
	public PageInfo pageInfo() {
		return sqlsession.selectOne(namespace + ".pageInfo");
	}

	@Override
	public List<UserPageWaitingVO> UserPageWaiting(int startRow) throws Exception {
		return sqlsession.selectList(namespace + ".UserPageWaiting", startRow);
	}

	@Override
	public int UserPageWaitingCount() {
		return sqlsession.selectOne(namespace + ".UserPageWaitingCount");
	}

	@Override
	public int userDelete(UserVO vo) {
		
		return sqlsession.insert(namespace + ".userDelete", vo) ;
	}

}
