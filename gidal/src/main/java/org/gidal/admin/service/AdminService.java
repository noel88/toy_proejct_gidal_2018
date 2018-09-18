package org.gidal.admin.service;

import org.gidal.event.domain.EventVO;

public interface AdminService {

	public void eventRegist(EventVO event) throws Exception;
}
