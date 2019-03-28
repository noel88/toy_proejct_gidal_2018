package org.gidal.gidalv2.user.controller;


import org.gidal.gidalv2.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user/")
public class UserController {

    @Autowired private UserService userService;


    //회원가입 페이지 이동
    @RequestMapping(value = "/regPage")
    public String regPage() {
        return "user/regPage";
    }

    //회원가입 액션
    @RequestMapping(value = "/")
    public String index() {
        return "user/index";
    }




}
