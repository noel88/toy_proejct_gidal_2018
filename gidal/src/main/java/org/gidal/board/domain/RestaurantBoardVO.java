package org.gidal.board.domain;

public class RestaurantBoardVO {

	private String restaurantBoard_code;
	private String restaurantBoard_count;
	private String restaurantBoard_choise;
	private String restaurantBoard_review_number;
	private String restaurantBoard_reserve_number;
	private String restaurantBoard_review_scope_total;




	public RestaurantBoardVO() {

	}


	public RestaurantBoardVO(String restaurantBoard_code, String restaurantBoard_count, String restaurantBoard_choise,
			String restaurantBoard_review_number, String restaurantBoard_reserve_number,
			String restaurantBoard_review_scope_total) {

		this.restaurantBoard_code = restaurantBoard_code;
		this.restaurantBoard_count = restaurantBoard_count;
		this.restaurantBoard_choise = restaurantBoard_choise;
		this.restaurantBoard_review_number = restaurantBoard_review_number;
		this.restaurantBoard_reserve_number = restaurantBoard_reserve_number;
		this.restaurantBoard_review_scope_total = restaurantBoard_review_scope_total;
	}


	public String getRestaurantBoard_code() {
		return restaurantBoard_code;
	}


	public void setRestaurantBoard_code(String restaurantBoard_code) {
		this.restaurantBoard_code = restaurantBoard_code;
	}


	public String getRestaurantBoard_count() {
		return restaurantBoard_count;
	}


	public void setRestaurantBoard_count(String restaurantBoard_count) {
		this.restaurantBoard_count = restaurantBoard_count;
	}


	public String getRestaurantBoard_choise() {
		return restaurantBoard_choise;
	}


	public void setRestaurantBoard_choise(String restaurantBoard_choise) {
		this.restaurantBoard_choise = restaurantBoard_choise;
	}


	public String getRestaurantBoard_review_number() {
		return restaurantBoard_review_number;
	}


	public void setRestaurantBoard_review_number(String restaurantBoard_review_number) {
		this.restaurantBoard_review_number = restaurantBoard_review_number;
	}


	public String getRestaurantBoard_reserve_number() {
		return restaurantBoard_reserve_number;
	}


	public void setRestaurantBoard_reserve_number(String restaurantBoard_reserve_number) {
		this.restaurantBoard_reserve_number = restaurantBoard_reserve_number;
	}


	public String getRestaurantBoard_review_scope_total() {
		return restaurantBoard_review_scope_total;
	}


	public void setRestaurantBoard_review_scope_total(String restaurantBoard_review_scope_total) {
		this.restaurantBoard_review_scope_total = restaurantBoard_review_scope_total;
	}


	@Override
	public String toString() {
		return "RestaurantBoardVO [restaurantBoard_code=" + restaurantBoard_code + ", restaurantBoard_count="
				+ restaurantBoard_count + ", restaurantBoard_choise=" + restaurantBoard_choise
				+ ", restaurantBoard_review_number=" + restaurantBoard_review_number
				+ ", restaurantBoard_reserve_number=" + restaurantBoard_reserve_number
				+ ", restaurantBoard_review_scope_total=" + restaurantBoard_review_scope_total + "]";
	}






}
