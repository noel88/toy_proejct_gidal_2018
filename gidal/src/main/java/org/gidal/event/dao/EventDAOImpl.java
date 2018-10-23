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
	public List<EventVO> closedEventList(int startRow) throws Exception {	// 페이지 정보를 받아 현재 페이지의 종료된 이벤트 추출
		return session.selectList(namespace + ".closedEventList", startRow);
	}

	@Override
	public List<EventVO> currentEventList(int startRow) throws Exception {	// 페이지 정보를 받아 현재 페이지의 진행중인 이벤트 추출
		return session.selectList(namespace + ".currentEventList", startRow);
	}
	
	@Override
	public List<EventVO> upcomingEventList(int startRow) throws Exception {	// 페이지 정보를 받아 현재 페이지의 진행예정 이벤트 추출
		return session.selectList(namespace + ".upcomingEventList", startRow);
	}

	@Override
	public EventVO detailEvent(Integer event_no) {	// 이벤트 상세정보 조회
		return session.selectOne(namespace + ".detailEvent", event_no);
	}

	@Override
	public int closedEventListCount() {	// 종료된 이벤트 총 갯수 조회
		return session.selectOne(namespace + ".closedEventListCount");
	}
	
	@Override
	public int currentEventListCount() {	// 진행중인 이벤트 페이지 이동
		return session.selectOne(namespace + ".currentEventListCount");
	}
	
	@Override
	public int upcomingEventListCount() {	// 진행예정 이벤트 페이지 이동
		return session.selectOne(namespace + ".upcomingEventListCount");
	}

	@Override
	public void eventModify(EventVO event) {	// 이벤트 수정
	    session.update(namespace + ".eventModify", event);
	}

	@Override
	public void eventDelete(EventVO event) {	// 이벤트 삭제
		session.delete(namespace + ".eventDelete", event);
	}
	
}
