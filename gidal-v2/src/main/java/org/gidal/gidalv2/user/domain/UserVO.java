package org.gidal.gidalv2.user.domain;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserVO {
    private String user_email; //이메일
    private String user_password; //비밀번호
    private String user_name; //이름
    private String user_gender; //성별
    private String user_phoneNum; //핸드폰번호
    private String Enterprise_yn ;//기업인지 아닌지
}
