package org.gidal.authentication.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.authentication.dto.LoginDTO;
import org.gidal.authentication.service.AuthenticationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/authentication/")
public class AuthenticationController {
	
	@Inject
	private AuthenticationService service;

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String join() {

		return "authentication/signUp";
	}

	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String login() {
		return "authentication/signIn";
	}

	@RequestMapping(value = "/loginPOST", method = RequestMethod.POST)
	public String loginPOST(LoginDTO loginInfo, HttpSession session, Model model) {
		
		String signed = service.login(loginInfo);
		
		if(signed.equals("user")) {
			setLoginSession(loginInfo, "user", session);
			return "redirect:/";
		} else if(signed.equals("enterpirse")) {
			setLoginSession(loginInfo, "enterpirse", session);
			return "redirect:/";
		} else if(signed.equals("admin")) {
			setLoginSession(loginInfo, "admin", session);
			return "redirect:/";
		} else {
			return "authentication/signFail";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		
		session.invalidate();

		return "redirect:/";

	}

	@RequestMapping(value = "/noPermission", method = RequestMethod.GET)
	public void noPermission(HttpSession session) {
		
		session.invalidate();
		
		
	}
	
	public void setLoginSession(LoginDTO loginInfo, String level, HttpSession session) {
		session.setAttribute("LEVEL", level);
		session.setAttribute("LOGIN", loginInfo.getLogin_email());
	}






}
