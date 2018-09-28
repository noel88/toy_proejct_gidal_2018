package org.gidal.user.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.event.domain.PageInfo;
import org.gidal.user.dao.UserDAO;
import org.gidal.user.domain.UserPageVO;
import org.gidal.user.domain.UserPageWaitingVO;
import org.gidal.user.domain.UserVO;
import org.gidal.util.SHA256;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;

	@Override
	public int user_join(UserVO vo) {
		SHA256 sha = new SHA256();


		vo.setUser_password(sha.getSHA256(vo.getUser_password()));
		return dao.user_join(vo);

	}

	@Override
	public int userBoard_update(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> userBoard_view() {
		return null;
	}

	@Override
	public int user_check(UserVO vo) {
		return dao.user_check(vo);
	}

<<<<<<< HEAD


	@Override
	public List<UserPageVO> UserPageReserve(int page) throws Exception {
		int startRow = (page - 1) * 10;
		
		return dao.UserPageReserve(startRow);
	}



	@Override
	public int UserPageReserveCount() {
		return dao.UserPageReserveCount();
	}



	@Override
	public PageInfo pageInfo(int page, int LIMIT, int UserPageReserveCount) {
		int maxPage = (int) ((double) UserPageReserveCount / LIMIT + 0.95);
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(UserPageReserveCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		return pageInfo;
	}



	@Override
	public List<UserPageWaitingVO> UserPageWaiting(int page) throws Exception {
			int startRow = (page - 1) * 10;
		
		return dao.UserPageWaiting(startRow);
	}



	@Override
	public int UserPageWaitingCount() {
		return dao.UserPageWaitingCount();
	}
	
=======
>>>>>>> branch 'master' of https://github.com/noel88/gidal.git




}
