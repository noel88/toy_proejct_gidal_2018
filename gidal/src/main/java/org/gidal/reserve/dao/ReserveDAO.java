package org.gidal.reserve.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;


public interface ReserveDAO {

	public int reserve_insert();
	public List<ReserveVO> reserve_view();
	public EnterpriseVO selectOne(Integer code);
	public int reserve_update();
	public void reserve_cancel();




}
