package org.gidal.reserve.service;




import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.user.domain.UserVO;

public interface ReserveService {

	public int reserve_insert(ReserveVO vo) throws Exception;
	public EnterpriseVO selectOne(Integer code);
	public UserVO selectOne(String str);
	public void reserve_cancel(String reserve_code);
	public List<ReserveVO> reserve_alert(String user);
	public List<ReserveVO> reserve_alert_now(String user);


}
