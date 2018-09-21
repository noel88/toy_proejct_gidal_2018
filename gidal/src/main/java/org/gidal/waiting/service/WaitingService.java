package org.gidal.waiting.service;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.domain.WaitingVO;

public interface WaitingService {


	public EnterpriseVO selectOne(Integer code);
	public UserVO selectOne(String str);
	public int waiting_insert(WaitingVO vo);
}
