package com.gdg.gyulDamGil.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdg.gyulDamGil.dao.ConsumerDAO;
import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.dao.ReviewDAO;
import com.gdg.gyulDamGil.vo.ConsumerVO;
import com.gdg.gyulDamGil.vo.ProductVO;
import com.gdg.gyulDamGil.vo.QnaCSVO;
import com.gdg.gyulDamGil.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO dao;

	@Autowired
	private ProductDAO productdao;
	
	@Autowired
	private ConsumerDAO consumerdao;

	@RequestMapping("/ReviewInsert")
	public String insert(Model model, HttpSession session, HttpServletRequest request) {
		int consumerId = (int) request.getSession().getAttribute("id");
		ConsumerVO consumer = consumerdao.selectConsumerById(consumerId);
		String consumerUserId = consumer.getUserId();
		
		model.addAttribute("consumerUserId",consumerUserId);
		model.addAttribute("consumerId",consumerId);
		
		
		
		log.info("HomeController 클래스의 insert() 메소드 실행");
		return "/Review/ReviewInsert";
	}

	@RequestMapping("/ReviewInsertOK")
	public String insertOK(ReviewVO reviewVO,Model model, RedirectAttributes redirectAttributes) {
//		log.info("ReviewVO:{}", reviewVO);
		log.info("HomeController 클래스의 insertOK() 메소드 실행");
		dao.insert(reviewVO);
		log.info("rate:{}",reviewVO.getRate());
		
		redirectAttributes.addFlashAttribute("message", "리뷰가 등록되었습니다.");
		return "redirect:/ReviewList?productId=" + reviewVO.getProductId();
	}
	
	@RequestMapping("/ReviewSellerList")
	public String getSellerReviews(@RequestParam("sellerId") int sellerId, Model model) {
		log.info("HomeController 클래스의 ReviewSellerList() 메소드 실행");
		
		List<ReviewVO> reviews = (List<ReviewVO>) dao.selectReviewBySellerId(sellerId);
		
		float averageRating = dao.selectAverageRatingBySellerId(sellerId);
		
		model.addAttribute("sellerId", sellerId);
		model.addAttribute("reviewList", reviews);
		model.addAttribute("averageRating", averageRating);
		
		return "/Review/ReviewSellerList";
		
	}

    @RequestMapping("/ReviewList")
    public String getProductReviews(@RequestParam("productId") int productId, Model model) {
        log.info("받은 productId: " + productId);
                
        ProductVO productVO = productdao.selectById(productId);
        String productName = productVO.getTitle();
        
        List<ReviewVO> reviews = (List<ReviewVO>) dao.selectReviewByProductId(productId);
        
        for (int i = 0; i < reviews.size(); i++) {
        	reviews.get(i).setConsumerName(consumerdao.selectUserIdById(reviews.get(i).getConsumerId()));
		}
        
        model.addAttribute("productName",productName);
        model.addAttribute("productId", productId);
        model.addAttribute("reviewList", reviews);


        return"/Review/ReviewList";
    }
    
    @RequestMapping("/ReviewUpdate")
    public String updateReview(@RequestParam("id") int id,ReviewVO reviewVO , Model model) {
        ReviewVO review = dao.selectReviewByIdx(id);
        
                
        log.info("rate:{}",reviewVO.getRate());
        model.addAttribute("review", review);
        model.addAttribute("productId", review.getProductId());
        model.addAttribute("rate", reviewVO.getRate());
        return "/Review/ReviewUpdate";
    }
    
    @RequestMapping("/ReviewUpdateOK")
    public String updateOK(ReviewVO reviewVO, RedirectAttributes redirectAttributes) {
        dao.update(reviewVO);
 //       float rate = reviewVO.getRate();
        log.info("HomeController 클래스의 ReviewUpdateOK() 메소드 실행");
        Date updateDate = reviewVO.getUpdateDate();
       
        log.info("rate:{}",reviewVO.getRate());
        
        redirectAttributes.addFlashAttribute("message", "리뷰가 수정되었습니다.");
        return "redirect:/ReviewList?productId=" + reviewVO.getProductId();
    }



	// 리뷰 삭제 처리
    @RequestMapping("/ReviewDelete")
    public String deleteReview(@RequestParam("id") int id, Model model, RedirectAttributes redirectAttributes) {
    	ReviewVO review = dao.selectReviewByIdx(id);
    	int productId = review.getProductId();
        dao.delete(id);
        
        redirectAttributes.addFlashAttribute("message", "리뷰가 삭제되었습니다.");
        
        
        return "redirect:/ReviewList?productId=" + review.getProductId();
    }
    
}