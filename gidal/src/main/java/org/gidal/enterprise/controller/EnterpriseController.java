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

import com.google.gson.Gson;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/enterprise/")
public class EnterpriseController {


	@Inject
	private EnterpriseService service;



	/**
	 * 기업 회원가입 페이지 이동
	 *
	 * @param
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/enterprise", method = RequestMethod.GET)
	public String enterprise_joinForm() {

		return "/enterprise/enterprise";

	}


	/**
	 * 기업페이지 이동
	 *
	 * 예약현황, 웨이팅 목록, 기업정보를 가지고 감.
	 *
	 * @param HttpSession, Model
	 * @return String
	 * @throws
	 */


	@RequestMapping(value = "/enter_page", method = RequestMethod.GET)
	public Model enterprise_page(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);

		model.addAttribute("waiting",service.waiting_list(code));
		model.addAttribute("reserve",service.reserve_list(code));
		model.addAttribute("list", service.enterpriseBoard_view(code));


		return model;

	}

	/**
	 * 웨이팅 현황 업데이트 하기
	 *
	 * @param int
	 * @return String
	 * @throws
	 */


	@RequestMapping(value = "/update_yn", method = RequestMethod.GET)
	public String enterprise_page(@RequestParam("waiting_code") int code) {


		service.waiting_update(code);
		return "redirect:/enterprise/enter_page";

	}


	/**
	 * 글쓰기 폼으로 이동
	 *
	 * @param MultipartHttpServletRequest
	 * @return String
	 * @throws IOException, Exception
	 */

	//FIXME 파일 업로드 관련 정리, 파일명 [상포명+파일이름]으로 변경될수 있게.
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

	/**
	 * 식당 게시판 전체 목록 페이지
	 *
	 * 비회원은 페이지에 들어갈수 없다.
	 *
	 * @param Model, HttpSession
	 * @return String
	 * @throws
	 */

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

	/**
	 * 이메일 체크
	 *
	 * @param EnterpriseVO, Model
	 * @return @ResponseBody int
	 * @throws
	 */

	@RequestMapping(value = "emailCheck", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody int idCheck(EnterpriseVO vo, Model model) {
        return service.enterprise_check(vo);
    }

	/**
	 * 기업 탈퇴 페이지 이동
	 *
	 * @param
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "enterprise/delete";
	}


	/**
	 * 기업 탈퇴 처리
	 *
	 * @param HttpSession
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/delete_out", method = RequestMethod.GET)
	public String delete_out(HttpSession session) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		service.delete(code);
		session.invalidate();
		return "redirect:/";
	}



}
