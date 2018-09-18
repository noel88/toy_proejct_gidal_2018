package org.gidal.event.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "org.gidal.mapper.EventMapper";
	  
	@Override
	public List<EventVO> closedEventList(int startRow) throws Exception {
		return session.selectList(namespace + ".closedEventList", startRow);
	}

	@Override
	public List<EventVO> currentEventList(int startRow) throws Exception {
		return session.selectList(namespace + ".currentEventList", startRow);
	}
	
	@Override
	public List<EventVO> upcomingEventList(int startRow) throws Exception {
		return session.selectList(namespace + ".upcomingEventList", startRow);
	}

	@Override
	public EventVO detailEvent(Integer event_no) {
		return session.selectOne(namespace + ".detailEvent", event_no);
	}

	@Override
	public int closedEventListCount() {
		return session.selectOne(namespace + ".closedEventListCount");
	}
	
	@Override
	public int currentEventListCount() {
		return session.selectOne(namespace + ".currentEventListCount");
	}
	
	@Override
	public int upcomingEventListCount() {
		return session.selectOne(namespace + ".upcomingEventListCount");
	}

	@Override
	public PageInfo pageInfo() {
		return session.selectOne(namespace + ".pageInfo");
	}
	
}
