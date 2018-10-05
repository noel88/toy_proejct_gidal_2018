package org.gidal.search.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;

public interface SearchBoardDAO {

	public List<EnterpriseVO> search_list(String search);

}
