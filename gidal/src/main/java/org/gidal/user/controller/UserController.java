package org.gidal.user.controller;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Inject
	private UserService service;

	@RequestMapping(value = "/individual", method = RequestMethod.GET)
	public String user_joinForm() {

		return "user/individual";

	}


	@RequestMapping(value = "/userjoin", method = RequestMethod.POST)
	public String user_join(UserVO vo, Model model) {
		 System.out.println(vo.getUser_email());
		int result = service.user_join(vo);

		 if(result > 0) {
			 model.addAttribute("id", vo);
			 return "redirect:/authentication/signIn";
		 }else {
			 //error
			 return "redirect:/signFail";
		 }
	}

	//이메일 중복확인
	@RequestMapping(value = "emailCheck", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody int idCheck(UserVO vo, Model model) {
        return service.user_check(vo);
    }




	//수정

	@RequestMapping(value = "/userpage", method = RequestMethod.GET)
	public String userpage() {
		return "user/userpage";
	}

}
