package com.gdg.gyulDamGil.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gdg.gyulDamGil.service.CartService;
import com.gdg.gyulDamGil.vo.CartVO;


@RestController
public class CartController {

	@Autowired
	private CartService cartService;


	
	// 장바구니 담기
//	@RequestMapping("/addToCart")
	@RequestMapping(value="/addToCart", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
//	 @PostMapping("/addToCart")// Map<String, String> paramMap
	public Map<String, Object> addToCart(@RequestBody CartVO cartVo, HttpServletRequest req) {// throws Exception {
//		Map<String, Object> @RequestBody Map<String, String> paramMap
		System.out.println("CartController ========1==========addToCart::::productId===" + cartVo.getProductId());
		System.out.println("CartController =========2=========addToCart::::count===" + cartVo.getCount());
		System.out.println("CartController =========3=========addToCart::::price===" + cartVo.getPrice());
		System.out.println("CartController =========3=========addToCart::::totalPrice===" + cartVo.getTotalPrice());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		

		// TODO 세션에서 추출할것!!
		HttpSession session = req.getSession(false);
		if (null != session   && null != session.getAttribute("id")) {
			int consumerId = (int) session.getAttribute("id");
			cartVo.setConsumerId(consumerId);
			resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
			resultMap.put("message", "");// 에러메세지
			
			try {
				resultCnt = cartService.insert(cartVo); 
				resultMap.put("resultCnt", resultCnt); 	
				if (0 == resultCnt) {			
					resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
					resultMap.put("message", "등록된 자료가 없습니다.");// 에러메세지
				}
			} catch(Exception e) {			 
				resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
				resultMap.put("message", e.getMessage());// 에러메세지 
				resultMap.put("resultCnt", resultCnt);
			}
		}  else { 
			resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패
			resultMap.put("message", "로그인하십시오.");// 에러메세지
//			resultMap.put("resultCnt", resultCnt);
			
		}
		
		

		return resultMap;
	}
	

	
	
	@RequestMapping(value="/updateCart", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
//	 @PostMapping("/addToCart")// Map<String, String> paramMap
	public Map<String, Object> updateCart(@RequestBody CartVO cartVo, HttpServletRequest req) {// throws Exception {
//		Map<String, Object> @RequestBody Map<String, String> paramMap
		System.out.println("CartController ========1==========updateCart::::productId===" + cartVo.getProductId());
		System.out.println("CartController =========2=========updateCart::::count===" + cartVo.getCount());
		System.out.println("CartController =========3=========updateCart::::price===" + cartVo.getPrice());
		System.out.println("CartController =========3=========updateCart::::totalPrice===" + cartVo.getTotalPrice());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		

		
		HttpSession session = req.getSession(false);
		if (session != null && (int) session.getAttribute("userType") == 1) {
			int consumerId = (int) session.getAttribute("id");
			cartVo.setConsumerId(consumerId);
		}
		
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		
		try {
			resultCnt = cartService.updateCart(cartVo); 
			resultMap.put("resultCnt", resultCnt); 	
			if (0 == resultCnt) {			
				resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
				resultMap.put("message", "등록된 자료가 없습니다.");// 에러메세지
			}
		} catch(Exception e) {			 
			resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
			resultMap.put("message", e.getMessage());// 에러메세지 
			resultMap.put("resultCnt", resultCnt);
		}
		return resultMap;
	}
	@RequestMapping(value="/deleteCartSelectedOne", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
//	 @PostMapping("/addToCart")// Map<String, String> paramMap
	public Map<String, Object> deleteCartSelectedOne(@RequestBody CartVO cartVo, HttpServletRequest req) {// throws Exception {
//		Map<String, Object> @RequestBody Map<String, String> paramMap
		System.out.println("CartController ========1==========deleteCartSelectedOne::::productId===" + cartVo.getProductId());
		System.out.println("CartController =========2=========deleteCartSelectedOne::::count===" + cartVo.getCount());
		System.out.println("CartController =========3=========deleteCartSelectedOne::::price===" + cartVo.getPrice());
		System.out.println("CartController =========3=========deleteCartSelectedOne::::totalPrice===" + cartVo.getTotalPrice());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		
		
		
		HttpSession session = req.getSession(false);
		if (session != null && (int) session.getAttribute("userType") == 1) {
			int consumerId = (int) session.getAttribute("id");
			cartVo.setConsumerId(consumerId);
		}
		
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		
		try {
			resultCnt = cartService.deleteCartSelectedOne(cartVo); 
			resultMap.put("resultCnt", resultCnt); 	
			if (0 == resultCnt) {			
				resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
				resultMap.put("message", "등록된 자료가 없습니다.");// 에러메세지
			}
		} catch(Exception e) {			 
			resultMap.put("code", "-1");// 성공여부 0:성공, 그외:실패 
			resultMap.put("message", e.getMessage());// 에러메세지 
			resultMap.put("resultCnt", resultCnt);
		}

		return resultMap;
	}
	

	@RequestMapping(value="/selectCartCount", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public int selectCartCount(Model model, HttpServletRequest req) {
		System.out.println("CartController클래스의 selectCartCount메소드 실행");
		// 장바구니 건수 조회 쿼리 
		int cnt = 0; // 로그인안했을땐 0
		
		HttpSession session = req.getSession(false);
		if (null != session   && null != session.getAttribute("id")) {
			int consumerId = (int) session.getAttribute("id");
			cnt = cartService.selectCartCount(consumerId); 
			System.out.println("CartController클래스의 selectCartCount메소드 실행::::1::::cnt="+cnt);
		}
		System.out.println("CartController클래스의 selectCartCount메소드 실행::::2::::cnt="+cnt);
		
		return cnt;
	}

	
	
	
}
