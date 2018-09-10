package org.gidal.waiting.domain;

public class WaitingVO {

	private String waiting_code;
	private String waiting_personnel;
	private String waiting_name;
	private String waiting_phone;
	private String waiting_wait_personnel;



	public WaitingVO() {

	}


	public WaitingVO(String waiting_code, String waiting_personnel, String waiting_name, String waiting_phone,
			String waiting_wait_personnel) {

		this.waiting_code = waiting_code;
		this.waiting_personnel = waiting_personnel;
		this.waiting_name = waiting_name;
		this.waiting_phone = waiting_phone;
		this.waiting_wait_personnel = waiting_wait_personnel;
	}


	public String getWaiting_code() {
		return waiting_code;
	}


	public void setWaiting_code(String waiting_code) {
		this.waiting_code = waiting_code;
	}


	public String getWaiting_personnel() {
		return waiting_personnel;
	}


	public void setWaiting_personnel(String waiting_personnel) {
		this.waiting_personnel = waiting_personnel;
	}


	public String getWaiting_name() {
		return waiting_name;
	}


	public void setWaiting_name(String waiting_name) {
		this.waiting_name = waiting_name;
	}


	public String getWaiting_phone() {
		return waiting_phone;
	}


	public void setWaiting_phone(String waiting_phone) {
		this.waiting_phone = waiting_phone;
	}


	public String getWaiting_wait_personnel() {
		return waiting_wait_personnel;
	}


	public void setWaiting_wait_personnel(String waiting_wait_personnel) {
		this.waiting_wait_personnel = waiting_wait_personnel;
	}


	@Override
	public String toString() {
		return "WaitingVO [waiting_code=" + waiting_code + ", waiting_personnel=" + waiting_personnel
				+ ", waiting_name=" + waiting_name + ", waiting_phone=" + waiting_phone + ", waiting_wait_personnel="
				+ waiting_wait_personnel + "]";
	}












}
