package com.gdg.gyulDamGil.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdg.gyulDamGil.dao.QnaCSDAO;
import com.gdg.gyulDamGil.vo.QnaCSRepliesVO;
import com.gdg.gyulDamGil.vo.QnaCSVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class QnaCSController {

	@Autowired
	private QnaCSDAO dao;
	
	
	
	@RequestMapping("/qna")
	public String login( HttpServletRequest request) {
	    log.info("LoginController 컨트롤러의 login() 메소드 실행");

	    HttpSession session = request.getSession(false);
	    String viewpage = "";

	    if (session != null && session.getAttribute("userType") != null) {
	        int userType = (int) session.getAttribute("userType");
	   
	        if (userType == 1) {
	            viewpage = "/QnaCM/faqC";
	            
	        } else if (userType == 2) {
	            viewpage = "/QnaSM/faqS";
	        }
	        
	    } else {
	    	
	        viewpage = "/consumer/login_2"; 
	    }

	    return viewpage;
	}

	@RequestMapping("/QnaCSList1")
	public String selectQnaBysellerId(@RequestParam("sellerId") int sellerId, Model model) {
		List<QnaCSVO> qnaList = dao.selectQnaBysellerId(sellerId);
		log.info("HomeController 클래스의 seletQnaBysellerId() 메소드 실행");
		
		
		model.addAttribute("qnaList", qnaList);
        log.info("qnaList: {}", qnaList);

		return "/QnaCS/QnaCSList";
	}
	@RequestMapping("/QnaCSList2")
	public String selectQnaByconsumerId(@RequestParam("consumerId") int consumerId, Model model) {
		List<QnaCSVO> qnaList = dao.selectQnaByconsumerId(consumerId);
		log.info("HomeController 클래스의 selectQnaByconsumerId() 메소드 실행");
		
		
		model.addAttribute("qnaList", qnaList);
		log.info("qnaList: {}", qnaList);
		
		return "/QnaCS/QnaCSList";
	}
	
	@RequestMapping("/QnaCSInsert")
	public String QnaInsert() {
		log.info("HomeController 클래스의 QnaInsert() 메소드 실행");
		
		return "/QnaCS/QnaCSInsert";
	}
	
	
	@RequestMapping("/QnaCSInsertOK")
	public String QnaInsertOK(QnaCSVO qnaCSVO,Model model, RedirectAttributes redirectAttributes) {
		log.info("HomeController 클래스의 QnaInsertOK() 메소드 실행");
		dao.insert(qnaCSVO);
		
		redirectAttributes.addFlashAttribute("message", "문의가 등록되었습니다.");

		return "redirect:/QnaCSList1?sellerId="+ qnaCSVO.getSellerId();
	}
	
    @RequestMapping("/QnaCSDetail")
    public String selectQnaByIdx(@RequestParam("id") int id, Model model) {
        QnaCSVO qnaCSVO = dao.selectQnaByIdx(id);

        List<QnaCSRepliesVO> replies = dao.selectRepliesByQnaIdx(id);

        log.info("QnaCSController의 selectQnaByIdx() 메소드 실행");

        model.addAttribute("qnaCSVO", qnaCSVO);
        model.addAttribute("replies", replies);

        return "/QnaCS/QnaCSDetail"; 
    }


    @RequestMapping("/QnaCSReplyInsert")
    public String QnaReplyInsert(QnaCSRepliesVO qnaCSRepliesVO, RedirectAttributes redirectAttributes) {
    	
        log.info("QnaCSController의 QnaReplyInsert() 메소드 실행");
        dao.insertReply(qnaCSRepliesVO);

        redirectAttributes.addAttribute("id", qnaCSRepliesVO.getParentId());
        return "redirect:/QnaCSDetail"; 
    }
	
	

}























