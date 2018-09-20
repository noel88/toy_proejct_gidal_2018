package org.gidal.enterprise.service;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface EnterpriseService {

	public int enterprise_join(EnterpriseVO vo);
	public int enterpriseBoard_update(EnterpriseVO vo);
	public List<EnterpriseVO> enterpriseBoard_list();
	public List<EnterpriseVO> enterpriseBoard_view();











}
