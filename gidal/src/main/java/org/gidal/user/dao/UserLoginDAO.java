package org.gidal.user.dao;

import org.gidal.user.domain.UserVO;

public interface UserLoginDAO {



	public boolean user_login(UserVO vo);
	public boolean user_facebook_login(UserVO vo);
	public void user_logout();




}
