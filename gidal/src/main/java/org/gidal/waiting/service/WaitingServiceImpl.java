package org.gidal.waiting.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.dao.WaitingDAO;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Service;

@Service
public class WaitingServiceImpl implements WaitingService{

	@Inject
	private WaitingDAO dao;



	@Override
	public EnterpriseVO selectOne(Integer code) {
		return dao.selectOne(code);
	}



	@Override
	public UserVO selectOne(String str) {
		return dao.selectUser(str);
	}



	@Override
	public int waiting_insert(WaitingVO vo) {
		vo.setWaiting_yn("n");
		return dao.waiting_insert(vo);
	}



	@Override
	public List<WaitingVO> waiting_view(Integer code) {
		return dao.waiting_view(code);
	}



	@Override
	public int waiting_count(Integer code) {
		return dao.waiting_count(code);
	}

}
