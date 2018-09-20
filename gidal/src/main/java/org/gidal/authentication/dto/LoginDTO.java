package org.gidal.authentication.dto;

public class LoginDTO {
	
	private String login_email;
	private String login_password;
	private boolean useCookie;
	
	public String getLogin_email() {
		return login_email;
	}
	
	public void setLogin_email(String login_email) {
		this.login_email = login_email;
	}
	
	public String getLogin_password() {
		return login_password;
	}
	
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
	
	public boolean isUseCookie() {
		return useCookie;
	}
	
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	

}
