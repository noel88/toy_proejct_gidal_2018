package org.gidal.web.dao;

import java.util.List;

import org.gidal.event.domain.EventVO;

public interface HomeDAO {

	public List<EventVO> currentEventListAll() throws Exception;

}
