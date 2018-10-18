package org.gidal.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Select;
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

	@Override
	public List<ReviewVO> ent_review(Integer code) {
		return sqlsession.selectList(namespace + ".ent_review", code);
	}



}
