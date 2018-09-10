package org.gidal.enterprise.domain;

public class EnterpriseVO {

	private String enterprise_email; //이메일
	private String enterprise_password; //비밀번호
	private String enterprise_passwordConfirm; //비밀번호확인
	private String enterprise_name; //이름
	private String enterprise_gender; //성별
	private String enterprise_phoneNum; //핸드폰번호
	private String enterprise_businessName; // 상호명
	private String enterprise_phone; //연락처
	private String enterprise_code; // 상호코드
	private String enterprise_sectors; //업종
	private String enterprise_service; //서비스
	private String enterprise_ImgFile; //이미지
	private String enterprise_address; //주소
	private String enterprise_operatingTime; //영업시간
	private String enterprise_closed; //휴무일




	public EnterpriseVO() {

	}



	public EnterpriseVO(String enterprise_email, String enterprise_password, String enterprise_passwordConfirm,
			String enterprise_name, String enterprise_gender, String enterprise_phoneNum,
			String enterprise_businessName, String enterprise_phone, String enterprise_code, String enterprise_sectors,
			String enterprise_service, String enterprise_ImgFile, String enterprise_address,
			String enterprise_operatingTime, String enterprise_closed) {

		this.enterprise_email = enterprise_email;
		this.enterprise_password = enterprise_password;
		this.enterprise_passwordConfirm = enterprise_passwordConfirm;
		this.enterprise_name = enterprise_name;
		this.enterprise_gender = enterprise_gender;
		this.enterprise_phoneNum = enterprise_phoneNum;
		this.enterprise_businessName = enterprise_businessName;
		this.enterprise_phone = enterprise_phone;
		this.enterprise_code = enterprise_code;
		this.enterprise_sectors = enterprise_sectors;
		this.enterprise_service = enterprise_service;
		this.enterprise_ImgFile = enterprise_ImgFile;
		this.enterprise_address = enterprise_address;
		this.enterprise_operatingTime = enterprise_operatingTime;
		this.enterprise_closed = enterprise_closed;
	}



	public String getEnterprise_email() {
		return enterprise_email;
	}
	public void setEnterprise_email(String enterprise_email) {
		this.enterprise_email = enterprise_email;
	}
	public String getEnterprise_password() {
		return enterprise_password;
	}
	public void setEnterprise_password(String enterprise_password) {
		this.enterprise_password = enterprise_password;
	}
	public String getEnterprise_passwordConfirm() {
		return enterprise_passwordConfirm;
	}
	public void setEnterprise_passwordConfirm(String enterprise_passwordConfirm) {
		this.enterprise_passwordConfirm = enterprise_passwordConfirm;
	}
	public String getEnterprise_name() {
		return enterprise_name;
	}
	public void setEnterprise_name(String enterprise_name) {
		this.enterprise_name = enterprise_name;
	}
	public String getEnterprise_gender() {
		return enterprise_gender;
	}
	public void setEnterprise_gender(String enterprise_gender) {
		this.enterprise_gender = enterprise_gender;
	}
	public String getEnterprise_phoneNum() {
		return enterprise_phoneNum;
	}
	public void setEnterprise_phoneNum(String enterprise_phoneNum) {
		this.enterprise_phoneNum = enterprise_phoneNum;
	}
	public String getEnterprise_businessName() {
		return enterprise_businessName;
	}
	public void setEnterprise_businessName(String enterprise_businessName) {
		this.enterprise_businessName = enterprise_businessName;
	}
	public String getEnterprise_phone() {
		return enterprise_phone;
	}
	public void setEnterprise_phone(String enterprise_phone) {
		this.enterprise_phone = enterprise_phone;
	}
	public String getEnterprise_code() {
		return enterprise_code;
	}
	public void setEnterprise_code(String enterprise_code) {
		this.enterprise_code = enterprise_code;
	}
	public String getEnterprise_sectors() {
		return enterprise_sectors;
	}
	public void setEnterprise_sectors(String enterprise_sectors) {
		this.enterprise_sectors = enterprise_sectors;
	}
	public String getEnterprise_service() {
		return enterprise_service;
	}
	public void setEnterprise_service(String enterprise_service) {
		this.enterprise_service = enterprise_service;
	}
	public String getEnterprise_ImgFile() {
		return enterprise_ImgFile;
	}
	public void setEnterprise_ImgFile(String enterprise_ImgFile) {
		this.enterprise_ImgFile = enterprise_ImgFile;
	}
	public String getEnterprise_address() {
		return enterprise_address;
	}
	public void setEnterprise_address(String enterprise_address) {
		this.enterprise_address = enterprise_address;
	}
	public String getEnterprise_operatingTime() {
		return enterprise_operatingTime;
	}
	public void setEnterprise_operatingTime(String enterprise_operatingTime) {
		this.enterprise_operatingTime = enterprise_operatingTime;
	}
	public String getEnterprise_closed() {
		return enterprise_closed;
	}
	public void setEnterprise_closed(String enterprise_closed) {
		this.enterprise_closed = enterprise_closed;
	}



	@Override
	public String toString() {
		return "EnterpriseVO [enterprise_email=" + enterprise_email + ", enterprise_password=" + enterprise_password
				+ ", enterprise_passwordConfirm=" + enterprise_passwordConfirm + ", enterprise_name=" + enterprise_name
				+ ", enterprise_gender=" + enterprise_gender + ", enterprise_phoneNum=" + enterprise_phoneNum
				+ ", enterprise_businessName=" + enterprise_businessName + ", enterprise_phone=" + enterprise_phone
				+ ", enterprise_code=" + enterprise_code + ", enterprise_sectors=" + enterprise_sectors
				+ ", enterprise_service=" + enterprise_service + ", enterprise_ImgFile=" + enterprise_ImgFile
				+ ", enterprise_address=" + enterprise_address + ", enterprise_operatingTime="
				+ enterprise_operatingTime + ", enterprise_closed=" + enterprise_closed + "]";
	}










}
