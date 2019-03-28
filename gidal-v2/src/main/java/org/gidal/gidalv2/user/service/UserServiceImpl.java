package org.gidal.gidalv2.user.service;

import org.gidal.gidalv2.user.domain.UserVO;
import org.gidal.gidalv2.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void userReg(UserVO uservo) throws Exception {

    }

    @Override
    public int mailCkeck(String mail) throws Exception {
        return 0;
    }
}
