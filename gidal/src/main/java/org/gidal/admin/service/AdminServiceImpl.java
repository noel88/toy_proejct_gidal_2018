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
		
		event.setEvent_content(event.getEvent_content().replaceAll("\r\n", "<br />"));
		
		if(event.getEvent_file().isEmpty()) {
			dao.eventRegist(event);
		} else {
			MultipartFile mf = event.getEvent_file();
			
			String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());
			
			event.setEvent_image(savedName);
			
			dao.eventRegist(event);
		}

	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		String EventUploadPath = uploadPath + "/event";
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		File target = new File(EventUploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;

	}

	@Override
	public List<UserVO> userList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.userList(startRow);
	}

	@Override
	public List<EnterpriseVO> enterpriseList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.enterpriseList(startRow);
	}

	@Override
	public int userRemove(String[] remove) {
		return dao.userRemove(remove);
		
	}
	
	@Override
	public int enterpriseRemove(String[] remove) {
		return dao.enterpriseRemove(remove);
	}

	@Override
	public int userListCount() {		
		return dao.userListCount();
	}
	
	@Override
	public int enterpriseListCount() {	
		return dao.enterpriseListCount();
	}

	@Override
	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount) {

		int maxPage = (int) ((double) upcomingEventListCount / LIMIT + 0.95);
		int startPage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(upcomingEventListCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		return pageInfo;
	}



}
