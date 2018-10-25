package org.gidal.reserve.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.gidal.enterprise.service.EnterpriseService;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.reserve.service.ReserveService;
import org.gidal.review.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reserve/")
public class ReserveController {


	@Inject private ReserveService service;
	@Inject private ReviewService re;
	@Inject private EnterpriseService ent;

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
	public String enterprise_details(@RequestParam("enterprise_code") int code, HttpSession session, Model model) {

		String email = (String)session.getAttribute("LOGIN");

		if (email == null) {
			return "redirect:/authentication/signIn";
		}else {
		model.addAttribute(ent.enterpriseBoard_view(code));
		session.setAttribute("user", service.selectOne(email));
		model.addAttribute(service.selectOne(code));
			return "/reserve/reserve";
		}

	}

	/**
	 * @throws Exception
	 * 예약 처리 메소드
	 *
	 * @param ReserveVO
	 * @return String
	 * @throws
	 */


	@RequestMapping(value = "/reserve_insert", method = RequestMethod.GET)
	public String reserve_insert(ReserveVO vo) throws Exception {

		service.reserve_insert(vo);
		 return "/reserve/success";
	}

}






