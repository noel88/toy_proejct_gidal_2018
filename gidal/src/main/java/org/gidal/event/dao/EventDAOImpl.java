package org.gidal.event.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.event.domain.EventVO;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "org.gidal.mapper.EventMapper";
	  
	@Override
	public List<EventVO> closedEventListAll() throws Exception {
		return session.selectList(namespace + ".closedEventListAll");
	}

	@Override
	public List<EventVO> currentEventListAll() throws Exception {
		return session.selectList(namespace + ".currentEventListAll");
	}
	
	@Override
	public List<EventVO> upcomingEventListAll() throws Exception {
		return session.selectList(namespace + ".upcomingEventListAll");
	}

	@Override
	public EventVO detailEvent(Integer event_no) {
		return session.selectOne(namespace + ".detailEvent", event_no);
	}

}
