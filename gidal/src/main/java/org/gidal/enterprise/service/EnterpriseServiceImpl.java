package org.gidal.enterprise.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.inject.Inject;
<<<<<<< HEAD

=======
>>>>>>> 5a3b816f2776eeb5e95d3e4f2644cbffaab11008
import org.gidal.enterprise.dao.EnterpriseDAO;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.util.SHA256;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class EnterpriseServiceImpl implements EnterpriseService{



	@Inject
	private EnterpriseDAO dao;

	@Resource(name = "uploadPath")
	private String uploadPath;


	@Override
	public void enterprise_join(EnterpriseVO vo) throws Exception {

		//패스워드 암호화, 상호코드 어떻게 할껀지 결정

		SHA256 sha = new SHA256();
		String pwd = sha.getSHA256(vo.getEnterprise_password());
		String code = sha.getSHA256(vo.getEnterprise_businessName());

		vo.setEnterprise_code(code);
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






}
