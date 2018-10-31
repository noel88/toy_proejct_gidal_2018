package org.gidal.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.domain.ReviewVO;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {


	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.gidal.mapper.ReviewMapper";

	@Override
	public int userReview(ReviewVO vo) {	// 리뷰 등록처리
		return sqlsession.insert(namespace + ".userReview", vo);
	}

	@Override
	public List<ReviewVO> ent_review(Integer code) {
		return sqlsession.selectList(namespace + ".ent_review", code);
	}


	@Override
	public ReserveVO reserve(Integer code) {	// 예약정보 조회
		return sqlsession.selectOne(namespace + ".reserve", code);
	}

	@Override
	public WaitingVO waiting(Integer code) {	// 웨이팅정보 조회
		return sqlsession.selectOne(namespace + ".waiting", code);
	}

	@Override
	public String getEnterprise_businessName(int enterprise_code) {	// 기업 매장명 조회
		return sqlsession.selectOne(namespace + ".getEnterprise_businessName", enterprise_code);
	}

	@Override
	public ReviewVO readReview(String rcode) {	// 리뷰내용 조회
		return sqlsession.selectOne(namespace + ".readReview", rcode);
	}

	@Override
	public void reviewDelete(String rcode) {	// 리뷰 삭제처리
		sqlsession.delete(namespace + ".reviewDelete", rcode);
	}



}
