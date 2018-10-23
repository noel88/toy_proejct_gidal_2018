package org.gidal.web.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;
import org.gidal.web.dao.HomeDAO;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {

	@Inject
	private HomeDAO dao;
	
	@Override
	public List<EventVO> currentEventListAll() throws Exception {
		return dao.currentEventListAll();
	}

	@Override
	public List<EnterpriseVO> seachKeyword() {
		return dao.seachKeyword();
	}

}
