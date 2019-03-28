package org.gidal.gidalv2.authentication.service;

import org.gidal.gidalv2.user.domain.UserVO;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {
    @Override
    public int login(UserVO userVO) throws Exception {
        return 0;
    }

    @Override
    public void logout() {

    }

    @Override
    public String findByMail(String mail) {
        return null;
    }

    @Override
    public String resetPass(String mail) {
        return null;
    }
}
