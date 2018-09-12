package org.gidal.enterprise.dao;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.waiting.domain.WaitingVO;

public interface EnterprisePageDAO {


	public int enterprisePage_reserve_history(ReserveVO vo);
	public int enterprisePage_waiting_history(WaitingVO vo);





}
