package org.gidal.search.service;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface SearchService {

	public List<EnterpriseVO> search_list(String search);
	
}
