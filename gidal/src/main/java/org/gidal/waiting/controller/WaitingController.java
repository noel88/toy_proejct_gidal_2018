package org.gidal.waiting.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


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


	@RequestMapping(value = "/waiting", method = RequestMethod.GET)
	public Model enterprise_details(@RequestParam("enterprise_code") int code, HttpSession session, Model model) {

		String email = (String)session.getAttribute("LOGIN");
		session.setAttribute("user", service.selectOne(email));
		model.addAttribute(service.selectOne(code));
		return model;

	}




}
