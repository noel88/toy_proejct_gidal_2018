package org.gidal.review.controller;

import javax.inject.Inject;

import org.gidal.review.domain.ReviewVO;
import org.gidal.review.service.ReviewService;
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
	public String show() {
		
		return "review/show";

	}
	@RequestMapping(value = "/userReview", method = RequestMethod.POST)
	public String userReview(ReviewVO vo,Model model) {
	  
		service.userReview(vo);
		model.addAttribute("review",vo);
	    return "redirect:/user/userpage";
	}
	
	
}
