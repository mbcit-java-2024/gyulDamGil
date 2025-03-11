package com.gdg.gyulDamGil.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdg.gyulDamGil.vo.SellerVO;

@Mapper
public interface SellerDAO {

//	재성
	List<SellerVO> selectAllSellers(); // 모든 판매자 조회
	SellerVO selectSellerById(int id); // 특정 판매자 정보 조회
	int getReviewCount(int id); // 특정 판매자의 review 개수 조회
	String selectFarmName(int id); // 특정 판매자의 farmName 한 건 조회

//	수빈
	SellerVO selectFarmDetail(int sellerId);
	
//	예린
	SellerVO selectById(int id);
	SellerVO selectByUserId(String userId);
	int selectCountByUserId(String userId);
	List<String> getUserIds();
	List<String> getFarmNames();
	void insert(SellerVO vo);
	void update(SellerVO vo);
	void delete(int id);
	
}
