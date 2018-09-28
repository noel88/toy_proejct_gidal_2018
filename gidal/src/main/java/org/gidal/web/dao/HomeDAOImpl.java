package org.gidal.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.event.domain.EventVO;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAOImpl implements HomeDAO {
	
	@Inject
	private SqlSession session;
	private static String namespace = "org.gidal.mapper.HomeMapper";
	
	@Override
	public List<EventVO> currentEventListAll() throws Exception {
		return session.selectList(namespace + ".currentEventListAll");
	}

}
