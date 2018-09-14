package org.gidal.user.service;

import javax.inject.Inject;

import org.gidal.user.dao.UserDAO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	
	@Inject
	private UserDAO dao;
	
	
	
	@Override
	public int user_join(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}




}
