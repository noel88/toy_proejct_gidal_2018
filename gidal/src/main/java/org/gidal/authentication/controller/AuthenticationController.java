package org.gidal.authentication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/authentication/")
public class AuthenticationController {

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String join() {

		return "authentication/signUp";
	}

	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String login() {

		return "authentication/signIn";
	}






}
