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
	public List<UserVO> userList(int startRow) throws Exception {	// 현재 페이지의 일반유저목록 추출
		return session.selectList(namespace + ".userList", startRow);
	}

	@Override
	public List<EnterpriseVO> enterpriseList(int startRow) throws Exception {	// 현재 페이지의 기업유저목록 추출
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
	public int userListCount() {	//일반유저의 총 갯수를 읽어옴
		return session.selectOne(namespace + ".userListCount");
	}

	@Override
	public int enterpriseListCount() {	//기업유저의 총 갯수를 읽어옴
		return session.selectOne(namespace + ".enterpriseListCount");
	}



}
