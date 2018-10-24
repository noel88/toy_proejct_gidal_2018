package org.gidal.review.domain;

public class ReviewVO {


	private int review_code; //리뷰 코드
	private int enterprise_code;
	private String reserveAndWaiting_code;
	private String review_text; //리뷰내용
	private String user_email;
	private String review_scope; //평점
	private String enterprise_text;
	private String sub;
	private int code;



	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getReview_code() {
		return review_code;
	}

	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}

	public int getEnterprise_code() {
		return enterprise_code;
	}

	public void setEnterprise_code(int enterprise_code) {
		this.enterprise_code = enterprise_code;
	}

	public String getReserveAndWaiting_code() {
		return reserveAndWaiting_code;
	}

	public void setReserveAndWaiting_code(String reserveAndWaiting_code) {
		this.reserveAndWaiting_code = reserveAndWaiting_code;
	}

	public String getReview_text() {
		return review_text;
	}

	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getReview_scope() {
		return review_scope;
	}

	public void setReview_scope(String review_scope) {
		this.review_scope = review_scope;
	}

	public String getEnterprise_text() {
		return enterprise_text;
	}

	public void setEnterprise_text(String enterprise_text) {
		this.enterprise_text = enterprise_text;
	}



/*
	public String getReview_scope() {
		return review_scope;
	}
	public void setReview_scope(String review_scope) {
		this.review_scope = review_scope;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_code=" + review_code + ", review_text=" + review_text + ", user_email=" + user_email
				+ "]";
	}
	//private String review_count; //조회수




	public String getReserveAndWaitng_code() {
		return reserveAndWaiting_code;
	}
	public void setReserveAndWaiting_code(String reserveAndWaiting_code) {
		this.reserveAndWaiting_code = reserveAndWaiting_code;
	}
	public String getEnterprise_text() {
		return enterprise_text;
	}
	public void setEnterprise_text(String enterprise_text) {
		this.enterprise_text = enterprise_text;
	}
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
	public String getReview_count() {
		return review_count;
	}
	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}
*/

}