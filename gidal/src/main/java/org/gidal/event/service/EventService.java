package org.gidal.event.service;

import java.util.List;

import org.gidal.event.domain.EventVO;

public interface EventService {
	
	public List<EventVO> closedEventListAll() throws Exception;
	
	public List<EventVO> currentEventListAll() throws Exception;
	
	public List<EventVO> upcomingEventListAll() throws Exception;
	
	public EventVO detailEvent(Integer bno) throws Exception;

}
