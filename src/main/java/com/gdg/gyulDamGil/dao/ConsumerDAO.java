package com.gdg.gyulDamGil.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdg.gyulDamGil.vo.ConsumerVO;

@Mapper
public interface ConsumerDAO {

	ConsumerVO selectConsumerById(int id);
	ConsumerVO selectById(int id);
	ConsumerVO selectByUserId(String userId);
	int selectCountByUserId(String userId);
	List<String> getUserIds();
	void insert(ConsumerVO vo);
	void update(ConsumerVO vo);
	void delete(int id);
	String selectUserIdById(int id); // id로 name 한 건 꺼내오는 메소드
	
	
}
