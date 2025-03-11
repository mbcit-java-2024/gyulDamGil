package com.gdg.gyulDamGil.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdg.gyulDamGil.dao.CartDAO;
import com.gdg.gyulDamGil.dao.OrderDAO;
import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.vo.OrderVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private CartDAO cartDAO;
		
	@Autowired
	private ProductDAO productDAO;

	@Transactional
	public Map<String, Object> orders(Map<String, Object> param) {
			System.out.println("OrderService클래스의 orders메소드 실행");
			
			param.put("id", param.get("cartIds")); 
			System.out.println("param: " + param); // id=2,3 id=4
			
			String cartIds = (String) param.get("cartIds");
			System.out.println("cartIds: " + cartIds); // cartIds: 3, 4
			
			String[] arr = cartIds.split(",");
			System.out.println("arr: " + arr); // cartIds: 3, 4
			
//			List<Map<String, Integer>> paramList = new ArrayList<>();

			
			
			int cnt1 = 0;
			int resultCnt = 0;
//			ProductVO updateProduct = new ProductVO();
			String orderIds = "";
			Map<String, Object> resultMap1 = new HashMap<String, Object>();
			Map<String, Object> updateProduct = new HashMap<String, Object>();
	        for (String id : arr) {
	        	param.put("id", Integer.parseInt(id.trim())); 
//	        	System.out.println("cartId: " + param.get("id") ); // 카트아이디 // 3     // 4
	        	cnt1 = orderDAO.insertOrder(param); // 카트 1건 읽어서 오더에 인서트, 오더아이디 리턴받음
	        	if (cnt1 != 1) { // 정상 작동 x
//	        		cnt1 = orderDAO.insertOrder(param); // 카트 1건 읽어서 오더에 인서트, 오더아이디 리턴받음
	        		continue;
	        	} else { // 정상 작동 시 실행해야하는 실행문들
	        		resultCnt++;
	        		System.out.println("orderIds" + param.get("orderId")); // orderId : 디비에서 가지고 온 값
	        		if (orderIds.equals("")) {
	        			orderIds = orderIds + param.get("orderId");
	        			System.out.println("orderIds" + param.get("orderId"));
	        			System.out.println("orderIds" + param.get("orderIds"));
	        		}
	        		else {
	        			orderIds = orderIds + ',' + param.get("orderId");
	        		} 
	        		cartDAO.deleteCartItems(param);
	        		
	        	}
//	        	System.out.println("orderId: " + param.get("orderId")); 
	        } // 
	        
	        
	    	resultMap1.put("orderIds", orderIds) ; 
	    	resultMap1.put("resultCnt", resultCnt) ; 
	    	
			return resultMap1; 
		}//

	
	public List<OrderVO> selectOrderList(String orderIds) {
		return orderDAO.selectOrderList(orderIds);
	}

//	public int insertDetailToOrder(OrderVO orderVO) {
//		return orderDAO.insertDetailToOrder(orderVO);
//	}

	public Map<String, Object> orderOKToOne(Map<String, Object> param) {
		param.put("orderIds", param.get("productId")); 
		System.out.println("orderIds: " + param.get("orderIds")); // id=2,3 id=4
		Object orderIds = param.get("orderIds");
		System.out.println("orderIds:" + orderIds); // cartIds: 3, 4
		
		
		int cnt1 = 0;
		int resultCnt = 0;
		Map<String, Object> resultMap1 = new HashMap<String, Object>();
		Map<String, Object> updateProduct = new HashMap<String, Object>();
		
		
		try {
			cnt1 = orderDAO.insertDetailOneToOrder(param); // 카트 1건 읽어서 오더에 인서트, 오더아이디 리턴받음
			orderIds = param.get("orderId");
//			productDAO.updateOneProduct(param); // 재성: 주석처리 stock 을 두번 처리함
		} catch (Exception e) {
		}
        
		resultMap1.put("orderIds", orderIds) ; 
    	resultMap1.put("resultCnt", resultCnt) ; 
    	
		return resultMap1;  
	}

	
	
	
}
