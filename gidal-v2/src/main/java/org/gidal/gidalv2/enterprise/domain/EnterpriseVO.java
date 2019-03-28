package org.gidal.gidalv2.enterprise.domain;


import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class EnterpriseVO {

    private int enterprise_code; // 상호코드
    private String enterprise_businessName; // 매장명
    private String enterprise_phone; //연락처
    private String enterprise_sectors; //업종
    private String enterprise_service; //서비스
    private String enterprise_mainImg; //메인이미지
    private String enterprise_img1; //이미지1
    private String enterprise_img2; //이미지2
    private String enterprise_img3; //이미지3
    private String enterprise_img4; //이미지4
    private String enterprise_add1; //주소1
    private String enterprise_add2; //주소2
    private String enterprise_add3; //주소3
    private String enterprise_operatingOpenTime; //영업시간시작
    private String enterprise_operatingCloseTime; //영업시간종료
    private String enterprise_breakStartTime; //브레이크타임시작
	private String enterprise_breakCloseTime; //브레이크타임끝
    private String enterprise_closed; //휴무일

}
