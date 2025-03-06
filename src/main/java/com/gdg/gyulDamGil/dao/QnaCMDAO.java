package com.gdg.gyulDamGil.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdg.gyulDamGil.vo.QnaCMVO;
import com.gdg.gyulDamGil.vo.QnaCMRepliesVO;
import com.gdg.gyulDamGil.vo.QnaCMVO;
import com.gdg.gyulDamGil.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class QnaCMDAO {
	
	private static final String QnaMapper  = "com.gdg.gyulDamGil.dao.QnaCMDAO";

	@Autowired
	private SqlSession session;
	
	public List<QnaCMVO> selectList() {
        log.info("ReviewDAO 클래스의 selectList() 매소드 실행");
        return session.selectList(QnaMapper +  ".selectList");
    }
	
	public List<QnaCMVO> selectQnaBysellerId(int sellerId) {
		log.info("ReviewDAO 클래스의 seletQnaBysellerId() 매소드 실행");
		
		return session.selectList(QnaMapper + ".selectQnaBysellerId",sellerId);
	}
		
	public void insert(QnaCMVO qnaCMVO) {
		log.info("ReviewDAO 클래스의 insert() 매소드 실행");
		session.update(QnaMapper + ".insert", qnaCMVO);
	}

	public QnaCMVO selectQnaByIdx(int id) {
		 log.info("QnaCMDAO의 selectQnaByIdx() 메소드 실행");
	     return session.selectOne(QnaMapper + ".selectQnaByIdx", id);
	}

	public void insertReply(QnaCMRepliesVO qnaCMRepliesVO) {
		log.info("QnaCMDAO의 insertReply() 메소드 실행");
        session.insert(QnaMapper + ".insertReply", qnaCMRepliesVO);
		
	}

	public List<QnaCMRepliesVO> selectRepliesByQnaIdx(int id) {
		log.info("QnaCMDAO의 selectRepliesByQnaIdx() 메소드 실행");
        return session.selectList(QnaMapper + ".selectRepliesByQnaIdx", id);
	}
		
	
	
}
