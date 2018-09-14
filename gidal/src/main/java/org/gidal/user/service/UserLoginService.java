package org.gidal.user.service;

import org.gidal.user.domain.UserVO;

public interface UserLoginService {


	public boolean user_login(UserVO vo);
	public void user_logout();



}
