package org.gidal.authentication.dao;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;

public interface AuthenticationDAO {


	public UserVO user_login(UserVO user);
	public EnterpriseVO enterpirse_login(EnterpriseVO enterprise);
	
	public boolean user_check(UserVO vo);
	public boolean enterprise_check(EnterpriseVO vo);
	public int user_password_foget(UserVO vo);
	public int enterprise_password_foget(EnterpriseVO vo);
	public void user_delete(UserVO vo);
	public void enterprise_delete(EnterpriseVO vo);


}
