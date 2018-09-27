package org.gidal.enterprise.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.springframework.stereotype.Repository;

@Repository
public class EnterpriseDAOImpl implements EnterpriseDAO{

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.gidal.mapper.EnterpriseMapper";

	@Override
	public int enterprise_join(EnterpriseVO vo) {
		return sqlsession.insert(namespace + ".join", vo);
	}

	@Override
	public int enterpriseBoard_update(EnterpriseVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<EnterpriseVO> enterpriseBoard_view() {
		return null;

	}

	@Override
	public List<EnterpriseVO> enterpriseBoard_list() {
		return sqlsession.selectList(namespace + ".boardlist");
	}

	@Override
	public String enterprise_check(String email) {
		return sqlsession.selectOne(namespace + ".emailCheck", email);
	}



}
