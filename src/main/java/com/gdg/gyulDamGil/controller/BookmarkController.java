package com.gdg.gyulDamGil.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.service.BookmarkService;
import com.gdg.gyulDamGil.vo.BookmarkVO;
import com.gdg.gyulDamGil.vo.CartVO;
import com.gdg.gyulDamGil.vo.ProductVO;

@RestController
public class BookmarkController {
	@Autowired
	private BookmarkService bookmarkService;
	@Autowired
	private ProductDAO productDAO;
	@RequestMapping(value="/addToBookmarkProduct", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> addToBookmarkProduct(@RequestBody BookmarkVO bookmarkVO) {// throws Exception {
		System.out.println("BookmarkController ========1==========addToBookmarkProduct::::productId===" + bookmarkVO.getProductId());
//		System.out.println("BookmarkController =========2=========addToBookmarkProduct::::consumerId===" + bookmarkVO.getConsumerId());
//		System.out.println("BookmarkController =========3=========addToBookmarkProduct::::id===" + bookmarkVO.getId());
		System.out.println("BookmarkController =========3=========addToBookmarkProduct::::sellerId===" + bookmarkVO.getSellerId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		

		// TODO 세션에서 추출할것!!
		bookmarkVO.setConsumerId(Integer.parseInt("1"));
		
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		
		try {
			resultCnt = bookmarkService.insertProduct(bookmarkVO); 
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
	@RequestMapping(value="/deleteBookmarkProduct", method=RequestMethod.POST) //, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> deleteBookmarkProduct(@RequestBody BookmarkVO bookmarkVO) {// throws Exception {
		System.out.println("BookmarkController ========1==========deleteBookmarkProduct::::productId===" + bookmarkVO.getProductId());
//		System.out.println("BookmarkController =========2=========addToBookmarkProduct::::consumerId===" + bookmarkVO.getConsumerId());
//		System.out.println("BookmarkController =========3=========addToBookmarkProduct::::id===" + bookmarkVO.getId());
		System.out.println("BookmarkController =========3=========deleteBookmarkProduct::::sellerId===" + bookmarkVO.getSellerId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;		
		
		// TODO 세션에서 추출할것!!
		bookmarkVO.setConsumerId(Integer.parseInt("1"));
		
		resultMap.put("code", "0");// 성공여부 0:성공, 그외:실패 
		resultMap.put("message", "");// 에러메세지
		
		try {
			resultCnt = bookmarkService.deleteProduct(bookmarkVO); 
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

}
