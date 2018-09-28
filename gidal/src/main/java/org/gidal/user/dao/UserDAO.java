package org.gidal.user.dao;

import java.util.List;

import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.UserPageVO;
import org.gidal.user.domain.UserPageWaitingVO;
import org.gidal.user.domain.UserVO;

public interface UserDAO {

	public int user_join(UserVO vo);
	public int userBoard_update(UserVO vo );
	public List<UserVO> userBoard_view();
<<<<<<< HEAD
	public List<UserPageVO> UserPageReserve(int startRow) throws Exception;
	public int UserPageReserveCount();
	public List<UserPageWaitingVO> UserPageWaiting(int startRow) throws Exception;
	public int UserPageWaitingCount();
	public PageInfo pageInfo();
=======
	public int user_check(UserVO vo);

>>>>>>> branch 'master' of https://github.com/noel88/gidal.git

}
