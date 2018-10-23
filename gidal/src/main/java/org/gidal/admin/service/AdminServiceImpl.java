package org.gidal.admin.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.gidal.admin.dao.AdminDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Override
	public void eventRegist(EventVO event) throws Exception {
	// 이벤트 추가
		
		event.setEvent_content(event.getEvent_content().replaceAll("\r\n", "<br />"));
		// 이벤트 내용에 줄바꿈 있을시 줄바꿈 처리
		
		if(event.getEvent_file().isEmpty()) {
		// 이벤트에 이미지 파일이 없을시 바로 이벤트 등록, 없으면 파일 업로드 후 이벤트 등록
			
			dao.eventRegist(event);
		} else {
			MultipartFile mf = event.getEvent_file();
			
			String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());
			
			event.setEvent_image(savedName);
			
			dao.eventRegist(event);
		}

	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
	// 이벤트 파일 업로드 처리

		String EventUploadPath = uploadPath + "/event";
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		File target = new File(EventUploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;

	}

	@Override
	public List<UserVO> userList(int page) throws Exception {
	// 현재 유저 페이지 정보를 받아 일반유저목록 추출
		
		int startRow = (page - 1) * 10;
		
		return dao.userList(startRow);
	}

	@Override
	public List<EnterpriseVO> enterpriseList(int page) throws Exception {
	// 현재 유저 페이지 정보를 받아 기업유저목록 추출
		
		int startRow = (page - 1) * 10;
		
		return dao.enterpriseList(startRow);
	}

	@Override
	public int userRemove(String[] remove) {	// 일반유저 삭제
		return dao.userRemove(remove);
		
	}
	
	@Override
	public int enterpriseRemove(String[] remove) {	// 기업유저 삭제
		return dao.enterpriseRemove(remove);
	}

	@Override
	public int userListCount() {	// 일반유저의 총 갯수를 읽어옴	
		return dao.userListCount();
	}
	
	@Override
	public int enterpriseListCount() {		// 기업유저의 총 갯수를 읽어옴
		return dao.enterpriseListCount();
	}

	@Override
	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount) {
	// 현재페이지, 출력갯수, 총 갯수

		int maxPage = (int) ((double) upcomingEventListCount / LIMIT + 0.95);	// 전체 마지막 페이지 번호
		int startPage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1;	// 출력될 시작 페이지 번호
		int endPage = startPage + 5 - 1;	// 출력될 마지막 페이지 번호

		if (endPage > maxPage) {
			endPage = maxPage;	// endPage에 maxPage를 입력하여 없는 페이지가 안뜨도록 한다
		}
		
		PageInfo pageInfo = new PageInfo();
		
		//현재 페이지 정보 저장
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(upcomingEventListCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		return pageInfo;
	}



}
