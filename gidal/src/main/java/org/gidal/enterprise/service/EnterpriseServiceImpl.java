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



	@Override
	public void enterprise_join(EnterpriseVO vo) throws Exception {

		//패스워드 암호화

		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());

		vo.setEnterprise_password(pwd);

		dao.enterprise_join(vo);

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
		return dao.enterpriseBoard_list();
	}


	@Override
	public int enterprise_check(EnterpriseVO vo) {
		return dao.enterprise_check(vo);
	}






}
