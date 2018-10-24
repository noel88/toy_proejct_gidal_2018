package org.gidal.user.domain;

import java.util.Date;

public class UserPageVO {
	private String enterprise_businessName; // 매장명
	private int enterprise_code;
	private int reserve_personnel;
	private Date reserve_datetime;
	private String user_name;
	private int reserve_code;




	public int getEnterprise_code() {
		return enterprise_code;
	}
	public void setEnterprise_code(int enterprise_code) {
		this.enterprise_code = enterprise_code;
	}
	public String getEnterprise_businessName() {
		return enterprise_businessName;
	}
	public void setEnterprise_businessName(String enterprise_businessName) {
		this.enterprise_businessName = enterprise_businessName;
	}
	public int getReserve_personnel() {
		return reserve_personnel;
	}
	public void setReserve_personnel(int reserve_personnel) {
		this.reserve_personnel = reserve_personnel;
	}
	public Date getReserve_datetime() {
		return reserve_datetime;
	}
	public void setReserve_datetime(Date reserve_datetime) {
		this.reserve_datetime = reserve_datetime;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getReserve_code() {
		return reserve_code;
	}
	public void setReserve_code(int reserve_code) {
		this.reserve_code = reserve_code;
	}

}
