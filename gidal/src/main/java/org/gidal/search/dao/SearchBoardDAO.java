package org.gidal.search.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.search.domain.FilterVO;

public interface SearchBoardDAO {

	public List<EnterpriseVO> search_list(String search);
	public List<EnterpriseVO> search_filter(FilterVO vo);


}
