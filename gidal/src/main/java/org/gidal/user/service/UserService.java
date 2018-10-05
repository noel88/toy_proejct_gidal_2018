package org.gidal.user.service;

import java.util.List;

import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.SessionPageVO;
import org.gidal.user.domain.UserPageVO;
import org.gidal.user.domain.UserPageWaitingVO;
import org.gidal.user.domain.UserVO;

public interface UserService {

	public int user_join(UserVO vo);
	public int user_revise(UserVO vo);
	public int userDelete(UserVO vo);
	public List<UserVO> userBoard_view();

	public List<UserPageVO> UserPageReserve(int page,String user_email) throws Exception;
	public int UserPageReserveCount();
	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount);
	public List<UserPageWaitingVO> UserPageWaiting(int page,String user_email) throws Exception;
	public int UserPageWaitingCount();

	public int user_check(UserVO vo);
	

}
