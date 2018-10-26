package org.gidal.user.dao;

import java.util.List;

import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.SessionPageVO;
import org.gidal.user.domain.UserPageVO;
import org.gidal.user.domain.UserPageWaitingVO;
import org.gidal.user.domain.UserVO;

public interface UserDAO {

	public int user_join(UserVO vo);
	public int user_revise(UserVO vo );
	public int userDelete(UserVO vo);
	public List<UserVO> userBoard_view();

	public List<UserPageVO> UserPageReserve(SessionPageVO vo) throws Exception;
	public int UserPageReserveCount();
	public List<UserPageWaitingVO> UserPageWaiting(SessionPageVO vo) throws Exception;
	public int UserPageWaitingCount();
	public PageInfo pageInfo();

	public int user_check(UserVO vo);
	public String getUser_password(UserVO vo);


}
