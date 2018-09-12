package org.gidal.enterprise.dao;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface EnterpriseDAO {

	public int enterprise_join(EnterpriseVO vo);
	public EnterpriseVO enterprise_password_foget();
	public int enterprise_login();
	public void enterprise_delete();
	public void enterprise_logout();





}
