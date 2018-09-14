package org.gidal.user.service;

import org.gidal.user.domain.UserVO;

public interface UserPageService {



	public int myPage_user_update(UserVO vo);
	public int myPage_reserve_history(UserVO vo);
	public int myPage_choise_restaurant(UserVO vo);



}
