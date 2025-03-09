package com.gdg.gyulDamGil.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdg.gyulDamGil.dao.ReviewDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GdgController {
	
	@Autowired
	SellerDAO sellerDAO;
	
	
	@RequestMapping("/")
	public String home() {
		log.info("GdgController의 home메소드 실행");
		return "/gdg/gdg";
	}
	
	@RequestMapping("/info")
	public String info() {
		log.info("GdgController의 info메소드 실행");
		return "/gdg/info";
	}
	
	@RequestMapping("/farms")
	public String farms(Model model) {
		log.info("GdgController의 farms메소드 실행");
		List<SellerVO> farmList = sellerDAO.selectAllSellers();
		for (int i = 0; i < farmList.size(); i++) {
			farmList.get(i).setReviewCount(sellerDAO.getReviewCount(i));
		}
		model.addAttribute("farmList", farmList);
		
		return "/gdg/farms";
	}
	
}
