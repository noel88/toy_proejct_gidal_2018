package org.gidal.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSession session;
	private static String namespace = "org.gidal.mapper.AdminMapper";
	
	@Override
	public void eventRegist(EventVO event) throws Exception {
	    session.insert(namespace + ".eventRegist", event);
		
	}

	@Override
	public List<UserVO> userList(int startRow) throws Exception {
		return session.selectList(namespace + ".userList", startRow);
	}

	@Override
	public List<EnterpriseVO> enterpriseList(int startRow) throws Exception {
		return session.selectList(namespace + ".enterpriseList", startRow);
	}

	@Override
	public int userRemove(String[] remove) {
		return session.delete(namespace + ".userRemove", remove);
	}
	
	@Override
	public int enterpriseRemove(String[] remove) {
		return session.delete(namespace + ".enterpriseRemove", remove);
	}

	@Override
	public int userListCount() {
		return session.selectOne(namespace + ".userListCount");
	}

	@Override
	public int enterpriseListCount() {
		return session.selectOne(namespace + ".enterpriseListCount");
	}



}
