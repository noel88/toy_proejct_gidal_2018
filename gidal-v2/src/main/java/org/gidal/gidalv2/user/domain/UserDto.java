package org.gidal.gidalv2.user.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;

@Data
@Builder @NoArgsConstructor @AllArgsConstructor
public class UserDto {

    @NotEmpty
    private String user_email; //이메일
    @NotEmpty
    private String user_password; //비밀번호
    @NotEmpty
    private String user_name; //이름
    @NotEmpty
    private String user_gender; //성별
    @NotEmpty
    private String user_phoneNum; //핸드폰번호
    @NotEmpty
    private String enterprise_yn ; //기업인지 아닌지

}
