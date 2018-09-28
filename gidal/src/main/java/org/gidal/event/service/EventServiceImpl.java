package org.gidal.event.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.gidal.event.dao.EventDAO;
import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	private EventDAO dao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Override
	public List<EventVO> closedEventList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.closedEventList(startRow);
	}

	@Override
	public List<EventVO> currentEventList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.currentEventList(startRow);
	}
	
	@Override
	public List<EventVO> upcomingEventList(int page) throws Exception {
		
		int startRow = (page - 1) * 10;
		
		return dao.upcomingEventList(startRow);
	}
	
	@Override
	public EventVO detailEvent(Integer event_no) throws Exception {
		return dao.detailEvent(event_no);
	}

	@Override
	public int closedEventListCount() {
		return dao.closedEventListCount();
	}
	
	@Override
	public int currentEventListCount() {
		return dao.currentEventListCount();
	}

	@Override
	public int upcomingEventListCount() {
		return dao.upcomingEventListCount();
	}

	@Override
	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount) {

		int maxPage = (int) ((double) upcomingEventListCount / LIMIT + 0.95);
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

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

	@Override
	public void eventModify(EventVO event) throws Exception {
		event.setEvent_content(event.getEvent_content().replaceAll("\r\n", "<br />"));
		
		if(event.getEvent_file().isEmpty()) {
			dao.eventModify(event);
		} else {
			EventVO oldEventVO = dao.detailEvent(event.getEvent_no());
			String oldFile = oldEventVO.getEvent_image();
			deleteFile(oldFile);
			
			MultipartFile mf = event.getEvent_file();
			
			String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());
			
			event.setEvent_image(savedName);
			
			dao.eventModify(event);
		}
		
	}
		
	@Override
	public void eventDelete(EventVO event) throws Exception {

			EventVO oldEventVO = dao.detailEvent(event.getEvent_no());
			String oldFile = oldEventVO.getEvent_image();
			
			if(oldFile != null) {
				deleteFile(oldFile);
			}
			dao.eventDelete(event);
		
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		String EventUploadPath = uploadPath + "\\event";
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		File target = new File(EventUploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;

	}
	
	private boolean deleteFile(String oldFile) throws Exception {
		boolean check = false;
		String EventUploadPath = uploadPath + "\\event";

		File target = new File(EventUploadPath, oldFile);
		
		check = target.delete();
		
		return check;
	}



}
