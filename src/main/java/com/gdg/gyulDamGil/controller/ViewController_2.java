package com.gdg.gyulDamGil.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.vo.ProductList;
import com.gdg.gyulDamGil.vo.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ViewController_2 {

	@Autowired
	private ProductDAO dao;
	
//	카테고리별 판매상품 목록보기 : categoryView
//	list_2 에서 선택된(input) categoryId 를 인수로 받아 선택된 categoryId에 해당하는 product 정보를 DB의 product 
//	테이블에서 검색해서 List<ProductVO>로 받아 페이징 작업을 위해 PageList 객체를 생성하고 해당 객체를 
//	categoryView 페이지로 넘겨준다.
	@RequestMapping("/categoryView/{cid}/{cp}")
//	cid: categoryId, cp: currentPage
	public String consumerList(@PathVariable int cid, @PathVariable int cp, Model model) {
		log.info("ViewController 컨트롤러의 consumerList() 메소드 실행");
		log.info("cid: "+cid+", cp: "+cp);
		
		ProductList pageListVO = new ProductList(10, (int) dao.selectCountByCategoryId(cid), cp);
		log.info("productList: " + pageListVO);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", pageListVO.getStartNo());
		hmap.put("pageSize", pageListVO.getPageSize());
		hmap.put("categoryId", cid);
		
		ArrayList<ProductVO> productListForOnePage = (ArrayList<ProductVO>) dao.selectListByCategoryId(hmap);
		log.info("productListForOnePage: "+ productListForOnePage);
		pageListVO.setProductListForOnePage(productListForOnePage);
		model.addAttribute("productList", pageListVO);
		model.addAttribute("categoryId", cid);
		
		return "/product/categoryView_2";
	}
	
//	카테고리별 목록에서 판매 상품 1건 보기 : view
	@RequestMapping("/view/{pid}/{cp}")
//	pid: productId, cp: currentPage
	public String view(@PathVariable int pid, @PathVariable int cp, Model model) {
		log.info("ViewController 컨트롤러의 view() 메소드 실행");
		
		ProductVO vo = dao.selectById(pid);
		
//		이미지 경로 변환
		File file = new File(dao.selectById(pid).getMainImageUrl());
		String fileName = file.getName(); // 파일명만 추출
		String relativePath = "/upload/" + fileName;
		log.info("이미지 상대 경로: "+ relativePath);
		
	
		
		model.addAttribute("mainImageUrl", relativePath);
		model.addAttribute("productVO", vo);
		model.addAttribute("cp", cp);
		model.addAttribute("cid", vo.getCategoryId());
		
		return "/product/view_2";
	}
}
