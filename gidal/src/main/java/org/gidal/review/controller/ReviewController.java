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

	// 리뷰 등록화면 이동
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write(String rwDiv, int code, Model model) {
		
		// rwDiv의 값으로 예약리뷰인지 웨이팅리뷰인지 판단
		if(rwDiv.equals("R")) {
			// 예약정보 조회
			ReserveVO content = new ReserveVO();
			content = service.reserve(code);
			String enterprise_businessName = service.getEnterprise_businessName(content.getEnterprise_code());
			model.addAttribute("content", content);
			model.addAttribute("enterprise_businessName", enterprise_businessName);
		} else {
			// 웨이팅정보 조회
			WaitingVO content = new WaitingVO();
			content = service.waiting(code);
			String enterprise_businessName = service.getEnterprise_businessName(content.getEnterprise_code());
			model.addAttribute("content", content);
			model.addAttribute("enterprise_businessName", enterprise_businessName);
		}
		
		model.addAttribute("rwDiv", rwDiv);
		
		// 리뷰 등록화면으로 이동
		return "review/write";

	}
	
	// 리뷰 화면으로 이동
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(String rwDiv, int code, String rcode, Model model) {

		// rwDiv의 값으로 예약리뷰인지 웨이팅리뷰인지 판단
		if(rwDiv.equals("R")) {
			// 예약정보 조회
			ReserveVO content = new ReserveVO();
			content = service.reserve(code);
			String enterprise_businessName = service.getEnterprise_businessName(content.getEnterprise_code());
			model.addAttribute("content", content);
			model.addAttribute("enterprise_businessName", enterprise_businessName);
		} else {
			// 웨이팅정보 조회
			WaitingVO content = new WaitingVO();
			content = service.waiting(code);
			String enterprise_businessName = service.getEnterprise_businessName(content.getEnterprise_code());
			model.addAttribute("content", content);
			model.addAttribute("enterprise_businessName", enterprise_businessName);
		}
		
		// 리뷰내용 조회
		model.addAttribute("review_content", service.readReview(rcode));
		model.addAttribute("rwDiv", rwDiv);

		// 리뷰 화면으로 이동
		return "review/view";
	}
	
	// 리뷰 등록처리
	@RequestMapping(value = "/userReview", method = RequestMethod.POST)
	public String userReview(ReviewVO vo, Model model, HttpSession session) {
		
		// 세션의 로그인정보를 vo에 입력
		vo.setUser_email((String) session.getAttribute("LOGIN"));
		// 리뷰 등록처리
		service.userReview(vo);
		
		return "/review/success";
	}

	//리뷰 삭제처리
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(String rcode, Model model) {
		
		//리뷰 삭제처리
		service.reviewDelete(rcode);
		return "/review/success";
	}
	


}
