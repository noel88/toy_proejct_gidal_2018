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
	// 페이지 정보를 받아 현재 페이지의 종료된 이벤트 추출
		
		int startRow = (page - 1) * 10;
		
		return dao.closedEventList(startRow);
	}

	@Override
	public List<EventVO> currentEventList(int page) throws Exception {
	// 페이지 정보를 받아 현재 페이지의 진행중인 이벤트 추출
		
		int startRow = (page - 1) * 10;
		
		return dao.currentEventList(startRow);
	}
	
	@Override
	public List<EventVO> upcomingEventList(int page) throws Exception {
	// 페이지 정보를 받아 현재 페이지의 진행예정 이벤트 추출
		
		int startRow = (page - 1) * 10;
		
		return dao.upcomingEventList(startRow);
	}
	
	@Override
	public EventVO detailEvent(Integer event_no) throws Exception {	// 이벤트 상세정보 조회
		return dao.detailEvent(event_no);
	}

	@Override
	public int closedEventListCount() {	// 종료된 이벤트 총 갯수 조회
		return dao.closedEventListCount();
	}
	
	@Override
	public int currentEventListCount() {	// 진행중인 이벤트 페이지 이동
		return dao.currentEventListCount();
	}

	@Override
	public int upcomingEventListCount() {	// 진행예정 이벤트 페이지 이동
		return dao.upcomingEventListCount();
	}

	@Override
	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount) {
	// 현재페이지, 출력갯수, 총 갯수
	
		int maxPage = (int) ((double) upcomingEventListCount / LIMIT + 0.95);	// 전체 마지막 페이지 번호
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;	// 출력될 시작 페이지 번호
		int endPage = startPage + 10 - 1;	// 출력될 마지막 페이지 번호

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

	@Override
	public void eventModify(EventVO event) throws Exception {
	// 이벤트 수정
	
		event.setEvent_content(event.getEvent_content().replaceAll("\r\n", "<br />"));
		// 이벤트 내용에 줄바꿈 있을시 줄바꿈 처리
		
		if(event.getEvent_file().isEmpty()) {
		// 이벤트에 이미지 파일이 변경 없을시 바로 이벤트 수정
			dao.eventModify(event);
		} else {
			EventVO oldEventVO = dao.detailEvent(event.getEvent_no());
			String oldFile = "";
			
			if(oldEventVO.getEvent_image() != null) {
				oldFile = oldEventVO.getEvent_image();
				deleteFile(oldFile);
				// 기존 이미지파일 있으면 기존 이미지 파일 삭제
			}
			
			MultipartFile mf = event.getEvent_file();
			String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());
			event.setEvent_image(savedName);
			dao.eventModify(event);
			// 새로운 이미지 파일 업로드 후 이벤트 수정
		}
		
	}
		
	@Override
	public void eventDelete(EventVO event) throws Exception {
	// 이벤트 삭제

			EventVO oldEventVO = dao.detailEvent(event.getEvent_no());
			String oldFile = oldEventVO.getEvent_image();
			
			if(oldFile != null) {
				deleteFile(oldFile);
				// 기존 이미지 파일 있으면 파일 삭제
			}
			dao.eventDelete(event);
			// 이벤트 삭제 처리
		
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
	
	private boolean deleteFile(String oldFile) throws Exception {
	// 이벤트 파일 삭제 처리
		
		boolean check = false;
		String EventUploadPath = uploadPath + "/event";

		File target = new File(EventUploadPath, oldFile);
		
		check = target.delete();
		
		return check;
	}



}
