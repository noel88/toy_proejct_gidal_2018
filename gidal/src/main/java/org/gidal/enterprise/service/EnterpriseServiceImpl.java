package org.gidal.enterprise.service;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.gidal.enterprise.dao.EnterpriseDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.util.SHA256;
import org.springframework.stereotype.Service;


@Service
public class EnterpriseServiceImpl implements EnterpriseService{

	@Inject
	private EnterpriseDAO dao;

	/**
	 * 기업 회원가입 
	 * 
	 * 비밀번호 패스워드 암호화를 하여 등록.
	 * 
	 * @see org.gidal.enterprise.service.EnterpriseService#enterprise_join(org.gidal.enterprise.domain.EnterpriseVO)
	 * @param EnterpriseVO
	 * @return void
	 * @throws Exception
	 */

	@Override
	public void enterprise_join(EnterpriseVO vo) throws Exception {

		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);

		dao.enterprise_join(vo);
	}

	@Override
	public int enterpriseBoard_update(EnterpriseVO vo) {
		return 0;
	}
	
	@Override
	public List<EnterpriseVO> enterpriseBoard_view() {
		return null;
	}

	/**
	 * 기업 식당페이지 전체 목록 
	 * 
	 * @see org.gidal.enterprise.service.EnterpriseService#enterpriseBoard_list()
	 * @param 
	 * @return List
	 * @throws 
	 */

	@Override
	public List<EnterpriseVO> enterpriseBoard_list() {
		return dao.enterpriseBoard_list();
	}

	/**
	 * 기업 이메일 중복 체크
	 * 
	 * @see org.gidal.enterprise.service.EnterpriseService#enterprise_check(org.gidal.enterprise.domain.EnterpriseVO)
	 * @param EnterpriseVO
	 * @return int
	 * @throws 
	 */

	@Override
	public int enterprise_check(EnterpriseVO vo) {
		return dao.enterprise_check(vo);
	}






}
