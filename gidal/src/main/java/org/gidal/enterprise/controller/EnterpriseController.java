package org.gidal.enterprise.controller;




import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.AddDefaultCharsetFilter;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.enterprise.domain.PagingVO;
import org.gidal.enterprise.service.EnterpriseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/enterprise/")
public class EnterpriseController {


	@Inject
	private EnterpriseService service;




	@RequestMapping(value = "/enterprise", method = RequestMethod.GET)
	public String enterprise_joinForm() {

		return "/enterprise/enterprise";

	}



	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String enterprise_join(MultipartHttpServletRequest request) throws IOException, Exception {

			EnterpriseVO vo = new EnterpriseVO();

			//파일업로드

			vo.setEnterprise_email(request.getParameter("enterprise_email"));
			vo.setEnterprise_password(request.getParameter("enterprise_password"));
			vo.setEnterprise_name(request.getParameter("enterprise_name"));
			vo.setEnterprise_businessName(request.getParameter("enterprise_businessName"));
			vo.setEnterprise_phone(request.getParameter("enterprise_phone"));
			vo.setEnterprise_add1(request.getParameter("enterprise_add1"));
			vo.setEnterprise_add2(request.getParameter("enterprise_add2"));
			vo.setEnterprise_add3(request.getParameter("enterprise_add3"));
			vo.setEnterprise_operatingOpenTime(request.getParameter("enterprise_operatingOpenTime"));
			vo.setEnterprise_operatingCloseTime(request.getParameter("enterprise_operatingCloseTime"));
			vo.setEnterprise_breakStartTime(request.getParameter("enterprise_breakStartTime"));
			vo.setEnterprise_breakCloseTime(request.getParameter("enterprise_breakCloseTime"));
			vo.setEnterprise_closed(request.getParameter("enterprise_closed"));
			vo.setEnterprise_sectors(request.getParameter("enterprise_sectors"));
			vo.setEnterprise_service(request.getParameter("enterprise_service"));


			MultipartFile mf = request.getFile("enterprise_mainImg");
			MultipartFile mf1 = request.getFile("enterprise_img1");
			MultipartFile mf2 = request.getFile("enterprise_img2");
			MultipartFile mf3 = request.getFile("enterprise_img3");
			MultipartFile mf4 = request.getFile("enterprise_img4");

			String filename = mf.getOriginalFilename();
			String filename1 = mf1.getOriginalFilename();
			String filename2 = mf2.getOriginalFilename();
			String filename3 = mf3.getOriginalFilename();
			String filename4 = mf4.getOriginalFilename();

			File uploadFile = new File("c://upload//" + filename);
			File uploadFile1 = new File("c://upload//" + filename1);
			File uploadFile2 = new File("c://upload//" + filename2);
			File uploadFile3 = new File("c://upload//" + filename3);
			File uploadFile4 = new File("c://upload//" + filename4);

			try {

				mf.transferTo(uploadFile);
				mf1.transferTo(uploadFile1);
				mf2.transferTo(uploadFile2);
				mf3.transferTo(uploadFile3);
				mf4.transferTo(uploadFile4);

			}catch(Exception e) {
				e.printStackTrace();
			}

			vo.setEnterprise_mainImg(filename);
			vo.setEnterprise_img1(filename1);
			vo.setEnterprise_img2(filename2);
			vo.setEnterprise_img3(filename3);
			vo.setEnterprise_img4(filename4);

		        service.enterprise_join(vo);


		        return "redirect:/authentication/signIn";

	}



	//식당목록보기
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String enterprise_view(Model model, HttpSession session) {

		String login = (String)session.getAttribute("LOGIN");



		if(login == null) {

			return "redirect:/authentication/signIn";
		}else {

			model.addAttribute("list", service.enterpriseBoard_list());
			return "/enterprise/enterpriseBoardView";

		}

	}




/*
	//이메일 중복 확인
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public void enterprise_check(@RequestParam("enterprise_email") String email, EnterpriseVO vo, Model model) {

		vo.setEnterprise_email(email);
		model.addAttribute("result",service.enterprise_check(email));


	}*/

	@RequestMapping(value = "emailCheck", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody int idCheck(EnterpriseVO vo, Model model) {
        return service.enterprise_check(vo);
    }








	//수정




}
