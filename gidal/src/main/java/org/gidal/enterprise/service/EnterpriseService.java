package org.gidal.enterprise.service;

import java.io.IOException;
import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.waiting.domain.WaitingVO;

public interface EnterpriseService {

	public void enterprise_join(EnterpriseVO vo) throws IOException, Exception;
	public int enterprise_check(EnterpriseVO vo);
	public int enterpriseBoard_update(EnterpriseVO vo);
	public List<EnterpriseVO> enterpriseBoard_list();
	public EnterpriseVO enterpriseBoard_view(Integer code);
	public List<WaitingVO> waiting_list(Integer code);
	public List<ReserveVO> reserve_list(Integer code);
	public int find_enterprise_code(String str);
	public int waiting_update(Integer code);
	public void delete(EnterpriseVO vo);
	public void enterprise_img(EnterpriseVO vo);









}
