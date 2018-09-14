package org.gidal.event.controller;

import javax.inject.Inject;

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

	  @RequestMapping(value = "/closedEvent", method = RequestMethod.GET)
	  public void closedEvent(Model model) throws Exception {
		  model.addAttribute("list", service.closedEventListAll());
	  }
	  
	  @RequestMapping(value = "/currentEvent", method = RequestMethod.GET)
	  public void currentEvent(Model model) throws Exception {
		  model.addAttribute("list", service.currentEventListAll());
	  }
	  
	  @RequestMapping(value = "/upcomingEvent", method = RequestMethod.GET)
	  public void upcomingEvent(Model model) throws Exception {
		  model.addAttribute("list", service.upcomingEventListAll());
	  }
	  
	  @RequestMapping(value = "/detailEvent", method = RequestMethod.GET)
	  public void read(@RequestParam("event_no") int event_no, Model model) throws Exception {
		  model.addAttribute(service.detailEvent(event_no));
	  }
	  
}
