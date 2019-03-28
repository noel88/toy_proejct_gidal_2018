package org.gidal.gidalv2.user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.gidal.gidalv2.user.domain.UserVO;

@Mapper
public interface UserMapper {

    //회원가입
    void userReg(UserVO uservo) throws Exception;

    //이메일 중복확인
    int mailCkeck(String mail) throws Exception;

}
