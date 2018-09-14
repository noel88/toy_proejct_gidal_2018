package org.gidal.event.dao;

import java.util.List;

import org.gidal.event.domain.EventVO;

public interface EventDAO {

	public List<EventVO> closedEventListAll() throws Exception;
	
	public List<EventVO> currentEventListAll() throws Exception;
	
	public List<EventVO> upcomingEventListAll() throws Exception;

	public EventVO detailEvent(Integer event_no);

}
