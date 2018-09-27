package org.gidal.enterprise.service;

import java.io.IOException;
import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface EnterpriseService {

	public void enterprise_join(EnterpriseVO vo) throws IOException, Exception;
	public String enterprise_check(String email);
	public int enterpriseBoard_update(EnterpriseVO vo);
	public List<EnterpriseVO> enterpriseBoard_list();
	public List<EnterpriseVO> enterpriseBoard_view();











}
