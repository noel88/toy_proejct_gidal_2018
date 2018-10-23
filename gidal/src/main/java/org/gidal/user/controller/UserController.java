package org.gidal.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user/")
public class UserController {

	@Inject
	private UserService service;
	private final int LIMIT = 10;
	/*유저 회원가입 폼으로 이동*/
	@RequestMapping(value = "/individual", method = RequestMethod.GET)
	public String user_joinForm() {

		return "user/individual";

	}

	/*유저 회원가입*/
	@RequestMapping(value = "/userjoin", method = RequestMethod.POST)
	public String user_join(UserVO vo, Model model) {
		 
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




	

	@RequestMapping(value = "/userpage", method = RequestMethod.GET)
	public Model userpage(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model,HttpSession session)throws Exception{
		int UserPageReserveCount = service.UserPageReserveCount();
		int UserPageWaitingCount = service.UserPageWaitingCount();
		String user_email = (String)session.getAttribute("LOGIN");
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, UserPageReserveCount));
		model.addAttribute("list",service.UserPageReserve(page,user_email));
		model.addAttribute("pageInfo1", service.pageInfo(page, LIMIT, UserPageWaitingCount));
		model.addAttribute("list1",service.UserPageWaiting(page,user_email));
	
		return model;
	}

	@RequestMapping(value = "/userReservePage", method = RequestMethod.GET)
	public void userReservePage(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model,HttpSession session)throws Exception  {
		int UserPageReserveCount = service.UserPageReserveCount();
		String user_email = (String)session.getAttribute("LOGIN");
		
		
	
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, UserPageReserveCount));
		
		model.addAttribute("list",service.UserPageReserve(page,user_email));
		
	}
	@RequestMapping(value = "/userWaitingPage", method = RequestMethod.GET)
	public void userWaitingPage(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model,HttpSession session)throws Exception  {
		
		int UserPageWaitingCount = service.UserPageWaitingCount();
		String user_email = (String)session.getAttribute("LOGIN");
		
		model.addAttribute("pageInfo1", service.pageInfo(page, LIMIT, UserPageWaitingCount));
		
		model.addAttribute("list1",service.UserPageWaiting(page,user_email));
	}
	
	@RequestMapping(value = "/userRevise", method = RequestMethod.POST)
	public String userRevise(UserVO vo, Model model) {
		service.user_revise(vo);
		
		return "redirect:/";

	}
	@RequestMapping(value = "/userReviseForm", method = RequestMethod.GET)
	public String userReviseForm() {

		return "user/userRevise";

	}
	@RequestMapping(value = "/userDeleteForm", method = RequestMethod.GET)
	public String userDeleteForm() {

		return "user/userDelete";

	}
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String userDelete(UserVO vo,HttpSession session) {
		service.userDelete(vo);
		session.invalidate();
		return "redirect:/";

	}


	
}
