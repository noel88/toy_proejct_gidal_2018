package org.gidal.user.domain;

import java.util.Date;

public class UserPageWaitingVO {
	private String enterprise_businessName; // 매장명
	private int waiting_personnel;
	private Date waiting_now;
	private String user_name;
	public String getEnterprise_businessName() {
		return enterprise_businessName;
	}
	public void setEnterprise_businessName(String enterprise_businessName) {
		this.enterprise_businessName = enterprise_businessName;
	}
	public int getWaiting_personnel() {
		return waiting_personnel;
	}
	public void setWaiting_personnel(int waiting_personnel) {
		this.waiting_personnel = waiting_personnel;
	}
	public Date getWaiting_now() {
		return waiting_now;
	}
	public void setWaiting_now(Date waiting_now) {
		this.waiting_now = waiting_now;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
}