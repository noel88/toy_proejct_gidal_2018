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

	// 종료된 이벤트 페이지 이동
	@RequestMapping(value = "/closedEvent", method = RequestMethod.GET)
	public void closedEvent(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) throws Exception {
		// 종료된 이벤트 총 갯수 조회
		int closedEventListCount = service.closedEventListCount();
		
		// 종료된 이벤트 페이지 처리
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, closedEventListCount));
		
		// 현재 페이지의 종료된 이벤트 목록 조회
		model.addAttribute("list", service.closedEventList(page));

	}

	// 진행중인 이벤트 페이지 이동
	@RequestMapping(value = "/currentEvent", method = RequestMethod.GET)
	public void currentEvent(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) throws Exception {
		// 진행중인 이벤트 총 갯수 조회
		int currentEventListCount = service.currentEventListCount();

		// 진행중인 이벤트 페이지 처리
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, currentEventListCount));

		// 현재 페이지의 진행중인 이벤트 목록 조회
		model.addAttribute("list", service.currentEventList(page));
	}

	// 진행예정 이벤트 페이지 이동
	@RequestMapping(value = "/upcomingEvent", method = RequestMethod.GET)
	public void upcomingEvent(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) throws Exception {
		// 진행예정 이벤트 총 갯수 조회
		int upcomingEventListCount = service.upcomingEventListCount();

		// 진행예정 이벤트 페이지 처리
		model.addAttribute("pageInfo", service.pageInfo(page, LIMIT, upcomingEventListCount));

		// 현재 페이지의 진행예정 이벤트 목록 조회
		model.addAttribute("list", service.upcomingEventList(page));

	}

	// 이벤트 정보 상세보기
	@RequestMapping(value = "/detailEvent", method = RequestMethod.GET)
	public void read(@RequestParam("event_no") int event_no, int page, String state, Model model) throws Exception {
		
		// page : 현재 페이지
		// state : 종료된 / 진행중인 / 진행예정 이벤트 구분
		// eventVO : 조회한 이벤트 상세정보
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		model.addAttribute("eventVO", service.detailEvent(event_no));
	}

	// 이벤트 수정 페이지 이동
	@RequestMapping(value = "/eventModify", method = RequestMethod.POST)
	public void eventModify(@RequestParam("event_no") int event_no, String state, Model model) throws Exception {
		// state : 종료된 / 진행중인 / 진행예정 이벤트 구분
		// eventVO : 조회한 이벤트 상세정보
		model.addAttribute("state", state);
		model.addAttribute("eventVO", service.detailEvent(event_no));
	}

	// 이벤트 수정 처리 후 해당 이벤트 게시판 이동
	@RequestMapping(value = "/eventModifyExcute", method = RequestMethod.POST)
	public String eventModifyExcute(EventVO event, String state, RedirectAttributes rttr) throws Exception {

		String returnString = "/";
		
		// 이벤트 수정 처리
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
	
	// 이벤트 삭제 페이지 이동
	@RequestMapping(value = "/eventDelete", method = RequestMethod.POST)
	public void eventDelete(@RequestParam("event_no") int event_no, String state, Model model) throws Exception {
		// state : 종료된 / 진행중인 / 진행예정 이벤트 구분
		// eventVO : 조회한 이벤트 상세정보
		model.addAttribute("state", state);
		model.addAttribute("eventVO", service.detailEvent(event_no));
	}
	
	// 이벤트 삭제 처리 후 해당 이벤트 게시판 이동
	@RequestMapping(value = "/eventDeleteExcute", method = RequestMethod.POST)
	public String eventDeleteExcute(EventVO event, String state, String password, RedirectAttributes rttr) throws Exception {

		String returnString = "/";

		// 입력된 관리자 비밀번호 확인 후 불일치 시 접근권한없음 페이지 이동
		if(password.equals("admin")) {
			
			// 이벤트 삭제 처리
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
