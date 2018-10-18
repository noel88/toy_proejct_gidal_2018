package org.gidal.search.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.search.domain.FilterVO;
import org.springframework.stereotype.Repository;

@Repository
public class SearchBoardDAOImpl implements SearchBoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "org.gidal.mapper.SearchMapper";

	@Override
	public List<EnterpriseVO> search_list(String search) {
		return session.selectList(namespace + ".searchList", search);
	}

	@Override
	public List<EnterpriseVO> search_filter(FilterVO vo) {
		return session.selectList(namespace + ".search_fileter", vo);
	}



}
