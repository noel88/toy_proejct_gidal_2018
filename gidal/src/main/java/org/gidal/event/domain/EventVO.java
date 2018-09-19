package org.gidal.event.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	
	private Integer event_no;
	private String event_title;
	private Date event_startDate;
	private Date event_endDate;
	private String event_image;
	private String event_content;

	private MultipartFile event_file;
	
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
	
	public MultipartFile getEvent_file() {
		return event_file;
	}

	public void setEvent_file(MultipartFile event_file) {
		this.event_file = event_file;
	}

}
