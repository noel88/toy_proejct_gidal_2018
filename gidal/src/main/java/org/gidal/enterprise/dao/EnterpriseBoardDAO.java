package org.gidal.enterprise.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface EnterpriseBoardDAO {

	public int enterpriseBoard_update(EnterpriseVO vo);
	public List<EnterpriseVO> enterpriseBoard_view();



}
