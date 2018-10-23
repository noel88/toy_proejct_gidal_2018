package org.gidal.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info")
public class InfoController {

	// '기달이란' 페이지 이동
	@RequestMapping(value = "/whatIs", method = RequestMethod.GET)
	public void whatIs() {
	}

	// 오시는길 페이지 이동
	@RequestMapping(value = "/wayToCome", method = RequestMethod.GET)
	public void wayToCome() {
	}
	  
}
