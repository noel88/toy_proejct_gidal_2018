package org.gidal.review.domain;

public class ReviewVO {


	private String review_code;
	private String review_restaurantBoard_code;
	private String review_restaurantNmae;
	private String review_scope;
	private String review_text;
	private String review_like;
	private String review_count;


	public ReviewVO() {

	}


	public ReviewVO(String review_code, String review_restaurantBoard_code, String review_restaurantNmae,
			String review_scope, String review_text, String review_like, String review_count) {

		this.review_code = review_code;
		this.review_restaurantBoard_code = review_restaurantBoard_code;
		this.review_restaurantNmae = review_restaurantNmae;
		this.review_scope = review_scope;
		this.review_text = review_text;
		this.review_like = review_like;
		this.review_count = review_count;
	}


	public String getReview_code() {
		return review_code;
	}


	public void setReview_code(String review_code) {
		this.review_code = review_code;
	}


	public String getReview_restaurantBoard_code() {
		return review_restaurantBoard_code;
	}


	public void setReview_restaurantBoard_code(String review_restaurantBoard_code) {
		this.review_restaurantBoard_code = review_restaurantBoard_code;
	}


	public String getReview_restaurantNmae() {
		return review_restaurantNmae;
	}


	public void setReview_restaurantNmae(String review_restaurantNmae) {
		this.review_restaurantNmae = review_restaurantNmae;
	}


	public String getReview_scope() {
		return review_scope;
	}


	public void setReview_scope(String review_scope) {
		this.review_scope = review_scope;
	}


	public String getReview_text() {
		return review_text;
	}


	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}


	public String getReview_like() {
		return review_like;
	}


	public void setReview_like(String review_like) {
		this.review_like = review_like;
	}


	public String getReview_count() {
		return review_count;
	}


	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}


	@Override
	public String toString() {
		return "ReviewVO [review_code=" + review_code + ", review_restaurantBoard_code=" + review_restaurantBoard_code
				+ ", review_restaurantNmae=" + review_restaurantNmae + ", review_scope=" + review_scope
				+ ", review_text=" + review_text + ", review_like=" + review_like + ", review_count=" + review_count
				+ "]";
	}





}
