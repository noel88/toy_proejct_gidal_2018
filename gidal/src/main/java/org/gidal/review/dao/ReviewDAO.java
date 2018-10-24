package org.gidal.review.dao;

import java.util.List;

import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.domain.ReviewVO;
import org.gidal.waiting.domain.WaitingVO;

public interface ReviewDAO {


	public int userReview(ReviewVO vo);
	public List<ReviewVO> ent_review_reserve(Integer code);
	public List<ReviewVO> ent_review_waiting(Integer code);
	public ReserveVO reserve(Integer code);
	public WaitingVO waiting(Integer code);
	public String getEnterprise_businessName(int enterprise_code);
	public ReviewVO readReview(String rcode);
	public void reviewDelete(String rcode);
}
