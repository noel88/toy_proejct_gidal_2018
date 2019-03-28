package org.gidal.gidalv2.authentication.service;

import org.gidal.gidalv2.user.domain.UserVO;


public interface AuthenticationService {

    //로그인
    int login(UserVO userVO) throws Exception;
    //로그아웃
    void logout();
    //이메일 찾기
    String findByMail(String mail);
    //비밀번호 재발급
    String resetPass(String mail);

}
