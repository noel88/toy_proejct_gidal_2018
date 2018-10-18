package org.gidal.review.domain;

public class ReviewVO {


	private int review_code; //리뷰 코드
	private int enterprise_code;
	private String review_scope; //평점
	public String getReview_scope() {
		return review_scope;
	}
	public void setReview_scope(String review_scope) {
		this.review_scope = review_scope;
	}

	private String review_text; //리뷰내용
	@Override
	public String toString() {
		return "ReviewVO [review_code=" + review_code + ", review_text=" + review_text + ", user_email=" + user_email
				+ "]";
	}
	//private String review_count; //조회수

	private String user_email;



	public int getEnterprise_code() {
		return enterprise_code;
	}
	public void setEnterprise_code(int enterprise_code) {
		this.enterprise_code = enterprise_code;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getReview_code() {
		return review_code;
	}
	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}
	public String getReview_text() {
		return review_text;
	}
	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}
	/*public String getReview_count() {
		return review_count;
	}
	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}*/


}