package org.gidal.reserve.domain;



public class ReserveVO {


	private int reserve_code;
	private int enterprise_code;
	private int reserve_personnel;
	private String reserve_date;
	private String reserve_time;
	private String user_name;
	private String user_phoneNum;
	private String reserve_yn;
	private String reserve_comfirmation;
	private String enterprise_businessName;



	public ReserveVO() {

	}



	public String getEnterprise_businessName() {
		return enterprise_businessName;
	}



	public void setEnterprise_businessName(String enterprise_businessName) {
		this.enterprise_businessName = enterprise_businessName;
	}



	public String getReserve_comfirmation() {
		return reserve_comfirmation;
	}



	public void setReserve_comfirmation(String reserve_comfirmation) {
		this.reserve_comfirmation = reserve_comfirmation;
	}



	public String getReserve_yn() {
		return reserve_yn;
	}



	public void setReserve_yn(String reserve_yn) {
		this.reserve_yn = reserve_yn;
	}



	public int getEnterprise_code() {
		return enterprise_code;
	}



	public void setEnterprise_code(int enterprise_code) {
		this.enterprise_code = enterprise_code;
	}



	public int getReserve_code() {
		return reserve_code;
	}



	public void setReserve_code(int reserve_code) {
		this.reserve_code = reserve_code;
	}



	public int getReserve_personnel() {
		return reserve_personnel;
	}



	public void setReserve_personnel(int reserve_personnel) {
		this.reserve_personnel = reserve_personnel;
	}

	public String getReserve_date() {
		return reserve_date;
	}



	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}



	public String getReserve_time() {
		return reserve_time;
	}



	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_phoneNum() {
		return user_phoneNum;
	}



	public void setUser_phoneNum(String user_phoneNum) {
		this.user_phoneNum = user_phoneNum;
	}










}
