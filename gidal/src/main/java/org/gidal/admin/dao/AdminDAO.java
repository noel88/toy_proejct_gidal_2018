package org.gidal.admin.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;
import org.gidal.user.domain.UserVO;

public interface AdminDAO {

	public void eventRegist(EventVO event) throws Exception;
	
	public List<UserVO> userList(int startRow) throws Exception;
	
	public List<EnterpriseVO> enterpriseList(int startRow) throws Exception;

	public int userRemove(String[] remove);

	public int enterpriseRemove(String[] remove);

	public int userListCount();

	public int enterpriseListCount();

}
