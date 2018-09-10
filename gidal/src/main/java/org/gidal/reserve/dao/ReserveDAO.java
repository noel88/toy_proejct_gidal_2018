package org.gidal.reserve.dao;

import java.util.List;

import org.gidal.reserve.domain.ReserveVO;

public interface ReserveDAO {

	public int reserve_insert();
	public List<ReserveVO> reserve_view();
	public int reserve_update();
	public void reserve_cancel();




}
