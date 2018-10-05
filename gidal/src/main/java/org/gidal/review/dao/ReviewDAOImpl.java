package org.gidal.review.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.review.domain.ReviewVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	
	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.gidal.mapper.ReviewMapper";
	
	@Override
	public int userReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace + ".userReview", vo);
	}

	

}
