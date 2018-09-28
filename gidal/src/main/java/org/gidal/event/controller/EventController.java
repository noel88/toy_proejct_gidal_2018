package org.gidal.event.controller;

import javax.inject.Inject;

import org.gidal.event.domain.EventVO;
import org.gidal.event.service.EventService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void read(@RequestParam("event_no") int event_no, int page, String state, Model model) throws Exception {
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		model.addAttribute(service.detailEvent(event_no));
	}

	@RequestMapping(value = "/eventModify", method = RequestMethod.POST)
	public void eventModify(@RequestParam("event_no") int event_no, String state, Model model) throws Exception {
		model.addAttribute("state", state);
		model.addAttribute(service.detailEvent(event_no));
	}

	@RequestMapping(value = "/eventModifyExcute", method = RequestMethod.POST)
	public String eventModifyExcute(EventVO event, String state, RedirectAttributes rttr) throws Exception {

		String returnString = "/";
		
		service.eventModify(event);
		
		rttr.addFlashAttribute("msg", "eventModifySuccess");
		
		if(state.equals("current")) {
			returnString = "redirect:/event/currentEvent";
		} else if(state.equals("closed")) {
			returnString = "redirect:/event/closedEvent";
		} else if(state.equals("upcoming")) {
			returnString = "redirect:/event/upcomingEvent";
		}
		return returnString;
		
	}
	
	@RequestMapping(value = "/eventDelete", method = RequestMethod.POST)
	public void eventDelete(@RequestParam("event_no") int event_no, String state, Model model) throws Exception {
		model.addAttribute("state", state);
		model.addAttribute(service.detailEvent(event_no));
	}
	
	@RequestMapping(value = "/eventDeleteExcute", method = RequestMethod.POST)
	public String eventDeleteExcute(EventVO event, String state, String password, RedirectAttributes rttr) throws Exception {

		String returnString = "/";

		if(password.equals("admin")) {
			
			service.eventDelete(event);
			
			rttr.addFlashAttribute("msg", "eventDeleteSuccess");
			
			if(state.equals("current")) {
				returnString = "redirect:/event/currentEvent";
			} else if(state.equals("closed")) {
				returnString = "redirect:/event/closedEvent";
			} else if(state.equals("upcoming")) {
				returnString = "redirect:/event/upcomingEvent";
			}
			return returnString;
		} else {
			return "/authentication/noPermission";
		}
		
		
	}

}
