package org.gidal.reserve.domain;

public class ReserveVO {


	private String reserve_code;
	private String reserve_personnel;
	private String reserve_date;
	private String reserve_time;
	private String reserve_name;
	private String reserve_phone;



	public ReserveVO() {

	}



	public ReserveVO(String reserve_code, String reserve_personnel, String reserve_date, String reserve_time,
			String reserve_name, String reserve_phone) {

		this.reserve_code = reserve_code;
		this.reserve_personnel = reserve_personnel;
		this.reserve_date = reserve_date;
		this.reserve_time = reserve_time;
		this.reserve_name = reserve_name;
		this.reserve_phone = reserve_phone;
	}



	public String getReserve_code() {
		return reserve_code;
	}



	public void setReserve_code(String reserve_code) {
		this.reserve_code = reserve_code;
	}



	public String getReserve_personnel() {
		return reserve_personnel;
	}



	public void setReserve_personnel(String reserve_personnel) {
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



	public String getReserve_name() {
		return reserve_name;
	}



	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}



	public String getReserve_phone() {
		return reserve_phone;
	}



	public void setReserve_phone(String reserve_phone) {
		this.reserve_phone = reserve_phone;
	}



	@Override
	public String toString() {
		return "ReserveVO [reserve_code=" + reserve_code + ", reserve_personnel=" + reserve_personnel
				+ ", reserve_date=" + reserve_date + ", reserve_time=" + reserve_time + ", reserve_name=" + reserve_name
				+ ", reserve_phone=" + reserve_phone + "]";
	}






}
