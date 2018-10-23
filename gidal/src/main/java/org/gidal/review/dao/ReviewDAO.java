package org.gidal.review.dao;

import java.util.List;

import org.gidal.review.domain.ReviewVO;

public interface ReviewDAO {


	public int userReview(ReviewVO vo);
	public List<ReviewVO> ent_review_reserve(Integer code);
	public List<ReviewVO> ent_review_waiting(Integer code);
}
