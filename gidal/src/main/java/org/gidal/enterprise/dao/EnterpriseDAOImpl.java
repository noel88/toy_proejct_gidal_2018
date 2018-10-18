package org.gidal.enterprise.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.event.domain.EventVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.waiting.domain.WaitingVO;
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
		return sqlsession.update(namespace + ".enterprise_update", vo);
	}

	@Override
	public EnterpriseVO enterpriseBoard_view(Integer code) {
		return sqlsession.selectOne(namespace + ".allInfo_enterprise", code);

	}

	@Override
	public List<EnterpriseVO> enterpriseBoard_list() {

		return sqlsession.selectList(namespace + ".boardlist");
	}

	@Override
	public int enterprise_check(EnterpriseVO vo) {
		return sqlsession.selectOne(namespace + ".emailCheck", vo);
	}

	@Override
	public List<WaitingVO> waiting_list(Integer code) {
		return sqlsession.selectList(namespace + ".waiting_list", code);
	}

	@Override
	public int find_enterprise_code(String str) {
		return sqlsession.selectOne(namespace + ".find_enterprise_code", str);
	}

	@Override
	public int waiting_update(Integer no) {
		return sqlsession.update(namespace + ".update_yn", no);
	}

	@Override
	public List<ReserveVO> reserve_list(Integer code) {
		return sqlsession.selectList(namespace + ".reserve_list", code);
	}

	@Override
	public void delete(EnterpriseVO vo) {
		sqlsession.delete(namespace + ".enterprise_delete", vo);

	}

	@Override
	public void enterprise_img(EnterpriseVO vo) {
		sqlsession.update(namespace + ".enterprise_img", vo);
	}





}
