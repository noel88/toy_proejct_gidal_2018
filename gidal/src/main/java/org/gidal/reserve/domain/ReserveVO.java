package org.gidal.reserve.domain;



public class ReserveVO {


	private int reserve_code;
	private int enterprise_code;
	private int reserve_personnel;
	private String reserve_datetime;
	private String user_name;
	private String user_phoneNum;



	public ReserveVO() {

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



	public String getReserve_datetime() {
		return reserve_datetime;
	}



	public void setReserve_datetime(String reserve_datetime) {
		this.reserve_datetime = reserve_datetime;
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
