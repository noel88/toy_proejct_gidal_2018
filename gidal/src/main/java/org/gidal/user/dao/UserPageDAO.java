package org.gidal.user.dao;

import org.gidal.user.domain.UserVO;

public interface UserPageDAO {


	public int myPage_user_update(UserVO vo);
	public int myPage_reserve_history(UserVO vo);
	public int myPage_choise_restaurant(UserVO vo);




}
