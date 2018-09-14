package org.gidal.event.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.event.dao.EventDAO;
import org.gidal.event.domain.EventVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	private EventDAO dao;
	
	@Override
	public List<EventVO> closedEventListAll() throws Exception {
		return dao.closedEventListAll();
	}

	@Override
	public List<EventVO> currentEventListAll() throws Exception {
		return dao.currentEventListAll();
	}
	
	@Override
	public List<EventVO> upcomingEventListAll() throws Exception {
		return dao.upcomingEventListAll();
	}
	
	@Override
	public EventVO detailEvent(Integer event_no) throws Exception {
		return dao.detailEvent(event_no);
	}

}
