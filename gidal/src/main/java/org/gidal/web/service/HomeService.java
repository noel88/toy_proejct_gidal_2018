package org.gidal.web.service;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;

public interface HomeService {

	public List<EventVO> currentEventListAll() throws Exception;
	public List<EnterpriseVO> seachKeyword();
	
}
