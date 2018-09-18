package org.gidal.user.service;

import javax.inject.Inject;

import org.gidal.user.dao.UserDAO;
import org.gidal.user.domain.UserVO;
import org.gidal.util.SHA256;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	
	@Inject
	private UserDAO dao;
	
	
	
	@Override
	public int user_join(UserVO vo) {
		SHA256 sha = new SHA256();
		sha.getSHA256(vo.getUser_password());

		return dao.user_join(vo);

	}
	




}
