package com.gdg.gyulDamGil.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.gdg.gyulDamGil.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReviewDAO {
	
	private static final String ReviewMapper  = "com.gdg.gyulDamGil.dao.ReviewDAO";
	
	@Autowired
	private SqlSession session;


	public void insert(ReviewVO reviewVO) {
		log.info("ReviewDAO 클래스의 insert() 매소드 실행");
		 session.insert(ReviewMapper + ".insert", reviewVO);
	}

	public List<ReviewVO> selectList() {
        log.info("ReviewDAO 클래스의 selectList() 매소드 실행");
        return session.selectList(ReviewMapper +  ".selectList");
    }

	public ReviewVO selectReviewByIdx(int id) {
        log.info("ReviewDAO 클래스의 selectReviewByIdx() 매소드 실행, id: {}", id);
        return session.selectOne(ReviewMapper +  ".selectReviewByIdx", id);
    }
	
	public List<ReviewVO> selectReviewByProductId(int productId) {
		return session.selectList(ReviewMapper +  ".selectReviewByProductId", productId);
		
		
	}

	public void update(ReviewVO reviewVO) {
        log.info("ReviewDAO 클래스의 update() 매소드 실행");
        session.update(ReviewMapper +  ".update", reviewVO);
    }

	public void delete(int id) {
        log.info("ReviewDAO 클래스의 delete() 매소드 실행, idx: {}", id);
        session.delete(ReviewMapper + ".delete", id);
    }

	public List<ReviewVO> selectReviewBySellerId(int sellerId) {
		log.info("ReviewDAO 클래스의 selectReviewBySellerId() 매소드 실행");
		return session.selectList(ReviewMapper +  ".selectReviewBySellerId", sellerId);
	}

	public float selectAverageRatingBySellerId(int sellerId) {
		log.info("ReviewDAO 클래스의 selectAverageRatingBySellerId() 메소드 실행, sellerId: {}", sellerId);
	    return session.selectOne(ReviewMapper + ".selectAverageRatingBySellerId", sellerId);
	}


}
