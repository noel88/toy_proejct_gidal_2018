package org.gidal.waiting.service;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.waiting.dao.WaitingDAO;
import org.springframework.stereotype.Service;

@Service
public class WaitingServiceImpl implements WaitingService{

	@Inject
	private WaitingDAO dao;



	@Override
	public EnterpriseVO selectOne(Integer code) {
		return dao.selectOne(code);
	}

}
