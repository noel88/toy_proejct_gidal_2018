package org.gidal.admin.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.admin.service.AdminService;
import org.gidal.event.domain.EventVO;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminPage(@RequestParam(value = "userPage", required = false, defaultValue = "1") int userPage, 
			@RequestParam(value = "enterprisePage", required = false, defaultValue = "1") int enterprisePage,
			HttpSession session, Model model) throws Exception {
		
		String level = (String) session.getAttribute("LEVEL");
		
		if(level != null) {
			if(level.equals("admin")) {
				
				int userListCount = service.userListCount();
				int enterpriseListCount = service.enterpriseListCount();
				
				model.addAttribute("userPageInfo", service.pageInfo(userPage, LIMIT, userListCount));
				model.addAttribute("enterprisePageInfo", service.pageInfo(enterprisePage, LIMIT, enterpriseListCount));
				
				model.addAttribute("userList", service.userList(userPage));
				model.addAttribute("enterpriseList", service.enterpriseList(enterprisePage));

				return "/admin/adminPage";
			} 
		}
		
		return "/authentication/noPermission";
		
	}
	
	@RequestMapping(value = "removeCheck", method = RequestMethod.POST)
	public String removeCheck(
			@RequestParam(value = "levelCheck") String levelCheck, String[] remove, Model model) throws Exception {
		
		model.addAttribute("levelCheck", levelCheck);
		model.addAttribute("remove", remove);
		
		return "/admin/removeCheck";
		
	}
	
	@RequestMapping(value = "/userRemove", method = RequestMethod.POST)
	public String userRemove(String password, String[] remove, RedirectAttributes rttr) throws Exception {
		
		if(password.equals("admin")) {
			service.userRemove(remove);
			
			rttr.addFlashAttribute("msg", "userRemoveSuccess");

			return "redirect:/admin/adminPage";
		} else {
			return "/authentication/noPermission";
		}
		
		
	}

	@RequestMapping(value = "/enterpriseRemove", method = RequestMethod.POST)
	public String enterpriseRemove(String password, String[] remove, RedirectAttributes rttr) throws Exception {
		
		
		if(password.equals("admin")) {
			service.enterpriseRemove(remove);
			
			rttr.addFlashAttribute("msg", "enterpriseRemoveSuccess");

			return "redirect:/admin/adminPage";
		} else {
			return "/authentication/noPermission";
		}
	}
	
	@RequestMapping(value = "/eventRegist", method = RequestMethod.POST)
	public String eventRegist(EventVO event, RedirectAttributes rttr) throws Exception {

		service.eventRegist(event);
		
		rttr.addFlashAttribute("msg", "eventRegistSuccess");
		
	    return "redirect:/admin/adminPage";
	}
	
	
	


}
