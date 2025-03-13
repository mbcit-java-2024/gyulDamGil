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

import com.gdg.gyulDamGil.dao.ConsumerDAO;
import com.gdg.gyulDamGil.dao.QnaCSDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.vo.ConsumerVO;
import com.gdg.gyulDamGil.vo.QnaCMVO;
import com.gdg.gyulDamGil.vo.QnaCSRepliesVO;
import com.gdg.gyulDamGil.vo.QnaCSVO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class QnaCSController {

	@Autowired
	private QnaCSDAO dao;
	
	@Autowired
	private ConsumerDAO consumerdao;
	
	@Autowired
	private SellerDAO sellerdao;
	
	
	@RequestMapping("/faq")
	public String login(HttpServletRequest request, Model model) {
	    log.info("LoginController 컨트롤러의 login() 메소드 실행");
	    
	    model.addAttribute("faq", "faq");
	    
	    return "/gdg/faq";
	}
	
	/* 용훈이의 편한 코딩을 위한 주석 남겨놓기
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
	*/
	
	@RequestMapping("/QnaCSListc")
	public String selectQnaListc(Model model, HttpServletRequest request) {
    	int consumerId = (int) request.getSession().getAttribute("id");
    	ConsumerVO consumer = consumerdao.selectConsumerById(consumerId);
    	String consumerUserId = consumer.getUserId();
    	
        List<QnaCSVO> qnaList = dao.selectQnaByconsumerId(consumerId);
        
        model.addAttribute("consumerUserId", consumerUserId);
        model.addAttribute("consumerId",consumerId);
        model.addAttribute("qnaList", qnaList);
        log.info("qnaList: {}", qnaList);
        
        return "/QnaCS/QnaCSList";
	}
	
	@RequestMapping("/QnaCSLists")
	public String selectQnaLists(Model model, HttpServletRequest request) {
		int sellerId = (int) request.getSession().getAttribute("id");
		int consumerId = (int) request.getSession().getAttribute("id");
		
		SellerVO seller = sellerdao.selectSellerById(sellerId);
		ConsumerVO consumer = consumerdao.selectConsumerById(consumerId);
		
		String consumerUserId = consumer.getUserId();
		String sellerUserId = seller.getFarmName();
		
		List<QnaCSVO> qnaList = dao.selectQnaBysellerId(sellerId);
		
		
		log.info("QnaCMController - selectQnaLists() 실행");
		
		model.addAttribute("consumerUserId", consumerUserId);
		model.addAttribute("consumerId",consumerId);
		model.addAttribute("sellerUserId",sellerUserId);
		model.addAttribute("sellerId",sellerId);
		model.addAttribute("qnaList", qnaList);
		log.info("qnaList: {}", qnaList);
		
		return "/QnaCS/QnaCSList";
	}
	
/* 아래 두 요청을 QnaCSList 한 요청으로 통합
	@RequestMapping("/QnaCSList1")
	public String selectQnaByconsumerId(@RequestParam("consumerId") int consumerId, Model model) {
		List<QnaCSVO> qnaList = dao.selectQnaByconsumerId(consumerId);
		log.info("HomeController 클래스의 selectQnaByconsumerId() 메소드 실행");
		
		
		model.addAttribute("qnaList", qnaList);
		log.info("qnaList: {}", qnaList);
		
		return "/QnaCS/QnaCSList";
	}
	
	@RequestMapping("/QnaCSList2")
	public String selectQnaBysellerId(@RequestParam("sellerId") int sellerId, Model model) {
		log.info("HomeController 클래스의 seletQnaBysellerId() 메소드 실행");
		
		
		model.addAttribute("qnaList", qnaList);
        log.info("qnaList: {}", qnaList);

		return "/QnaCS/QnaCSList";
	}
*/
	
	@RequestMapping("/QnaCSInsert")
	public String QnaInsert(@RequestParam("farmId") int farmId, Model model, HttpServletRequest request) {
	    int consumerId = (int) request.getSession().getAttribute("id");
	    ConsumerVO consumer = consumerdao.selectConsumerById(consumerId);
	    
	    // farmId를 기반으로 Seller 정보 가져오기
	    SellerVO seller = sellerdao.selectSellerById(farmId);
	    String farmName =  seller.getFarmName();

	    String consumerUserId = consumer.getUserId();
	    log.info("HomeController - QnaInsert() 실행");

	    model.addAttribute("consumerUserId", consumerUserId);
	    model.addAttribute("consumerId", consumerId);
	    model.addAttribute("farmId", farmId);
	    model.addAttribute("farmName", farmName); // farmName 추가

	    return "/QnaCS/QnaCSInsert";
	}	
	
	@RequestMapping("/QnaCSInsertOK")
	public String QnaInsertOK(QnaCSVO qnaCSVO,Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		int consumerId = (int) request.getSession().getAttribute("id");
		log.info("HomeController 클래스의 QnaInsertOK() 메소드 실행");
		dao.insert(qnaCSVO);
		qnaCSVO.setConsumerId(consumerId);
		
		model.addAttribute("consumerId", consumerId);
		redirectAttributes.addFlashAttribute("message", "문의가 등록되었습니다.");

		return "redirect:/QnaCSListc";
	}
	
    @RequestMapping("/QnaCSDetail")
    public String selectQnaByIdx(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		int sellerId = (int) request.getSession().getAttribute("id");
		
		SellerVO seller = sellerdao.selectSellerById(sellerId);
		
		QnaCSVO qnaCSVO = dao.selectQnaByIdx(id);
		
		ConsumerVO consumerVO = consumerdao.selectConsumerById(qnaCSVO.getConsumerId());
		SellerVO sellerVO = sellerdao.selectSellerById(qnaCSVO.getSellerId());
		
		String consumerUserId = consumerVO.getName();
		String sellerUserId = sellerVO.getFarmName();
        

        List<QnaCSRepliesVO> replies = dao.selectRepliesByQnaIdx(id);

        log.info("QnaCSController의 selectQnaByIdx() 메소드 실행");
        
        model.addAttribute("consumerUserId",consumerUserId);
        model.addAttribute("sellerUserId",sellerUserId);
        model.addAttribute("sellerId",sellerId);
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























