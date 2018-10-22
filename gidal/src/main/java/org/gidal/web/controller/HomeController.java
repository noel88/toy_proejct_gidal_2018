package org.gidal.web.controller;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.gidal.enterprise.service.EnterpriseService;
import org.gidal.event.domain.EventVO;
import org.gidal.web.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/")
public class HomeController {

	@Inject private HomeService service;
	@Inject private EnterpriseService ent;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {

//		List<EventVO> event = service.currentEventListAll();
//
//		System.out.println("**************************************");
//		System.out.println(event.size());

		model.addAttribute("eventList", service.currentEventListAll());
		model.addAttribute("ent", ent.ent_best());
		model.addAttribute("list", service.seachKeyword());


		return "home";
	}






}
