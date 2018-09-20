package org.gidal.waiting.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Repository;


@Repository
public class WaitingDAOImpl implements WaitingDAO {

	@Inject
	private SqlSession sqlsession;
	private static String namespace = "org.gidal.mapper.WaitingMapper";



	@Override
	public int waiting_insert(WaitingVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<WaitingVO> waiting_view() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int waiting_update() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void waiting_cancel() {
		// TODO Auto-generated method stub

	}

	@Override
	public EnterpriseVO selectOne(Integer code) {
		return sqlsession.selectOne(namespace + ".selectView", code);
	}

	@Override
	public UserVO selectUser(String str) {
		return sqlsession.selectOne(namespace + ".selectOne", str);
	}

}
