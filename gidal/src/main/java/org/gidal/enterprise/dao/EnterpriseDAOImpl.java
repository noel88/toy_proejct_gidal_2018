package org.gidal.enterprise.dao;

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
	public EnterpriseVO enterprise_password_foget() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int enterprise_login() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void enterprise_delete() {
		// TODO Auto-generated method stub

	}

	@Override
	public void enterprise_logout() {
		// TODO Auto-generated method stub

	}

}
