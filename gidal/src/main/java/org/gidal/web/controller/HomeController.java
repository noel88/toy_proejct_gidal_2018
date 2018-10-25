package org.gidal.web.controller;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gidal.enterprise.service.EnterpriseService;
import org.gidal.event.domain.EventVO;
import org.gidal.web.service.HomeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/")
public class HomeController extends HandlerInterceptorAdapter{

	@Inject private HomeService service;
	@Inject private EnterpriseService ent;


	  @Override
	    public boolean preHandle(HttpServletRequest request,
	            HttpServletResponse response, Object handler) throws Exception {
	        System.out.println("preHandle executed");
	      return true;
	    }

	  	//모든창에서 검색 자동완성되게끔.
	    @Override
	    public void postHandle(HttpServletRequest request,
	            HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    		request.setAttribute("lists", service.seachKeyword());
	    		//modelAndView.addObject("lists", service.seachKeyword());

	    }

	    @Override
	    public void afterCompletion(HttpServletRequest request,
	            HttpServletResponse response, Object handler, Exception ex) throws Exception {
	        System.out.println("afterCompletion executed");

	    }




	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {

//		List<EventVO> event = service.currentEventListAll();
//
//		System.out.println("**************************************");
//		System.out.println(event.size());

		model.addAttribute("eventList", service.currentEventListAll());
		model.addAttribute("ent", ent.ent_best());

		return "home";
	}






}
