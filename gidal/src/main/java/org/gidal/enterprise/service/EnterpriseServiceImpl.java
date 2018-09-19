package org.gidal.enterprise.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.inject.Inject;
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


		int cnt = 0;
/*
		String [] arr = {"월","화","수","목","금","토","일"};
		String [] close = new String[7];

		for (int i = 0; i < arr.length; i++) {

			if(vo.getEnterprise_closed().charAt(i) == '1') {

				close[i] = arr[i];

				System.out.print(close[i]);
			}else {
				close[i] = ",";
			}
		}*/

	//	vo.setEnterprise_closed(Arrays.toString(close).replaceAll(",", " "));


		//vo.setEnterprise_closed(Arrays.toString(close));
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
