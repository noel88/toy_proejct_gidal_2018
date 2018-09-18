package org.gidal.event.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.event.dao.EventDAO;
import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;
import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	private EventDAO dao;
	
	@Override
	public List<EventVO> closedEventList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.closedEventList(startRow);
	}

	@Override
	public List<EventVO> currentEventList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.currentEventList(startRow);
	}
	
	@Override
	public List<EventVO> upcomingEventList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.upcomingEventList(startRow);
	}
	
	@Override
	public EventVO detailEvent(Integer event_no) throws Exception {
		return dao.detailEvent(event_no);
	}

	@Override
	public int closedEventListCount() {
		return dao.closedEventListCount();
	}
	
	@Override
	public int currentEventListCount() {
		return dao.currentEventListCount();
	}

	@Override
	public int upcomingEventListCount() {
		return dao.upcomingEventListCount();
	}

	@Override
	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount) {

		int maxPage = (int) ((double) upcomingEventListCount / LIMIT + 0.95);
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(upcomingEventListCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		return pageInfo;
	}



}
