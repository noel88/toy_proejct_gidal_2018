package org.gidal.enterprise.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.enterprise.domain.JoinEntReviewVO;
import org.gidal.event.domain.EventVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.domain.ReviewVO;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Repository;

@Repository
public class EnterpriseDAOImpl implements EnterpriseDAO{

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.gidal.mapper.EnterpriseMapper";

	@Override
	public int enterprise_join(EnterpriseVO vo) {
		return sqlsession.insert(namespace + ".join", vo);
	}

	@Override
	public int enterpriseBoard_update(EnterpriseVO vo) {
		return sqlsession.update(namespace + ".enterprise_update", vo);
	}

	@Override
	public EnterpriseVO enterpriseBoard_view(Integer code) {
		return sqlsession.selectOne(namespace + ".allInfo_enterprise", code);

	}

	@Override
	public List<EnterpriseVO> enterpriseBoard_list() {

		return sqlsession.selectList(namespace + ".boardlist");
	}

	@Override
	public int enterprise_check(EnterpriseVO vo) {
		return sqlsession.selectOne(namespace + ".emailCheck", vo);
	}

	@Override
	public List<WaitingVO> waiting_list(Integer code) {
		return sqlsession.selectList(namespace + ".waiting_list", code);
	}

	@Override
	public int find_enterprise_code(String str) {
		return sqlsession.selectOne(namespace + ".find_enterprise_code", str);
	}

	@Override
	public int waiting_update(Integer no) {
		return sqlsession.update(namespace + ".update_yn", no);
	}

	@Override
	public List<ReserveVO> reserve_list(Integer code) {
		return sqlsession.selectList(namespace + ".reserve_list", code);
	}

	@Override
	public int delete(EnterpriseVO vo) {
		return sqlsession.delete(namespace + ".enterprise_delete", vo);

	}

	@Override
	public void enterprise_img(EnterpriseVO vo) {
		sqlsession.update(namespace + ".enterprise_img", vo);
	}

	@Override
	public List<EnterpriseVO> ent_best() {
		return sqlsession.selectList(namespace + ".ent_best");
	}

	@Override
	public List<EnterpriseVO> ent_popular() {
		return sqlsession.selectList(namespace + ".ent_popular");
	}

	@Override
	public int reserve_count(Integer code) {	// 금일 남은 예약건 조회
		return sqlsession.selectOne(namespace + ".reserve_count", code);
	}

	@Override
	public int waiting_count(Integer code) {	// 남은 대기목록 조회
		return sqlsession.selectOne(namespace + ".waiting_count", code);
	}

	@Override
	public int reserve_update(Integer code) {
		return sqlsession.update(namespace + ".update_reserve_yn", code);
	}

	@Override
	public int ent_detail_update(EnterpriseVO vo) {
		return sqlsession.update(namespace + ".ent_detail_update", vo);
	}

	@Override
	public List<ReserveVO> reserve_listCheck(Integer code) {
		return sqlsession.selectList(namespace + ".reserve_listCheck", code);
	}

	@Override
	public List<ReserveVO> last_reserve_list(Integer code) {
		return sqlsession.selectList(namespace + ".last_reserve_list", code);
	}

	@Override
	public List<WaitingVO> last_waiting_list(Integer code) {
		return sqlsession.selectList(namespace + ".last_waiting_list", code);
	}

	@Override
	public int update_reserveConfirmation_yn(Integer code) {
		return sqlsession.update(namespace + ".update_reserveConfirmation_yn", code);
	}

	@Override
	public int reserve_listCheck_cnt(Integer code) {
		return sqlsession.selectOne(namespace + ".reserve_listCheck_cnt", code);
	}

	@Override
	public List<ReserveVO> reserve_now_list(Integer code) {
		return sqlsession.selectList(namespace + ".reserve_now_list", code);
	}

	@Override
	public int review_scope(Integer code) {
		return sqlsession.selectOne(namespace + ".review_scope", code);
	}

	@Override
	public List<JoinEntReviewVO> waitingReview(Integer code) {
		return sqlsession.selectList(namespace + ".waitingReview", code);
	}

	@Override
	public List<JoinEntReviewVO> reserveReview(Integer code) {
		return sqlsession.selectList(namespace + ".reserveReview", code);
	}

	@Override
	public JoinEntReviewVO findReview(Integer code) {
		return sqlsession.selectOne(namespace + ".findReview", code);
	}

	@Override
	public void entReply(ReviewVO vo) {
		sqlsession.update(namespace + ".entReply", vo);

	}

	@Override
	public void delReply(Integer code) {
		sqlsession.update(namespace + ".delReply", code);

	}

	@Override
	public int total_reserve_cnt(Integer code) {
		return sqlsession.selectOne(namespace + ".total_reserve_cnt", code);
	}

	@Override
	public int total_waiting_cnt(Integer code) {
		return sqlsession.selectOne(namespace + ".total_waiting_cnt", code);
	}

	@Override
	public int total_review_cnt(Integer code) {
		return sqlsession.selectOne(namespace + ".total_review_cnt", code);
	}

	@Override
	public ReserveVO findReserveUser(Integer code) {
		return sqlsession.selectOne(namespace + ".findReserveUser", code);
	}

	@Override
	public EnterpriseVO findBusinessName(Integer code) {
		return sqlsession.selectOne(namespace + ".findBusinessName", code);
	}

	@Override
	public UserVO findReserveUserEmail(String name) {
		return sqlsession.selectOne(namespace + ".findReserveUserEmail", name);
	}





}
