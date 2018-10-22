package org.gidal.enterprise.service;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.gidal.enterprise.dao.EnterpriseDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.util.SHA256;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Service;


@Service
public class EnterpriseServiceImpl implements EnterpriseService{

	@Inject
	private EnterpriseDAO dao;

	/**
	 * 기업 회원가입
	 *
	 * 비밀번호 패스워드 암호화를 하여 등록.
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#enterprise_join(org.gidal.enterprise.domain.EnterpriseVO)
	 * @param EnterpriseVO
	 * @return void
	 * @throws Exception
	 */

	@Override
	public void enterprise_join(EnterpriseVO vo) throws Exception {

		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);

		dao.enterprise_join(vo);
	}

	@Override
	public int enterpriseBoard_update(EnterpriseVO vo) {
		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);
		return dao.enterpriseBoard_update(vo);
	}

	@Override
	public EnterpriseVO enterpriseBoard_view(Integer code) {
		return dao.enterpriseBoard_view(code);
	}

	/**
	 * 기업 식당페이지 전체 목록
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#enterpriseBoard_list()
	 * @param
	 * @return List
	 * @throws
	 */

	@Override
	public List<EnterpriseVO> enterpriseBoard_list() {
		return dao.enterpriseBoard_list();
	}

	/**
	 * 기업 이메일 중복 체크
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#enterprise_check(org.gidal.enterprise.domain.EnterpriseVO)
	 * @param EnterpriseVO
	 * @return int
	 * @throws
	 */

	@Override
	public int enterprise_check(EnterpriseVO vo) {
		return dao.enterprise_check(vo);
	}

	/**
	 * 기업 페이지에서 웨이팅 목록 조회하기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#waiting_list(Integer)
	 * @param Integer
	 * @return List
	 * @throws
	 */

	@Override
	public List<WaitingVO> waiting_list(Integer code) {
		return dao.waiting_list(code);
	}

	/**
	 * 로그인 세션으로 기업 코드 찾기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#find_enterprise_code(String)
	 * @param String
	 * @return int
	 * @throws
	 */


	@Override
	public int find_enterprise_code(String str) {
		return dao.find_enterprise_code(str);
	}

	/**
	 * 기업 페이지에서 웨이팅 현황 업데이트 하기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#waiting_update(Integer)
	 * @param Integer
	 * @return int
	 * @throws
	 */


	@Override
	public int waiting_update(Integer no) {
		return dao.waiting_update(no);
	}

	/**
	 * 기업 페이지에서 예약 목록 조회하기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#reserve_list(Integer)
	 * @param Integer
	 * @return List
	 * @throws
	 */


	@Override
	public List<ReserveVO> reserve_list(Integer code) {
		return dao.reserve_list(code);
	}

	/**
	 * 기업 페이지에서 탈퇴하기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#delete(Integer)
	 * @param Integer
	 * @return void
	 * @throws
	 */

	@Override
	public void delete(EnterpriseVO vo) {
		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);
		dao.delete(vo);

	}

	@Override
	public void enterprise_img(EnterpriseVO vo) {
		dao.enterprise_img(vo);

	}

	@Override
	public List<EnterpriseVO> ent_best() {
		return dao.ent_best();
	}

	@Override
	public List<EnterpriseVO> ent_popular() {
		return dao.ent_popular();
	}



}
