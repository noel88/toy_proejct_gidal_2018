package org.gidal.enterprise.service;

import javax.inject.Inject;

import org.gidal.enterprise.dao.EnterpriseBoardDAO;
import org.gidal.enterprise.dao.EnterpriseDAO;
import org.springframework.stereotype.Service;

@Service
public class EnterpriseServiceImpl implements EnterpriseService{



	@Inject
	private EnterpriseDAO dao;




}
