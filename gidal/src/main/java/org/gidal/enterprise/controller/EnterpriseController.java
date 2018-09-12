package org.gidal.enterprise.controller;

import javax.inject.Inject;

import org.gidal.enterprise.service.EnterpriseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/enterprise/")
public class EnterpriseController {


	@Inject
	private EnterpriseService service;


	@RequestMapping("enterprise/join")
	public String enterprise_join() {


		return "rediect:/";
	}


}
