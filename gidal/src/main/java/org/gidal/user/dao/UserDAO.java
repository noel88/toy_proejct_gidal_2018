package org.gidal.user.dao;

import java.util.List;

import org.gidal.user.domain.UserVO;

public interface UserDAO {

	public int user_join(UserVO vo);
	public int userBoard_update(UserVO vo );
	public List<UserVO> userBoard_view();


}
