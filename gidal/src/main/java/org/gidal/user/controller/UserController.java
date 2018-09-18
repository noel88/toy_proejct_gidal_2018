package org.gidal.user.controller;

import javax.inject.Inject;


import org.gidal.user.domain.UserVO;
import org.gidal.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		 int result = service.user_join(vo);

		 if(result > 0) {
			 model.addAttribute("id", vo);
			 return "redirect:/";
		 }else {
			 //error
			 return "redirect:/signFail";
		 }
	}

	//수정




}
