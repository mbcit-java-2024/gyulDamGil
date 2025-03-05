package com.gdg.gyulDamGil.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gdg.gyulDamGil.vo.OrderVO;

@Mapper
public interface OrderDAO {

//	재성
	List<OrderVO> selectOrderListForS(HashMap<String, Integer> hmap); // seller별 모든 주문 조회
	List<OrderVO> selectOrderListForC(HashMap<String, Integer> hmap); // consumer별 모든 주문 조회
	OrderVO selectOrderById(int id); // 특정 주문 조회
	void updateOrderStatus(HashMap<String, Object> map); // 주문 상태 변경
	int selectCountForS(int id); // seller별 order 데이터 전체 개수 조회
	int selectCountForC(int id); // consumer별 order 데이터 전체 개수 조회
	
//	수빈
	public int insertOrder(Map<String, Object> param);
	public List<OrderVO> selectOrderList(String orderIds); // 장바구니 선택 orderList -> 결제 페이지로 이동시키는 메소드
//	List<OrderVO> selectOrderList(@Param("orderIds") List<Integer> orderIds);

	public int insertDetailOneToOrder(Map<String, Object> param);
}
