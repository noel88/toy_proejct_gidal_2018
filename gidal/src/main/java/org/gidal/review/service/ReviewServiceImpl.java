package org.gidal.review.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.dao.ReviewDAO;
import org.gidal.review.domain.ReviewVO;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{


	@Inject
	private ReviewDAO dao;

	@Override
	public int userReview(ReviewVO vo) {	// 리뷰 등록처리
		return dao.userReview(vo);
	}

	@Override
	public List<ReviewVO> ent_review(Integer code) {
		return dao.ent_review(code);
	}

	@Override
	public ReserveVO reserve(Integer code) {	// 예약정보 조회
		return dao.reserve(code);
	}

	@Override
	public WaitingVO waiting(Integer code) {	//웨이팅정보 조회
		return dao.waiting(code);
	}

	@Override
	public String getEnterprise_businessName(int enterprise_code) {	// 기업 매장명 조회
		return dao.getEnterprise_businessName(enterprise_code);
	}

	@Override
	public ReviewVO readReview(String rcode) {	// 리뷰내용 조회
		return dao.readReview(rcode);
	}

	@Override
	public void reviewDelete(String rcode) {	// 리뷰 삭제처리
		dao.reviewDelete(rcode);
	}

}
