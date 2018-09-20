package org.gidal.reserve.service;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.dao.ReserveDAO;
import org.springframework.stereotype.Service;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Inject
	private ReserveDAO dao;


	@Override
	public EnterpriseVO selectOne(Integer code) {
		return dao.selectOne(code);
	}

}
