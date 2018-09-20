package org.gidal.reserve.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.authentication.dto.LoginDTO;
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


	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public Model enterprise_details(@RequestParam("enterprise_code") int code, LoginDTO dto, HttpSession session, Model model) {

		String email = (String)session.getAttribute("LOGIN");


		session.setAttribute("user", service.selectOne(email));
		model.addAttribute(service.selectOne(code));

		return model;



	}

}






