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

	/**
	 * 웨이팅 페이지
	 *
	 * @see org.gidal.waiting.service.WaitingService#selectOne(Integer)
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
	 * @see org.gidal.waiting.service.WaitingService#selectOne(String)
	 * @param String
	 * @return UserVO
	 * @throws
	 */


	@Override
	public UserVO selectOne(String str) {
		return dao.selectUser(str);
	}

	/**
	 * 웨이팅 하기
	 *
	 * 웨이팅할때 자동으로 waiting_yn default 'n'
	 *
	 * @see org.gidal.waiting.service.WaitingService#waiting_insert(org.gidal.waiting.domain.WaitingVO)
	 * @param String
	 * @return UserVO
	 * @throws
	 */


	@Override
	public int waiting_insert(WaitingVO vo) {
		vo.setWaiting_yn("N");
		return dao.waiting_insert(vo);
	}

	/**
	 * 웨이팅 페이지에 웨이팅 하는 사람 명단 보여주기
	 *
	 * @see org.gidal.waiting.service.WaitingService#waiting_view(Integer)
	 * @param Integer
	 * @return List
	 * @throws
	 */

	@Override
	public List<WaitingVO> waiting_view(Integer code) {
		return dao.waiting_view(code);
	}

	/**
	 * 웨이팅 카운드 메소드
	 *
	 * @see org.gidal.waiting.service.WaitingService#waiting_count(Integer)
	 * @param Integer
	 * @return int
	 * @throws
	 */


	@Override
	public int waiting_count(Integer code) {
		return dao.waiting_count(code);
	}

}
