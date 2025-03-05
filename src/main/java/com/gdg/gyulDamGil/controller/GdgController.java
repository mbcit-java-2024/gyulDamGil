package com.gdg.gyulDamGil.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GdgController {
	
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
	
	@RequestMapping("/myPage")
	public String myPage() {
		log.info("GdgController의 myPage메소드 실행");
		
//		여기서 session.getUserType을 받아서 consumer, seller 구분해야함
		
		/*
//		session으로 받는 값이 String이였는지 기억이 안나요...

		int userType = request.getSession().getAttribute("userType");
		if (userType == 1) {
			return "/consumer/mypage";
		} else if (userType == 2) {
			return "/seller/mypage";
		}
		*/
		
		return "/gdg/needLogin";
	}
	
}
