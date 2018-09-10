package org.gidal.waiting.dao;

import java.util.List;

import org.gidal.waiting.domain.WaitingVO;

public interface WaitingDAO {


	public int waiting_insert(WaitingVO vo);
	public List<WaitingVO> waiting_view();
	public int waiting_update();
	public void waiting_cancel();





}
