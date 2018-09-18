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

		return "/enterprise/enterprise";

	}


	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String enterprise_join(EnterpriseVO vo, Model model) {




		 int result = service.enterprise_join(vo);

		 if(result > 0) {
			 model.addAttribute("id", vo);
			 return "redirect:/authentication/signIn";
		 }else {
			 //error
			 return "redirect:/signFail";
		 }
	}


	//식당목록보기
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String enterprise_view(Model model) {
		model.addAttribute("list", service.enterpriseBoard_list());
		return "/enterprise/enterpriseBoardView";
	}


	//필터링해서 보여주기
	//예약하기
	//웨이팅하기
	//수정




}
