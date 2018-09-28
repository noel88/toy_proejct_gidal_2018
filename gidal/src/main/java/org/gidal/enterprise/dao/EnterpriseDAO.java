package org.gidal.enterprise.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface EnterpriseDAO {

	public int enterprise_join(EnterpriseVO vo);
	public int enterprise_check(EnterpriseVO vo);
	public int enterpriseBoard_update(EnterpriseVO vo);
	public List<EnterpriseVO> enterpriseBoard_list();
	public List<EnterpriseVO> enterpriseBoard_view();



}
