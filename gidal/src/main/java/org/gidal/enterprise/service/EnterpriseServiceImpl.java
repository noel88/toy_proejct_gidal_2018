package org.gidal.enterprise.service;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.gidal.enterprise.dao.EnterpriseDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.enterprise.domain.JoinEntReviewVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.domain.ReviewVO;
import org.gidal.user.domain.UserVO;
import org.gidal.util.MailHandler;
import org.gidal.util.SHA256;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;


@Service
public class EnterpriseServiceImpl implements EnterpriseService{

	@Inject private EnterpriseDAO dao;
	@Inject private JavaMailSender mailSender;


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

	/**
	 * 기업 정보 수정
	 *
	 * 비밀번호 패스워드 암호화를 하여 등록.
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#enterpriseBoard_update(org.gidal.enterprise.domain.EnterpriseVO)
	 * @param EnterpriseVO
	 * @return int
	 * @throws
	 */

	@Override
	public int enterpriseBoard_update(EnterpriseVO vo) {
		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);
		return dao.enterpriseBoard_update(vo);
	}

	/**
	 * 기업정보 확인
	 *
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#enterpriseBoard_view(Integer)
	 * @param Integer
	 * @return EnterpriseVO
	 * @throws
	 */

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
	public int delete(EnterpriseVO vo) {
		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);
		dao.review_delete(vo.getEnterprise_code());
		dao.reserve_delete(vo.getEnterprise_code());
		dao.waiting_delete(vo.getEnterprise_code());
		return dao.delete(vo);

	}

	/**
	 * 기업 페이지에서 이미지만 ajax로 받기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#enterprise_img(EnterpriseVO)
	 * @param EnterpriseVO
	 * @return void
	 * @throws
	 */

	@Override
	public void enterprise_img(EnterpriseVO vo) {
		dao.enterprise_img(vo);
	}

	/**
	 * 식당리스트 중에서 예약 많은 베스트 3개만 메인 노출하기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#ent_best()
	 * @param
	 * @return List<EnterpriseVO>
	 * @throws
	 */

	@Override
	public List<EnterpriseVO> ent_best() {
		return dao.ent_best();
	}

	/**
	 * 식당리스트 인기순으로 정렬 [예약+웨이팅이 제일 많은 순부터]
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#ent_popular()
	 * @param
	 * @return List<EnterpriseVO>
	 * @throws
	 */

	@Override
	public List<EnterpriseVO> ent_popular() {
		return dao.ent_popular();
	}

	@Override
	public int reserve_count(Integer code) {	// 금일 남은 예약건 조회
		return dao.reserve_count(code);
	}

	@Override
	public int waiting_count(Integer code) {	// 남은 대기목록 조회
		return dao.waiting_count(code);
	}

	/**
	 * 예약현황 업데이트 하기
	 *
	 * @see org.gidal.enterprise.service.EnterpriseService#reserve_update(Integer)
	 * @param Integer
	 * @return int
	 * @throws
	 */

	@Override
	public int reserve_update(Integer code) {
		return dao.reserve_update(code);
	}

	@Override
	public int ent_detail_update(EnterpriseVO vo) {
		return dao.ent_detail_update(vo);
	}

	@Override
	public List<ReserveVO> reserve_listCheck(Integer code) {
		return dao.reserve_listCheck(code);
	}

	@Override
	public List<ReserveVO> last_reserve_list(Integer code) {
		return dao.last_reserve_list(code);
	}

	@Override
	public List<WaitingVO> last_waiting_list(Integer code) {
		return dao.last_waiting_list(code);
	}

	@Transactional
	@Override
	public int update_reserveConfirmation_yn(Integer code) throws Exception{
		ReserveVO reserve;
		reserve = dao.findReserveUser(code);
		EnterpriseVO ent;
		ent = dao.findBusinessName(reserve.getEnterprise_code());
		UserVO user;
		user = dao.findReserveUserEmail(reserve.getUser_name());


		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject(reserve.getUser_name() + "님! " + "[" + ent.getEnterprise_businessName()+" 예약확정 되었습니다.]");
		sendMail.setText(
				new StringBuffer().append("<h2>" + reserve.getUser_name() + "님 \n" + reserve.getReserve_date() + reserve.getReserve_time() + "\n"
						+ "인원수 : " + reserve.getReserve_personnel() + "명" + "\n" + "예약확정되었습니다." +
							"</h2>").toString());
		sendMail.setFrom(ent.getEnterprise_email(), ent.getEnterprise_businessName());
		sendMail.setTo(user.getUser_email());
		sendMail.send();


		return dao.update_reserveConfirmation_yn(code);
	}

	@Override
	public int reserve_listCheck_cnt(Integer code) {
		return dao.reserve_listCheck_cnt(code);
	}

	@Override
	public List<ReserveVO> reserve_now_list(Integer code) {
		return dao.reserve_now_list(code);
	}

	@Override
	public int review_scope(Integer code) {
		return dao.review_scope(code);
	}

	@Override
	public List<JoinEntReviewVO> waitingReview(Integer code) {
		return dao.waitingReview(code);
	}

	@Override
	public List<JoinEntReviewVO> reserveReview(Integer code) {
		return dao.reserveReview(code);
	}

	@Override
	public JoinEntReviewVO findReview(Integer code) {
		return dao.findReview(code);
	}

	@Override
	public void entReply(ReviewVO vo) {
		dao.entReply(vo);

	}

	@Override
	public void delReply(Integer code) {
		dao.delReply(code);

	}

	@Override
	public int total_reserve_cnt(Integer code) {
		return dao.total_reserve_cnt(code);
	}

	@Override
	public int total_waiting_cnt(Integer code) {
		return dao.total_waiting_cnt(code);
	}

	@Override
	public int total_review_cnt(Integer code) {
		return dao.total_review_cnt(code);
	}

	@Override
	public int list_cnt() {
		return dao.list_cnt();
	}



}
