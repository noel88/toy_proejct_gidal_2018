package org.gidal.web;


import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */


@Controller
public class HomeController {


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}


	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String join() {

		return "signUp";
	}

	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String login() {

		return "signIn";
	}



}
