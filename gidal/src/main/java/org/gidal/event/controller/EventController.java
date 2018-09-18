package org.gidal.event.controller;

import javax.inject.Inject;

import org.gidal.event.domain.PageInfo;
import org.gidal.event.service.EventService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/event")
public class EventController {

	@Inject
	private EventService service;
	
	private final int LIMIT = 10;

	@RequestMapping(value = "/closedEvent", method = RequestMethod.GET)
	public void closedEvent(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) throws Exception {
		int closedEventListCount = service.closedEventListCount();
		
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, closedEventListCount));
		
		model.addAttribute("list", service.closedEventList(page));

	}

	@RequestMapping(value = "/currentEvent", method = RequestMethod.GET)
	public void currentEvent(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) throws Exception {
		
		int currentEventListCount = service.currentEventListCount();
		
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, currentEventListCount));
		
		model.addAttribute("list", service.currentEventList(page));
	}

	@RequestMapping(value = "/upcomingEvent", method = RequestMethod.GET)
	public void upcomingEvent(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) throws Exception {
		
		int upcomingEventListCount = service.upcomingEventListCount();
		
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, upcomingEventListCount));
		
		model.addAttribute("list", service.upcomingEventList(page));

	}

	@RequestMapping(value = "/detailEvent", method = RequestMethod.GET)
	public void read(@RequestParam("event_no") int event_no, Model model) throws Exception {
		model.addAttribute(service.detailEvent(event_no));
	}

}
