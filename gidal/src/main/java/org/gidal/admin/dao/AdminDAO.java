package org.gidal.admin.dao;

import org.gidal.event.domain.EventVO;

public interface AdminDAO {

	public void eventRegist(EventVO event) throws Exception;

}
