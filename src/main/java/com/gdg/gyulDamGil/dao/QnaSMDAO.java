package com.gdg.gyulDamGil.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdg.gyulDamGil.vo.QnaSMVO;
import com.gdg.gyulDamGil.vo.QnaSMRepliesVO;
import com.gdg.gyulDamGil.vo.QnaSMVO;
import com.gdg.gyulDamGil.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class QnaSMDAO {
	
	private static final String QnaMapper  = "com.gdg.gyulDamGil.dao.QnaSMDAO";

	@Autowired
	private SqlSession session;
	
	public List<QnaSMVO> selectList() {
        log.info("ReviewDAO 클래스의 selectList() 매소드 실행");
        return session.selectList(QnaMapper +  ".selectList");
    }
	
	public List<QnaSMVO> selectQnaBysellerId(int sellerId) {
		log.info("ReviewDAO 클래스의 seletQnaBysellerId() 매소드 실행");
		
		return session.selectList(QnaMapper + ".selectQnaBysellerId",sellerId);
	}
		
	public void insert(QnaSMVO qnaSMVO) {
		log.info("ReviewDAO 클래스의 insert() 매소드 실행");
		session.update(QnaMapper + ".insert", qnaSMVO);
	}

	public QnaSMVO selectQnaByIdx(int id) {
		 log.info("QnaSMDAO의 selectQnaByIdx() 메소드 실행");
	     return session.selectOne(QnaMapper + ".selectQnaByIdx", id);
	}

	public void insertReply(QnaSMRepliesVO qnaSMRepliesVO) {
		log.info("QnaSMDAO의 insertReply() 메소드 실행");
        session.insert(QnaMapper + ".insertReply", qnaSMRepliesVO);
		
	}

	public List<QnaSMRepliesVO> selectRepliesByQnaIdx(int id) {
		log.info("QnaSMDAO의 selectRepliesByQnaIdx() 메소드 실행");
        return session.selectList(QnaMapper + ".selectRepliesByQnaIdx", id);
	}
		
	
	
}
