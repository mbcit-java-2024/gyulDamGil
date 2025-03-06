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
	
	@RequestMapping("/farms")
	public String farms() {
		log.info("GdgController의 farms메소드 실행");
		return "/gdg/farms";
	}
	
}
