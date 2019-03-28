package org.gidal.enterprise.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.enterprise.domain.JoinEntReviewVO;
import org.gidal.enterprise.domain.PagingVO;
import org.gidal.enterprise.service.EnterpriseService;
import org.gidal.review.domain.ReviewVO;
import org.gidal.review.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import net.sf.json.JSONObject;


@Controller
@RequestMapping("/enterprise/")
public class EnterpriseController{


	@Inject private EnterpriseService service;
	@Inject private ReviewService re;




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
	 * 기업 페이지 상세정보 입력폼 이동
	 *
	 * @param
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/entForm", method = RequestMethod.GET)
	public String enterprise_Form(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		return "/enterprise/enterpriseDetail";

	}

	/**
	 * 기업 페이지 상세정보 로직
	 *
	 * @param HttpSession, EnterpriseVO
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/entDetailUpdate", method = RequestMethod.	POST)
	public String enterprise_detailUpdate(HttpSession session, EnterpriseVO vo) {
		String login_email = (String)session.getAttribute("LOGIN");
		vo.setEnterprise_email(login_email);

		service.ent_detail_update(vo);
		return "/enterprise/ent_page_main";

	}

	/**
	 * 기업 페이지 수정페이지 이동
	 *
	 * @param HttpSession, Model
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String enterprise_updateForm(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute("list", service.enterpriseBoard_view(code));
		return "/enterprise/ent_page_update";

	}

	/**
	 * 수정페이지에서 기업 정보 수정후 업데이트
	 *
	 * @param MultipartHttpServletRequest
	 * @return String
	 * @throws IOException, Exception
	 */

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String enterprise_update(MultipartHttpServletRequest request, EnterpriseVO vo, HttpSession session) throws IOException, Exception {

		String email = (String)session.getAttribute("LOGIN");
		vo.setEnterprise_email(email);

		service.enterpriseBoard_update(vo);
		return "redirect:/enterprise/ent_page_main";

	}

	/**
	 * 기업페이지 전체 예약 및 웨이팅 업데이트 현황[달력]
	 *
	 * @param HttpSession, Model
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/entCal", method = RequestMethod.GET)
	public String enterprise_cal(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("waiting",service.waiting_list(code));
		model.addAttribute("reserve",service.reserve_list(code));
		return "/enterprise/ent_page_reserveAndWaitingCal";

	}


	@RequestMapping(value = "/entReserveListCheck", method = RequestMethod.GET)
	public String enterprise_entReserveListCheck(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("reserveCheckList", service.reserve_listCheck(code));
		return "/enterprise/ent_page_reserveListCheck";

	}

	@RequestMapping(value = "/entReserveList", method = RequestMethod.GET)
	public String enterprise_entReserveList(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("reserveList", service.reserve_list(code));
		return "/enterprise/ent_page_reserveList";

	}

	@RequestMapping(value = "/entLastReserveList", method = RequestMethod.GET)
	public String enterprise_entLastReserveList(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("lastReserveList", service.last_reserve_list(code));
		return "/enterprise/ent_page_lastReserveList";

	}
	@RequestMapping(value = "/entWaitingList", method = RequestMethod.GET)
	public String enterprise_entWaitingList(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("waitingList", service.waiting_list(code));
		return "/enterprise/ent_page_waitingList";

	}
	@RequestMapping(value = "/entLastWaitingList", method = RequestMethod.GET)
	public String enterprise_entLastWaitingList(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("lastWaitingList", service.last_waiting_list(code));
		return "/enterprise/ent_page_lastWaitingList";

	}

	@RequestMapping(value = "/waitingReviewList", method = RequestMethod.GET)
	public String ent_waitingReviewList(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("waitingReview", service.waitingReview(code));
		return "/enterprise/ent_page_waitingReview";

	}
	@RequestMapping(value = "/reserveReviewList", method = RequestMethod.GET)
	public String ent_reserveReviewList(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("reserveReview", service.reserveReview(code));
		return "/enterprise/ent_page_reserveReview";

	}
	@RequestMapping(value = "/entDelete", method = RequestMethod.GET)
	public String enterprise_entDelete(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		return "/enterprise/ent_page_delete";

	}

	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String enterprise_reply(@RequestParam("review_code") int code, Model model) {
		model.addAttribute("reviewReply", service.findReview(code));
		return "/enterprise/reviewAndReply";

	}

	@RequestMapping(value = "/replyEnt", method = RequestMethod.GET)
	public String enterprise_replyEnt(Model model, ReviewVO vo) {

		service.entReply(vo);
		return "/enterprise/replySuccess";

	}

	@RequestMapping(value = "/delReply", method = RequestMethod.GET)
	public String enterprise_delReply(@RequestParam("review_code") int code) {
		service.delReply(code);
		return "/enterprise/delSuccess";

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


	@RequestMapping(value = "/ent_page_main", method = RequestMethod.GET)
	public void enterprise_page(HttpSession session, Model model) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);

		// 현재 남은 예약 및 대기목록 조회
		model.addAttribute("reserve_count", service.reserve_count(code));
		model.addAttribute("waiting_count", service.waiting_count(code));
		model.addAttribute(service.enterpriseBoard_view(code));
		model.addAttribute("reserve_listCheck_cnt", service.reserve_listCheck_cnt(code));
		model.addAttribute("waitingList", service.waiting_list(code));
		model.addAttribute("reserveNowList", service.reserve_now_list(code));
		model.addAttribute("total_reserve_cnt", service.total_reserve_cnt(code));
		model.addAttribute("total_waiting_cnt", service.total_waiting_cnt(code));
		model.addAttribute("total_review_cnt", service.total_review_cnt(code));



	}

	/**
	 * 웨이팅 현황 업데이트 하기
	 *
	 * @param int
	 * @return String
	 * @throws
	 */


	@RequestMapping(value = "/update_yn", method = RequestMethod.GET)
	public String enterprise_waiting_page(@RequestParam("waiting_code") int code) {

		service.waiting_update(code);
		return "redirect:/enterprise/ent_page_main";

	}

	/**
	 * 예약 현황 업데이트 하기
	 *
	 * @param int
	 * @return String
	 * @throws
	 */


	@RequestMapping(value = "/updateReserve_yn", method = RequestMethod.GET)
	public String enterprise_reserve_page(@RequestParam("reserve_code") int code) {

		service.reserve_update(code);
		return "redirect:/enterprise/ent_page_main";
	}

	@RequestMapping(value = "/updateReserveComfirmation_yn", method = RequestMethod.GET)
	public String enterprise_reserveComfirmation(@RequestParam("reserve_code") int code) throws Exception {

		service.update_reserveConfirmation_yn(code);
		return "redirect:/enterprise/entReserveList";
	}

	@RequestMapping(value = "/updateReserveCancel", method = RequestMethod.GET)
	public String enterprise_updateReserveCancel(@RequestParam("reserve_code") int code) throws Exception {

		service.update_updateReserveCancel(code);
		return "redirect:/enterprise/entReserveListCheck";
	}

	@RequestMapping(value = "/updateWaitingCancel", method = RequestMethod.GET)
	public String enterprise_updateWaitingCancel(@RequestParam("waiting_code") int code) throws Exception {

		service.update_updateWaitingCancel(code);
		return "redirect:/enterprise/entWaitingList";
	}

	@RequestMapping(value = "/update_Alert", method = RequestMethod.GET)
	public String enterprise_update_Alert(@RequestParam("waiting_code") int code) throws Exception {

		service.update_updateWaitingAlert(code);
		return "redirect:/enterprise/entWaitingList";
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
	public String enterprise_join(EnterpriseVO vo) throws IOException, Exception {
	     String no = "no_image.png";
		 vo.setEnterprise_mainImg(no);
		 service.enterprise_join(vo);
		 return "redirect:/authentication/signIn";
	}



	/**
	 * 기업페이지 수정에서 이미지만 ajax로 받는 로직
	 *
	 * @param MultipartHttpServletRequest, HttpSession, EnterpriseVO
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/img") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest,HttpSession session, EnterpriseVO vo) { //Multipart로 받는다.

		String email = (String)session.getAttribute("LOGIN");

        Iterator<String> itr =  multipartRequest.getFileNames();

        String filePath = "/opt/was/apache-tomcat-9.0.12/webapps/enterprise_img"; //설정파일로 뺀다.
//       String filePath = "C:/Users/a/Desktop/img"; //설정파일로 뺀다.

        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.

            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originalFilename = mpf.getOriginalFilename(); //파일명
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로

            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                vo.setEnterprise_email(email);
                vo.setEnterprise_mainImg(originalFilename);
                service.enterprise_img(vo);
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }

       }

        return "success";
	}


	/**
	 * 식당 게시판 전체 목록 페이지[최신순 정렬]
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
			model.addAttribute("list_cnt", service.list_cnt());

			return "/enterprise/enterpriseBoardView";
		}

	}

	@RequestMapping(value = "/enterprise_details", method = RequestMethod.GET)
	public void enterprise_details(Model model, @RequestParam("enterprise_code") int enterprise_code) {

			model.addAttribute(service.enterpriseBoard_view(enterprise_code));
			model.addAttribute("review",re.ent_review(enterprise_code));
			model.addAttribute("total_reserve_cnt", service.total_reserve_cnt(enterprise_code));
			model.addAttribute("total_waiting_cnt", service.total_waiting_cnt(enterprise_code));
			model.addAttribute("total_review_cnt", service.total_review_cnt(enterprise_code));


	}

	/**
	 * 식당 게시판 전체 목록 페이지[인기순 정렬]
	 *
	 * 비회원은 페이지에 들어갈수 없다.
	 *
	 * @param Model, HttpSession
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/popular", method = RequestMethod.GET)
	public String enterprise_popular(Model model, HttpSession session) {
			model.addAttribute("list_cnt", service.list_cnt());
			model.addAttribute("popular", service.ent_popular());
			return "/enterprise/enterpriseBoardView_pop";


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
	 * 기업 탈퇴 처리
	 *
	 * @param HttpSession
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/delete_out", method = RequestMethod.GET)
	public String delete_out(HttpSession session, EnterpriseVO vo) {
		String login_email = (String)session.getAttribute("LOGIN");
		int code = service.find_enterprise_code(login_email);
		vo.setEnterprise_code(code);

		int delete = service.delete(vo);
		if(delete == 0) {
			return "/enterprise/delfail";
		}else {
			session.invalidate();
			return "/enterprise/delOutSuccess";
		}


	}



}
