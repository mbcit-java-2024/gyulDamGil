package com.gdg.gyulDamGil.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gdg.gyulDamGil.service.OrderService;

@RestController
public class OrderController3 {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/addToOrder", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> addToOrder(@RequestBody Map<String, Object> param, HttpServletRequest req) {// throws Exception {
//		System.out.println("OrderController ========1==========addToOrder::::param===" + param);//		System.out.println("OrderController ========1==========addToOrder::::productId===" + orderVo.getProductId());
//		System.out.println("OrderController =========2=========addToOrder::::count===" + orderVo.getCount());
//		System.out.println("OrderController =========3=========addToOrder::::price===" + orderVo.getPrice());
//		System.out.println("OrderController =========3=========addToOrder::::totalPrice===" + orderVo.getTotalPrice());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		
		HttpSession session = req.getSession(false);
		if (session != null && (int) session.getAttribute("userType") == 1) { // 구매자
			int consumerId = (int) session.getAttribute("id"); // 구매자의 아이디
			param.put("consumerId", consumerId);
		}
		
		// 여기서 payment 값 체크해서 값이 없으면 리턴하도록 코딩 추가 ㅇㅋ?? ㅇㅇㅇ   화면에서만 체크해도 되고, 확실하게 하려면 여기에도 추강ㅇ
		if (null == param.get("payment")) {	 
			resultMap.put("code", "-1");
			resultMap.put("message", "결제수단을 선택해주세요."); 
			
			return resultMap;
		}
		
//		param.put("consumerId", 1); 
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지 성공했을때는 메세지가 비어서 내려가.. 
		try {
			Map<String, Object>  resultMap1 = orderService.orders(param); // 찾았다.. 여기서 resultMap 값이 지워진다.. resultMap에 서비스에서 리턴받은 맵을 받고 있잖아..  
			resultCnt = (int) resultMap1.get("resultCnt");
			if (0 == resultCnt) {	 
				resultMap.put("code", "-1");
				resultMap.put("message", "등록된 자료가 없습니다."); 
			} else {		        // 이렇게 다른 변수명으로 리턴받아서 resultMap 으로 옮겨줘야 돼.. 이해됏어?? ㅇㅇ  한버
				resultMap.put("orderIds", resultMap1.get("orderIds")) ;  
				resultMap.put("resultCnt", resultMap1.get("resultCnt")) ; 
			}
		} catch(Exception e) {			 
			resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
			resultMap.put("message", e.getMessage());// 에러메세지 
			resultMap.put("resultCnt", resultCnt);// insert된 id의 개수
		} 

		
		return resultMap;
	}
	
	@RequestMapping(value="/orderOKToOne", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> orderOKToOne(@RequestBody Map<String, Object> param, HttpServletRequest req) {// throws Exception {
		System.out.println("OrderController ========1==========orderOKToOne::::param===" + param);//		System.out.println("OrderController ========1==========addToOrder::::productId===" + orderVo.getProductId());
//		System.out.println("OrderController =========2=========addToOrder::::count===" + orderVo.getCount());
//		System.out.println("OrderController =========3=========addToOrder::::price===" + orderVo.getPrice());
//		System.out.println("OrderController =========3=========addToOrder::::totalPrice===" + orderVo.getTotalPrice());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		
		HttpSession session = req.getSession(false);
		if (session != null && (int) session.getAttribute("userType") == 1) {
			int consumerId = (int) session.getAttribute("id");
			param.put("consumerId", consumerId);
		}
		
		if (null == param.get("payment")) {	 
			resultMap.put("code", "-1");
			resultMap.put("message", "결제수단을 선택해주세요."); 
			
			return resultMap;
		}
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		try {
			Map<String, Object>  resultMap1 = orderService.orderOKToOne(param); 
			resultCnt = (int) resultMap1.get("resultCnt");
			if (0 == resultCnt) {	 // 여기를 탔어.. 
				resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
				resultMap.put("message", "등록된 자료가 없습니다."); 
			} else {		        // 이렇게 다른 변수명으로 리턴받아서 resultMap 으로 옮겨줘야 돼.. 이해됏어?? ㅇㅇ  한버
				resultMap.put("orderIds", resultMap1.get("orderIds")) ;  
				resultMap.put("resultCnt", resultMap1.get("resultCnt")) ; 
			}
		} catch(Exception e) {			 
			resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
			resultMap.put("message", e.getMessage());// 에러메세지 
			resultMap.put("resultCnt", resultCnt);// insert된 id의 개수
		} 

		
		return resultMap;
	}
	 

	
	
	
}
