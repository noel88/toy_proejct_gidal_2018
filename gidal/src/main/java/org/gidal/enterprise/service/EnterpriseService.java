package org.gidal.enterprise.service;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface EnterpriseService {

	public int enterprise_join(EnterpriseVO vo);
	public EnterpriseVO enterprise_password_foget();
	public int enterprise_login();
	public void enterprise_delete();
	public void enterprise_logout();
	public int enterpriseBoard_update(EnterpriseVO vo);
	public List<EnterpriseVO> enterpriseBoard_view();










}
