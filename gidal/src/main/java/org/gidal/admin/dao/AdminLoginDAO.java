package org.gidal.admin.dao;

import org.gidal.admin.domain.AdminVO;

public interface AdminLoginDAO {


	public int admin_login(AdminVO vo);
	public void admin_logout();

}
