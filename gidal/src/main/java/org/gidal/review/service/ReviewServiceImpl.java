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
	public int userReview(ReviewVO vo) {
		return dao.userReview(vo);
	}

	
	@Override
	public List<ReviewVO> ent_review_waiting(Integer code) {
		return dao.ent_review_waiting(code);
	}

	@Override
	public List<ReviewVO> ent_review_reserve(Integer code) {
		return dao.ent_review_reserve(code);
	}


	@Override
	public ReserveVO reserve(Integer code) {
		return dao.reserve(code);
	}

	@Override
	public WaitingVO waiting(Integer code) {
		return dao.waiting(code);
	}


	@Override
	public String getEnterprise_businessName(int enterprise_code) {
		return dao.getEnterprise_businessName(enterprise_code);
	}


	@Override
	public ReviewVO readReview(String rcode) {
		return dao.readReview(rcode);
	}


	@Override
	public void reviewDelete(String rcode) {
		dao.reviewDelete(rcode);
	}

}
