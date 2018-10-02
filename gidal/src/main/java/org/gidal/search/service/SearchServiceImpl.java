package org.gidal.search.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.search.dao.SearchBoardDAO;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchBoardDAO dao;
	
	@Override
	public List<EnterpriseVO> search_list(String search) {
		search = "%" + search + "%";
		return dao.search_list(search);
	}

}
