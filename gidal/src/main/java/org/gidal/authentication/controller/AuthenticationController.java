package org.gidal.authentication.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.authentication.dto.LoginDTO;
import org.gidal.authentication.dto.ReissuePasswordDTO;
import org.gidal.authentication.service.AuthenticationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/authentication/")
public class AuthenticationController {
	
	@Inject
	private AuthenticationService service;

	// 회원가입 페이지 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String join() {
		return "authentication/signUp";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String login() {
		return "authentication/signIn";
	}

	// 로그인 실행
	@RequestMapping(value = "/loginPOST", method = RequestMethod.POST)
	public String loginPOST(LoginDTO loginInfo, HttpSession session, Model model) {
		
		// 로그인 실행
		String signed = service.login(loginInfo);
		
		// 로그인한 계정의 등급을 확인 후 세션에 등급 입력
		// 로그인 실패시 로그인실패 페이지 이동
		if(signed.equals("user")) {
			setLoginSession(loginInfo, "user", session);
			return "redirect:/";
		} else if(signed.equals("enterprise")) {
			setLoginSession(loginInfo, "enterprise", session);
			return "redirect:/enterprise/enter_page";
		} else if(signed.equals("admin")) {
			setLoginSession(loginInfo, "admin", session);
			return "redirect:/";
		} else {
			return "authentication/signFail";
		}
	}
	
	// 로그아웃 처리 후 홈화면 이동
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	
		service.logout(session);

		return "redirect:/";

	}

	// 접근권한 없는 페이지 접근시 로그아웃 처리 후 접근권한없음 페이지 이동
	@RequestMapping(value = "/noPermission", method = RequestMethod.GET)
	public void noPermission(HttpSession session) {

		service.logout(session);
		
	}
	
	// 비밀번호 재발급 페이지 이동
	@RequestMapping(value = "/reissuePassword", method = RequestMethod.GET)
	public String reissuePasswordGET() {
		return "authentication/reissuePassword";
	}

	// 비밀번호 재발급 처리 후 재발급 결과 페이지 이동
	@RequestMapping(value = "/reissuePassword", method = RequestMethod.POST)
	public String reissuePasswordPOST(ReissuePasswordDTO reissuePassword, RedirectAttributes rttr) {
		
		// 비밀번호 재발급 처리하여 newPassword에 입력
		String newPassword = service.reissuePassword(reissuePassword);
		
		// newPassword가 비어있지 않다면 재발급된 비밀번호정보 입력
		if(!(newPassword.equals(""))) {
			rttr.addFlashAttribute("msg", "reissuePasswordSuccess");
			rttr.addFlashAttribute("email", reissuePassword.getReissuePassword_email());
			rttr.addFlashAttribute("newPassword", newPassword);
		}

		return "redirect:/authentication/reissuePasswordResult";
	}
	
	// 재발급된 비밀번호 표시 페이지 이동
	@RequestMapping(value = "/reissuePasswordResult", method = RequestMethod.GET)
	public String reissuePasswordResult() {
		return "authentication/reissuePasswordResult";
	}
	
	// 로그인정보 세션에 등록
	public void setLoginSession(LoginDTO loginInfo, String level, HttpSession session) {
		session.setAttribute("LEVEL", level);
		session.setAttribute("LOGIN", loginInfo.getLogin_email());
	}


}
