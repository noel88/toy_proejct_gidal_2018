package org.gidal.review.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.domain.ReviewVO;
import org.gidal.review.service.ReviewService;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Inject
	private ReviewService service;


	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String show(String rwDiv, int code, Model model) {
		
		if(rwDiv.equals("R")) {
			ReserveVO content = new ReserveVO();
			content = service.reserve(code);
			String enterprise_businessName = service.getEnterprise_businessName(content.getEnterprise_code());
			model.addAttribute("content", content);
			model.addAttribute("enterprise_businessName", enterprise_businessName);
		} else {
			WaitingVO content = new WaitingVO();
			content = service.waiting(code);
			String enterprise_businessName = service.getEnterprise_businessName(content.getEnterprise_code());
			model.addAttribute("content", content);
			model.addAttribute("enterprise_businessName", enterprise_businessName);
		}
		
		model.addAttribute("rwDiv", rwDiv);
		return "review/show";

	}
	@RequestMapping(value = "/userReview", method = RequestMethod.POST)
	public String userReview(ReviewVO vo, Model model, HttpSession session) {

		service.userReview(vo);
		model.addAttribute("review",vo);
	    return "redirect:/user/userpage";
	}



}
