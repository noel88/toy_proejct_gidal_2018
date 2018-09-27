package org.gidal.event.dao;

import java.util.List;

import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;

public interface EventDAO {

	public List<EventVO> closedEventList(int startRow) throws Exception;
	
	public List<EventVO> currentEventList(int startRow) throws Exception;
	
	public List<EventVO> upcomingEventList(int startRow) throws Exception;

	public EventVO detailEvent(Integer event_no);

	public int closedEventListCount();
	
	public int currentEventListCount();
	
	public int upcomingEventListCount();

	public PageInfo pageInfo();

	public void eventModify(EventVO event);

	public void eventDelete(EventVO event);

}
