package org.gidal.event.domain;

import java.sql.Date;

public class EventVO {
	
	private Integer event_no;
	private String event_title;
	private Date event_startDate;
	private Date event_endDate;
	private String event_image;
	private String event_content;

	private String event_startDateSQL;
	private String event_endDateSQL;
	
	public Integer getEvent_no() {
		return event_no;
	}

	public void setEvent_no(Integer event_no) {
		this.event_no = event_no;
	}
	
	public String getEvent_title() {
		return event_title;
	}
	
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	
	public Date getEvent_startDate() {
		return event_startDate;
	}
	
	public void setEvent_startDate(Date event_startDate) {
		this.event_startDate = event_startDate;
	}
	
	public Date getEvent_endDate() {
		return event_endDate;
	}
	
	public void setEvent_endDate(Date event_endDate) {
		this.event_endDate = event_endDate;
	}
	
	public String getEvent_image() {
		return event_image;
	}
	
	public void setEvent_image(String event_image) {
		this.event_image = event_image;
	}
	
	public String getEvent_content() {
		return event_content;
	}
	
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	
	public String getEvent_startDateSQL() {
		return event_startDateSQL;
	}

	public void setEvent_startDateSQL(String event_startDateSQL) {
		this.event_startDateSQL = event_startDateSQL;
	}

	public String getEvent_endDateSQL() {
		return event_endDateSQL;
	}

	public void setEvent_endDateSQL(String event_endDateSQL) {
		this.event_endDateSQL = event_endDateSQL;
	}
}
