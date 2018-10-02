package org.gidal.waiting.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.reserve.domain.ReserveVO;
import org.gidal.waiting.domain.WaitingVO;
import org.gidal.waiting.service.WaitingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/waiting/")
public class WaitingController {


	@Inject
	private WaitingService service;

	/**
	 * 웨이팅 페이지 이동 
	 * 
	 * 로그인 세션을 이용하여, 이름과 전화번호를 세션에 넣어주어 페이지 이동.
	 * 
	 * @param int, HttpSession, Model
	 * @return Model
	 * @throws 
	 */

	@RequestMapping(value = "/waiting", method = RequestMethod.GET)
	public Model enterprise_details(@RequestParam("enterprise_code") int code, HttpSession session, Model model) {

		String email = (String)session.getAttribute("LOGIN");
		session.setAttribute("user", service.selectOne(email));
		model.addAttribute(service.selectOne(code));
		model.addAttribute("list",service.waiting_view(code));
		model.addAttribute("count",service.waiting_count(code));
		return model;

	}

	/**
	 * 웨이팅 처리 메소드
	 * 
	 * @param WaitingVO
	 * @return String
	 * @throws 
	 */
	
	@RequestMapping(value = "/waiting_insert", method = RequestMethod.GET)
	public String waiting_insert(WaitingVO vo) {

		service.waiting_insert(vo);
		 return "redirect:/";
	}




}
