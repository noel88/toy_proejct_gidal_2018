package org.gidal.gidalv2.user.controller;


import org.gidal.gidalv2.user.domain.UserDto;
import org.gidal.gidalv2.user.domain.UserVO;
import org.gidal.gidalv2.user.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/user/")
public class UserController {

    @Autowired private UserService userService;
    @Autowired private ModelMapper modelMapper;

    //회원가입 페이지 이동
    @GetMapping(value = "/regPage")
    public String regPage() {
        return "user/regPage";
    }

    //회원가입 액션
    @ResponseBody
    @PostMapping(value = "/regAction", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity regAction(@RequestBody @Valid UserDto userDto) throws Exception{
        UserVO user = modelMapper.map(userDto, UserVO.class);
        //user.update();
        userService.userReg(user);
        return ResponseEntity.status(201).body(user);
    }

    //메일 중복확인
    @ResponseBody
    @PostMapping(value = "/mailCk/{mail}")
    public ResponseEntity mailCk(@PathVariable("mail") String mail) throws Exception {
        int mailCkeck = userService.mailCkeck(mail);
        int mailNotDuplicate = 0;

        if (mailNotDuplicate < mailCkeck) {
            return new ResponseEntity(mailCkeck, HttpStatus.BAD_REQUEST);
        }else {
            return new ResponseEntity(mailCkeck, HttpStatus.OK);
        }

    }




}
