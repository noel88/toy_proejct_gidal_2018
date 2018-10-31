package org.gidal.waiting.domain;

public class WaitingVO {

	private int waiting_code;
	private int enterprise_code;
	private int waiting_personnel;
	private String user_name;
	private String user_phoneNum;
	private String waiting_now;
	private String waiting_yn;
	private String waiting_wait_personnel;
	private String enterprise_businessName;





	public String getEnterprise_businessName() {
		return enterprise_businessName;
	}
	public void setEnterprise_businessName(String enterprise_businessName) {
		this.enterprise_businessName = enterprise_businessName;
	}
	public String getWaiting_yn() {
		return waiting_yn;
	}
	public void setWaiting_yn(String waiting_yn) {
		this.waiting_yn = waiting_yn;
	}
	public int getWaiting_code() {
		return waiting_code;
	}
	public void setWaiting_code(int waiting_code) {
		this.waiting_code = waiting_code;
	}
	public int getEnterprise_code() {
		return enterprise_code;
	}
	public void setEnterprise_code(int enterprise_code) {
		this.enterprise_code = enterprise_code;
	}
	public int getWaiting_personnel() {
		return waiting_personnel;
	}
	public void setWaiting_personnel(int waiting_personnel) {
		this.waiting_personnel = waiting_personnel;
	}

	public String getWaiting_wait_personnel() {
		return waiting_wait_personnel;
	}
	public void setWaiting_wait_personnel(String waiting_wait_personnel) {
		this.waiting_wait_personnel = waiting_wait_personnel;
	}
	public String getWaiting_now() {
		return waiting_now;
	}
	public void setWaiting_now(String waiting_now) {
		this.waiting_now = waiting_now;
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


