package org.gidal.admin.service;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;
import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.UserVO;

public interface AdminService {

	public void eventRegist(EventVO event) throws Exception;
	
	public List<UserVO> userList(int page) throws Exception;
	
	public List<EnterpriseVO> enterpriseList(int page) throws Exception;

	public int userRemove(String[] remove);

	public int enterpriseRemove(String[] remove);

	public int userListCount();

	public int enterpriseListCount();

	public PageInfo pageInfo(int page, int LIMIT, int upcomingEventListCount);

}
