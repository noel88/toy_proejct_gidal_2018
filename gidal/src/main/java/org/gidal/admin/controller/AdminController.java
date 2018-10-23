package org.gidal.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.admin.service.AdminService;
import org.gidal.event.domain.EventVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;

	private final int LIMIT = 10;

	/*@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }*/

	// adminPage 이동
	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminPage(@RequestParam(value = "userPage", required = false, defaultValue = "1") int userPage, 
			@RequestParam(value = "enterprisePage", required = false, defaultValue = "1") int enterprisePage,
			HttpSession session, Model model) throws Exception {
		
		// 세션의 레벨값을 level에 입력하여 로그인 계정의 등급을 확인
		String level = (String) session.getAttribute("LEVEL");
		
		if(level != null) {
			if(level.equals("admin")) {
				
				// 일반유저와 기업유저의 총 수를 읽어옴
				int userListCount = service.userListCount();
				int enterpriseListCount = service.enterpriseListCount();
				
				// 일반유저와 기업유저를 페이지처리(현재페이지, 출력갯수, 총 갯수)하여 model에 입력
				model.addAttribute("userPageInfo", service.pageInfo(userPage, LIMIT, userListCount));
				model.addAttribute("enterprisePageInfo", service.pageInfo(enterprisePage, LIMIT, enterpriseListCount));
				
				// 현재 페이지의 일반유저/기업유저의 정보를 model에 입력
				model.addAttribute("userList", service.userList(userPage));
				model.addAttribute("enterpriseList", service.enterpriseList(enterprisePage));

				// adminPage로 이동
				return "/admin/adminPage";
			} 
		}
		
		// 현재 계정의 등급이 관리자가 아니면 접근권한없음 페이지로 이동
		return "/authentication/noPermission";
		
	}
	
	// 삭제 체크된 유저목록을 가지고 삭제확인 페이지로 이동
	@RequestMapping(value = "removeCheck", method = RequestMethod.POST)
	public String removeCheck(
			@RequestParam(value = "levelCheck") String levelCheck, String[] remove, Model model) throws Exception {
		
		// levelCheck : 삭제하려는게 일반유저인지 기업유저인지 확인
		// remove : 삭제 체크된 유저목록
		model.addAttribute("levelCheck", levelCheck);
		model.addAttribute("remove", remove);
		
		return "/admin/removeCheck";
	}
	
	// 일반유저 삭제
	@RequestMapping(value = "/userRemove", method = RequestMethod.POST)
	public String userRemove(String password, String[] remove, RedirectAttributes rttr) throws Exception {
		
		// 삭제시 입력하는 관리자 비밀번호가 맞으면 유저 삭제 실행, 틀리면 접근권한없음 페이지 이동
		if(password.equals("admin")) {
			service.userRemove(remove);
			
			rttr.addFlashAttribute("msg", "userRemoveSuccess");

			return "redirect:/admin/adminPage";
		} else {
			return "/authentication/noPermission";
		}
		
	}

	// 기업유저 삭제
	@RequestMapping(value = "/enterpriseRemove", method = RequestMethod.POST)
	public String enterpriseRemove(String password, String[] remove, RedirectAttributes rttr) throws Exception {
		
		// 삭제시 입력하는 관리자 비밀번호가 맞으면 유저 삭제 실행, 틀리면 접근권한없음 페이지 이동
		if(password.equals("admin")) {
			service.enterpriseRemove(remove);
			
			rttr.addFlashAttribute("msg", "enterpriseRemoveSuccess");

			return "redirect:/admin/adminPage";
		} else {
			return "/authentication/noPermission";
		}
	}
	
	// 이벤트 추가
	@RequestMapping(value = "/eventRegist", method = RequestMethod.POST)
	public String eventRegist(EventVO event, RedirectAttributes rttr) throws Exception {

		service.eventRegist(event);
		
		rttr.addFlashAttribute("msg", "eventRegistSuccess");
		
	    return "redirect:/admin/adminPage";
	}

}
