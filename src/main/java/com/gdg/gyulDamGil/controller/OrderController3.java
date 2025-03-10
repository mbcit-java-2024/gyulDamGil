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
		
		
//		param.put("consumerId", 1); 
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		try {
			resultMap = orderService.orders(param); 
			resultCnt = (int) resultMap.get("resultCnt");
			if (0 == resultCnt) {	 
				resultMap.put("code", "-1");
				resultMap.put("message", "등록된 자료가 없습니다."); 
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
		
		
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		try {
			resultMap = orderService.orderOKToOne(param); 
			resultCnt = (int) resultMap.get("resultCnt");
			if (0 == resultCnt) {	 
				resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
				resultMap.put("message", "등록된 자료가 없습니다."); 
			}
		} catch(Exception e) {			 
			resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
			resultMap.put("message", e.getMessage());// 에러메세지 
			resultMap.put("resultCnt", resultCnt);// insert된 id의 개수
		} 

		
		return resultMap;
	}
	 

	
	
	
}
