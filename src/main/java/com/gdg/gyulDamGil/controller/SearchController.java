package com.gdg.gyulDamGil.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.vo.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchController {
	
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping("/search")
	public String search() {
		log.info("GdgController의 search()메소드 실행");
		return "/search/search";
	}
	
	@RequestMapping("/searchOK")
	public String searchOK(String title, HttpSession session, Model model) {
		log.info("GdgController의 searchOK() 메소드 실행 - 검색어: " + title);
		

		// DAO에서 검색 실행
		List<ProductVO> searchResults = dao.searchByTitle(title);

		// 검색 결과를 세션에 저장
		session.setAttribute("searchResults", searchResults);
		
		// 검색 결과를 모델에 추가하여 JSP로 전달
		model.addAttribute("searchResults", searchResults);

		return "/search/searchResult";  // 검색 결과 페이지로 이동
	}
}