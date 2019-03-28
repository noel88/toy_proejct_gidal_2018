package org.gidal.gidalv2.user.service;

import org.gidal.gidalv2.user.domain.UserVO;

public interface UserService {

    //회원가입
    void userReg(UserVO uservo) throws Exception;

    //이메일 중복확인
    int mailCkeck(String mail) throws Exception;

    //마이 페이지에서 띄울 내용들

}
