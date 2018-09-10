package org.gidal.user.domain;

public class UserVO {

	private String user_email; //이메일
	private String user_password; //비밀번호
	private String user_passwordConfirm; //비밀번호확인
	private String user_name; //이름
	private String user_gender; //성별
	private String user_phone; //핸드폰번호
	private String user_phoneCertification; //핸드폰번호인증



	public UserVO() {

	}


	public UserVO(String user_email, String user_password, String user_passwordConfirm, String user_name,
			String user_gender, String user_phone, String user_phoneCertification) {
		super();
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_passwordConfirm = user_passwordConfirm;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_phoneCertification = user_phoneCertification;
	}


	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_passwordConfirm() {
		return user_passwordConfirm;
	}
	public void setUser_passwordConfirm(String user_passwordConfirm) {
		this.user_passwordConfirm = user_passwordConfirm;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_phoneCertification() {
		return user_phoneCertification;
	}
	public void setUser_phoneCertification(String user_phoneCertification) {
		this.user_phoneCertification = user_phoneCertification;
	}

	@Override
	public String toString() {
		return "UserVO [user_email=" + user_email + ", user_password=" + user_password + ", user_passwordConfirm="
				+ user_passwordConfirm + ", user_name=" + user_name + ", user_gender=" + user_gender + ", user_phone="
				+ user_phone + ", user_phoneCertification=" + user_phoneCertification + "]";
	}









}
