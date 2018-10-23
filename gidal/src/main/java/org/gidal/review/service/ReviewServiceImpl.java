package org.gidal.review.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.review.dao.ReviewDAO;
import org.gidal.review.domain.ReviewVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{


	@Inject
	private ReviewDAO dao;

	@Override
	public int userReview(ReviewVO vo) {
		// TODO Auto-generated method stub
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

}
