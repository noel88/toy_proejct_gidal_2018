package org.gidal.web.controller;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gidal.enterprise.service.EnterpriseService;
import org.gidal.event.domain.EventVO;
import org.gidal.reserve.service.ReserveService;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.service.WaitingService;
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
	@Inject private ReserveService re;
	@Inject private WaitingService waiting;


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


	    		if(request.getSession().getAttribute("LEVEL") == "user") {

	    					String user = (String)request.getSession().getAttribute("LOGIN");
	    					String level = (String)request.getSession().getAttribute("LEVEL");

	    					System.out.println(level);

			    			re.selectOne(user);
			    			waiting.selectOne(user);
			    			request.setAttribute("lists", service.seachKeyword());
			    			request.setAttribute("reserve_alert", re.reserve_alert(re.selectOne(user).getUser_name()));
			    			request.setAttribute("reserve_alert_now", re.reserve_alert_now(re.selectOne(user).getUser_name()));
			    			request.setAttribute("waiting_alert", waiting.waiting_alert(waiting.selectOne(user).getUser_name()));
			    			System.out.println(user + "?");
	    		}




	    		//modelAndView.addObject("lists", service.seachKeyword());
	    }

	    @Override
	    public void afterCompletion(HttpServletRequest request,
	            HttpServletResponse response, Object handler, Exception ex) throws Exception {
	        System.out.println("afterCompletion executed");

	    }


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws Exception {

//		List<EventVO> event = service.currentEventListAll();
//
//		System.out.println("**************************************");
//		System.out.println(event.size());

		model.addAttribute("eventList", service.currentEventListAll());
		model.addAttribute("ent", ent.ent_best());

/*		if(session != null) {

		String level = (String)session.getAttribute("LEVEL");

		System.out.println(level);

		if(level == "user") {
			String user = (String)session.getAttribute("LOGIN");
			UserVO vo = re.selectOne(user);
			UserVO vo2 = waiting.selectOne(user);
			model.addAttribute("lists", service.seachKeyword());
			model.addAttribute("reserve_alert", re.reserve_alert(vo.getUser_name()));
			model.addAttribute("reserve_alert_now", re.reserve_alert_now(vo.getUser_name()));
			model.addAttribute("waiting_alert", waiting.waiting_alert(vo2.getUser_name()));
		}
		}
*/
		return "home";
	}






}
