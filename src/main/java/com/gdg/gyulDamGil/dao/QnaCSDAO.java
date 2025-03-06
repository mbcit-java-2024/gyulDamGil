package com.gdg.gyulDamGil.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdg.gyulDamGil.vo.QnaCSRepliesVO;
import com.gdg.gyulDamGil.vo.QnaCSVO;
import com.gdg.gyulDamGil.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class QnaCSDAO {
	
	private static final String QnaMapper  = "com.gdg.gyulDamGil.dao.QnaCSDAO";

	@Autowired
	private SqlSession session;
	
	public List<QnaCSVO> selectList() {
        log.info("ReviewDAO 클래스의 selectList() 매소드 실행");
        return session.selectList(QnaMapper +  ".selectList");
    }
	
	public List<QnaCSVO> selectQnaBysellerId(int sellerId) {
		log.info("ReviewDAO 클래스의 seletQnaBysellerId() 매소드 실행");
		
		return session.selectList(QnaMapper + ".selectQnaBysellerId",sellerId);
	}
		
	public void insert(QnaCSVO qnaCSVO) {
		log.info("ReviewDAO 클래스의 insert() 매소드 실행");
		session.update(QnaMapper + ".insert", qnaCSVO);
	}

	public QnaCSVO selectQnaByIdx(int id) {
		 log.info("QnaCSDAO의 selectQnaByIdx() 메소드 실행");
	     return session.selectOne(QnaMapper + ".selectQnaByIdx", id);
	}

	public void insertReply(QnaCSRepliesVO qnaCSRepliesVO) {
		log.info("QnaCSDAO의 insertReply() 메소드 실행");
        session.insert(QnaMapper + ".insertReply", qnaCSRepliesVO);
		
	}

	public List<QnaCSRepliesVO> selectRepliesByQnaIdx(int id) {
		log.info("QnaCSDAO의 selectRepliesByQnaIdx() 메소드 실행");
        return session.selectList(QnaMapper + ".selectRepliesByQnaIdx", id);
	}

	public List<QnaCSVO> selectQnaByconsumerId(int consumerId) {
		log.info("ReviewDAO 클래스의 selectQnaByconsumerId() 매소드 실행");

		return session.selectList(QnaMapper + ".selectQnaByconsumerId",consumerId);
	}
		
	
	
}


