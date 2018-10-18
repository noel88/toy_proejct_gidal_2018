package org.gidal.review.service;

import java.util.List;

import org.gidal.review.domain.ReviewVO;

public interface ReviewService {
	public int userReview(ReviewVO vo);
	public List<ReviewVO> ent_review(Integer code);
}
