package org.gidal.search.service;

import java.util.List;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.search.dao.SearchBoardDAO;
import org.gidal.search.domain.FilterVO;
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

	/**
	 * 식당게시판 검색 필터링
	 *
	 * @see org.gidal.search.service.SearchService#search_filter(FilterVO)
	 * @param FilterVO
	 * @return List<EnterpriseVO>
	 * @throws
	 */

	@Override
	public List<EnterpriseVO> search_filter(FilterVO vo) {
		return dao.search_filter(vo);
	}



}
