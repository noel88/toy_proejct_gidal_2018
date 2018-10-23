package org.gidal.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info")
public class InfoController {

	@RequestMapping(value = "/whatIs", method = RequestMethod.GET)
	public void whatIs() {
	}

	@RequestMapping(value = "/wayToCome", method = RequestMethod.GET)
	public void wayToCome() {
	}
	  
}
