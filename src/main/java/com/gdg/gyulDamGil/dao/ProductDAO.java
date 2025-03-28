package com.gdg.gyulDamGil.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gdg.gyulDamGil.vo.CartVO;
import com.gdg.gyulDamGil.vo.ProductVO;


@Mapper
public interface ProductDAO {

//	재성
	ProductVO selectById(int id);
	void minusStock(HashMap<String, Integer> map);
	int selectStockById(int id);
	void updateForSoldOut(int id);
	String selectTitleById(int id);
	String selectImageById(int id);

//	수빈
	List<ProductVO> selectJejuGamgyulList(int categoryId);
	ProductVO selectGamgyulDetail(Map<String, Object> param);
//	List<ProductVO> selectgyulexperienceList(); // 체험예약 관련코드 - 우선 주석처리
	List<ProductVO> selectImg(ProductVO productVO);
//	void updateProduct(Map<String, Object> param); // 재성: 주석처리 stock 을 두번 처리함
//	void updateOneProduct(Map<String, Object> param); // 재성: 주석처리 stock 을 두번 처리함
	
//	예린
	int selectCount();
	int selectCountBySellerId(int sellerId);
	List<ProductVO> selectList();
	List<ProductVO> selectListBySellerId(int sellerId);
	List<ProductVO> selectListByCategoryId(HashMap<String, Integer> hmap);
	List<ProductVO> selectPageListBySellerId(HashMap<String, Integer> hmap);
	Object selectCountByStatus(@Param("sellerId") int sellerId, @Param("status") int i);
	void insert(ProductVO productVO);
	void update(ProductVO productVO);
	void delete(int id);
	int selectCountByCategoryId(int cid);
	
// 용훈
	List<ProductVO> searchByTitle(String title);
	
	
}
