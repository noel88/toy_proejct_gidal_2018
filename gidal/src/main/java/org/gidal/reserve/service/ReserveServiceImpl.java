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

	/**
	 * 예약하기 메소드
	 * 
	 * @see org.gidal.reserve.service.ReserveService#reserve_insert(org.gidal.reserve.domain.ReserveVO)
	 * @param ReserveVO
	 * @return int
	 * @throws 
	 */
	
	@Override
	public int reserve_insert(ReserveVO vo) {
		return dao.reserve_insert(vo);
	}

	/**
	 * 예약 페이지 보여주는 메소드
	 * 
	 * @see org.gidal.reserve.service.ReserveService#selectOne(Integer)
	 * @param Integer
	 * @return EnterpriseVO
	 * @throws 
	 */
	
	
	@Override
	public EnterpriseVO selectOne(Integer code) {
		return dao.selectOne(code);
	}

	/**
	 * 웨이팅 페이지에 로그인한 정보 세션에 저장해서 보여주는 메소드
	 * 
	 * @see org.gidal.reserve.service.ReserveService#selectOne(String)
	 * @param String
	 * @return UserVO
	 * @throws 
	 */
	
	
	@Override
	public UserVO selectOne(String str) {
		return dao.selectUser(str);
	}





}
