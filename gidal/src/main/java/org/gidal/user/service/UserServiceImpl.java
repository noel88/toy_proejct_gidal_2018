package org.gidal.user.service;

import java.util.List;

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
		SHA256 sha = new SHA256();
		
		
		vo.setUser_password(sha.getSHA256(vo.getUser_password()));
		return dao.user_join(vo);

	}

	@Override
	public int userBoard_update(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> userBoard_view() {
		return null;
	}
	




}
