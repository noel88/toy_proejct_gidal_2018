package org.gidal.gidalv2.user.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.gidal.gidalv2.config.TestDescription;
import org.gidal.gidalv2.user.domain.UserDto;
import org.gidal.gidalv2.user.domain.UserVO;
import org.gidal.gidalv2.user.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@SpringBootTest //모든 빈들을 다 등록해줌 (통합테스트)
@AutoConfigureMockMvc
@ActiveProfiles("test")
public class UserControllerTest {

    @Autowired
    UserMapper userMapper;

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    MockMvc mockMvc;


    @Test
    @TestDescription("정상적인 회원가입 완료")
    //TODO 요청 201
    public void createUser() throws Exception {

        UserDto user = UserDto.builder()
                .user_email("aaa@gmail.com")
                .user_phoneNum("010-2222-3333")
                .user_name("이시아")
                .user_password("1234")
                .user_gender("f")
                .enterprise_yn("n")
                .build()
                ;

        mockMvc.perform(post("/user/regAction")
                        .contentType(MediaType.APPLICATION_JSON_VALUE) //요청타입
                        .accept(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(user))
//                        .content("{\"user_email\":\"222@gami.com\",\"user_phoneNum\":\"123-235-5444\",\"user_name\":\"이시아\",\"user_password\":\"1234\",\"user_gender\":\"f\",\"enterprise_yn\":\"n\"}")
                )
                .andDo(print())
                .andExpect(status().isCreated())
                ;
    }

    @Test
    @TestDescription("입력값이 아예 없는 회원가입")
    //TODO 400에러
    public void createUser_Bad_Request_Empty_Input() throws Exception{

        UserVO userVO = UserVO.builder().build();

        mockMvc.perform(post("/user/regAction")
                        .contentType(MediaType.APPLICATION_JSON_VALUE) //요청타입
                        .accept(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(userVO))
        )
                .andDo(print())
                .andExpect(status().isBadRequest())
        ;
    }


    @Test
    @TestDescription("메일 중복 확인[중복되는 값이 없을때]")
    //TODO 200
    public void createUser_MailCkeck() throws Exception{

        String mail = "xxx";

        mockMvc.perform(post("/user/mailCk/{mail}", mail)
                        .contentType(MediaType.APPLICATION_JSON_VALUE) //요청타입
                        .accept(MediaType.APPLICATION_JSON)
                        .param( "mail", mail)
        )
                .andDo(print())
                .andExpect(status().isOk())

        ;
    }
    @Test
    @TestDescription("메일 중복 확인[중복되는 값이 있을때]")
    //TODO 200
    public void createUser_MailCkeck_DuplicateValue() throws Exception{

        UserVO user = UserVO.builder()
                .id(100)
                .user_email("aaa@gmail.com")
                .user_phoneNum("010-2222-3333")
                .user_name("이시아")
                .user_password("1234")
                .user_gender("f")
                .enterprise_yn("n")
                .admin_yn("n")
                .build()
                ;

        userMapper.userReg(user);
        String mail = "aaa@gmail.com";

        boolean mailDuplicationValue = user.getUser_email().equals(mail);

        mockMvc.perform(post("/user/mailCk/{mail}", mail)
                .contentType(MediaType.APPLICATION_JSON_VALUE) //요청타입
                .accept(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(user))
        )
                .andDo(print())
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("mail").value(user.getUser_email().equals(mail)))
        ;
    }
}