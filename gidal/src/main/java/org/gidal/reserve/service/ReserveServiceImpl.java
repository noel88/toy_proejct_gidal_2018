package org.gidal.reserve.service;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.dao.ReserveDAO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Service;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Inject
	private ReserveDAO dao;


	@Override
	public EnterpriseVO selectOne(Integer code) {
		return dao.selectOne(code);
	}


	@Override
	public UserVO selectOne(String str) {

		return dao.selectUser(str);
	}


	@Override
	public int reserve_insert(ReserveVO vo) {
		return dao.reserve_insert(vo);
	}



}
