package org.gidal.user.service;

import org.gidal.user.domain.UserVO;

public interface UserAdminService {


	public UserVO user_password_forget(UserVO vo);
	public void user_delete();



}
