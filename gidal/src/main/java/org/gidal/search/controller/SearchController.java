package org.gidal.search.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.search.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Inject
	private SearchService service;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String enterprise_view(String search, Model model, HttpSession session) {

		String login = (String)session.getAttribute("LOGIN");

		if(login == null) {
			return "redirect:/authentication/signIn";
		}else {
			model.addAttribute("list", service.search_list(search));
			return "/search/searchList";
		}

	}

}
