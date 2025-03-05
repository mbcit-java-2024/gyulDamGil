package com.gdg.gyulDamGil.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {

	@Autowired
	private SellerDAO sellerDAO;
	
	// seller 목록 불러오기
	@RequestMapping("/seller/sellerList")
	public String sellerList(Model model) {
		log.info("SellerController 클래스의 sellerList() 메소드 실행");
		List<SellerVO> sellerList = sellerDAO.selectAllSellers();
		model.addAttribute("sellerList", sellerList);
		return "seller/sellerList5";
	}
	
	// seller 1건 불러오기
	@RequestMapping("/seller")
	public String oneSeller(@RequestParam("id") int id, Model model) {
		log.info("SellerController 클래스의 oneSeller() 메소드 실행");
		SellerVO seller = sellerDAO.selectSellerById(id);
		model.addAttribute("seller", seller);
		return "seller/seller5";
	}
	
	
}
