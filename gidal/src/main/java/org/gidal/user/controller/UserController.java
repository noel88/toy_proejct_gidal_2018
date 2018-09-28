package org.gidal.user.controller;

import javax.inject.Inject;


import org.gidal.user.domain.UserVO;
import org.gidal.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Inject
	private UserService service;
	private final int LIMIT = 10;

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

	//수정

	@RequestMapping(value = "/userpage", method = RequestMethod.GET)
	public String userpage() {
		return "user/userpage";
	}
	@RequestMapping(value = "/userReservePage", method = RequestMethod.GET)
	public void userReservePage(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)throws Exception  {
		int UserPageReserveCount = service.UserPageReserveCount();
		
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, UserPageReserveCount));
		
		model.addAttribute("list",service.UserPageReserve(page));
		
	}
	@RequestMapping(value = "/userWaitingPage", method = RequestMethod.GET)
	public void userWaitingPage(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model)throws Exception  {
		
		int UserPageWaitingCount = service.UserPageWaitingCount();
		
		model.addAttribute("pageInfo1", service.pageInfo(page, LIMIT, UserPageWaitingCount));
		
		model.addAttribute("list1",service.UserPageWaiting(page));
	}
	
}
