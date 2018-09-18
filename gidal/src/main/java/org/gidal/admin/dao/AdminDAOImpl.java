package org.gidal.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.event.domain.EventVO;
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

}
