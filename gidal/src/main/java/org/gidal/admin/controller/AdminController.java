package org.gidal.admin.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.admin.service.AdminService;
import org.gidal.event.domain.EventVO;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService service;
	

	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminPage(HttpSession session) {
		
		String level = (String) session.getAttribute("LEVEL");
		
		if(level != null) {
			if(level.equals("admin")) {
				return "/admin/adminPage";
			} 
		}
		
		return "/authentication/noPermission";
		
	}
	
	@RequestMapping(value = "/eventRegist", method = RequestMethod.POST)
	public String eventRegist(EventVO event, RedirectAttributes rttr) throws Exception {

		service.eventRegist(event);
		
		rttr.addFlashAttribute("msg", "success");
		
	    return "redirect:/admin/adminPage";
	}
	
	
	


}
