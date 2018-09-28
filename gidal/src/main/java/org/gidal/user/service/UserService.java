package org.gidal.user.service;

import java.util.List;

import org.gidal.user.domain.UserVO;

public interface UserService {

	public int user_join(UserVO vo);
	public int userBoard_update(UserVO vo);
	public List<UserVO> userBoard_view();
	public int user_check(UserVO vo);
}
