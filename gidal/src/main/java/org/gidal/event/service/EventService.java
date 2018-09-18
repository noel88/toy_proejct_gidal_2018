package org.gidal.event.service;

import java.util.List;

import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;

public interface EventService {
	
	public List<EventVO> closedEventList(int page) throws Exception;
	
	public List<EventVO> currentEventList(int page) throws Exception;
	
	public List<EventVO> upcomingEventList(int page) throws Exception;
	
	public EventVO detailEvent(Integer bno) throws Exception;

	public int closedEventListCount();
	
	public int currentEventListCount();
	
	public int upcomingEventListCount();

	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount);


}
