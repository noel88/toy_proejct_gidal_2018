package org.gidal.reserve.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.reserve.domain.ReserveVO;
import org.gidal.reserve.service.ReserveService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reserve/")
public class ReserveController {


	@Inject
	private ReserveService service;

	/**
	 * 예약 페이지 이동 
	 * 
	 * 로그인 세션을 이용하여, 이름과 전화번호를 세션에 넣어주어 페이지 이동.
	 * 
	 * @param int, HttpSession, Model
	 * @return Model
	 * @throws 
	 */
	
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public Model enterprise_details(@RequestParam("enterprise_code") int code, HttpSession session, Model model) {

		String email = (String)session.getAttribute("LOGIN");


		session.setAttribute("user", service.selectOne(email));
		model.addAttribute(service.selectOne(code));

		return model;

	}

	/**
	 * 예약 처리 메소드
	 * 
	 * @param ReserveVO
	 * @return String
	 * @throws 
	 */
	
	@RequestMapping(value = "/reserve_insert", method = RequestMethod.GET)
	public String reserve_insert(ReserveVO vo) {

		service.reserve_insert(vo);

		 return "redirect:/";
	}

}






