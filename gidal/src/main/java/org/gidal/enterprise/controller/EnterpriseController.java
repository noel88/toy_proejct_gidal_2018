package org.gidal.enterprise.controller;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.enterprise.service.EnterpriseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/enterprise/")
public class EnterpriseController {


	@Inject
	private EnterpriseService service;

	@RequestMapping(value = "/enterprise", method = RequestMethod.GET)
	public String enterprise_joinForm() {

		return "enterprise/enterprise";

	}


	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String enterprise_join(EnterpriseVO vo, Model model) {
		 int result = service.enterprise_join(vo);

		 if(result > 0) {
			 model.addAttribute("id", vo);
			 return "redirect:/";
		 }else {
			 //error
			 return "redirect:/signFail";
		 }
	}


}
