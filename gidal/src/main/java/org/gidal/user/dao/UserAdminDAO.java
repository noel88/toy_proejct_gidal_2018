package org.gidal.user.dao;

import org.gidal.user.domain.UserVO;

public interface UserAdminDAO {


	public UserVO user_password_forget(UserVO vo);
	public void user_delete();



}
