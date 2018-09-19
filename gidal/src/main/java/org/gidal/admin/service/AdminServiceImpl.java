package org.gidal.admin.service;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.gidal.admin.dao.AdminDAO;
import org.gidal.event.domain.EventVO;
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
		
		System.out.println("**************" + event.getEvent_title());
		System.out.println("**************" + event.getEvent_startDate());
		System.out.println("**************" + event.getEvent_endDate());
		System.out.println("**************" + event.getEvent_image());
		System.out.println("**************" + event.getEvent_content());
		System.out.println("**************" + event.getEvent_file());
		
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

		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;

	}


}
