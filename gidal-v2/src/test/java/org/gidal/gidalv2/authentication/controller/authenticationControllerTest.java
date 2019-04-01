package org.gidal.gidalv2.authentication.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.gidal.gidalv2.authentication.mapper.AuthenticationMapper;
import org.gidal.gidalv2.config.TestDescription;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;


@SpringBootTest
@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@ActiveProfiles("test")
public class authenticationControllerTest {

    @Autowired
    MockMvc mockMvc;

    @Autowired
    ObjectMapper objectMapper;

//    @Autowired
//    AuthenticationMapper authenticationMapper;

    @Test
    @TestDescription("로그인하는 테스트")
    public void getLogin() {
        LoginDto loginDto = LoginDto.builder()
                .loginId("aaa@gmail.com")
                .loginPw("1234")
                .build()
                ;

        mockMvc.perform(post("auth/login")
                    .contentType(MediaType.APPLICATION_JSON_VALUE) //요청타입
                    .accept(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(user))
        )
    }

}