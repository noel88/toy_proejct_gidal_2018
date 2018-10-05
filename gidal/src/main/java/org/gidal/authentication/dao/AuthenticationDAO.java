package org.gidal.authentication.dao;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;

public interface AuthenticationDAO {

	public UserVO user_check(UserVO vo);
	public EnterpriseVO enterprise_check(EnterpriseVO vo);
	public int user_password_foget(UserVO vo);
	public int enterprise_password_foget(EnterpriseVO vo);


}
