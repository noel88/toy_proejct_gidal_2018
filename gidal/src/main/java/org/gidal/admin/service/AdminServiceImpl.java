package org.gidal.admin.service;

import javax.inject.Inject;

import org.gidal.admin.dao.AdminDAO;
import org.gidal.event.domain.EventVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;

	@Override
	public void eventRegist(EventVO event) throws Exception {
		dao.eventRegist(event);
	}

}
