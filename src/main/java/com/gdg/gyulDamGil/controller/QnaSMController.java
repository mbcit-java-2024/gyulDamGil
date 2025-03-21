package com.gdg.gyulDamGil.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdg.gyulDamGil.dao.QnaSMDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.vo.QnaSMRepliesVO;
import com.gdg.gyulDamGil.vo.QnaSMVO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaSMController {

    @Autowired
    private QnaSMDAO dao;
    
    @Autowired
    private SellerDAO sellerdao;

    // 전체 QnA 목록 출력
    @RequestMapping("/QnaSMList")
    public String selectQnaList(Model model, HttpServletRequest request) {
    	int sellerId = (int) request.getSession().getAttribute("id");
    	SellerVO seller = sellerdao.selectSellerById(sellerId);
    	
    	String sellerUserId = seller.getFarmName();
    	
    
        List<QnaSMVO> qnaList = dao.selectQnaBySellerId(sellerId);
        log.info("QnaSMController - selectQnaList() 실행");
        
        model.addAttribute("sellerUserId", sellerUserId);
        model.addAttribute("qnaList", qnaList);
        log.info("qnaList: {}", qnaList);
        return "/QnaSM/QnaSMList";
    }

    // QnA 작성 페이지 이동
    @RequestMapping("/QnaSMInsert")
    public String QnaInsert(Model model, HttpServletRequest request) {
    	int sellerId = (int) request.getSession().getAttribute("id");
    	
    	SellerVO seller = sellerdao.selectSellerById(sellerId);
    	String sellerUserId = seller.getFarmName();
        log.info("QnaSMController - QnaInsert() 실행");
        
        model.addAttribute("sellerId",sellerId);
        model.addAttribute("sellerUserId",sellerUserId);
        return "/QnaSM/QnaSMInsert";
    }

    // QnA 작성 처리
    @RequestMapping("/QnaSMInsertOK")
    public String QnaInsertOK(QnaSMVO qnaSMVO, RedirectAttributes redirectAttributes) {
        log.info("QnaSMController - QnaInsertOK() 실행");
        dao.insert(qnaSMVO);

        redirectAttributes.addFlashAttribute("message", "문의가 등록되었습니다.");
        return "redirect:/QnaSMList";
    }

    // QnA 상세 조회
    @RequestMapping("/QnaSMDetail")
    public String selectQnaByIdx(@RequestParam("id") int id, Model model, HttpServletRequest request) {
    	int sellerId = (int) request.getSession().getAttribute("id");
    	SellerVO seller = sellerdao.selectSellerById(sellerId);
    	String sellerUserId = seller.getFarmName();
    	
        QnaSMVO qnaSMVO = dao.selectQnaByIdx(id);
        List<QnaSMRepliesVO> replies = dao.selectRepliesByQnaIdx(id);

        log.info("QnaSMController - selectQnaByIdx() 실행");

        model.addAttribute("qnaSMVO", qnaSMVO);
        model.addAttribute("sellerUserId", sellerUserId);
        model.addAttribute("replies", replies);

        return "/QnaSM/QnaSMDetail";
    }

    // QnA 답글 작성 처리
    @RequestMapping("/QnaSMReplyInsert")
    public String QnaReplyInsert(QnaSMRepliesVO qnaSMRepliesVO, RedirectAttributes redirectAttributes) {
        log.info("QnaSMController - QnaReplyInsert() 실행");
        dao.insertReply(qnaSMRepliesVO);

        redirectAttributes.addAttribute("id", qnaSMRepliesVO.getParentId());
        return "redirect:/QnaSMDetail?id=" + qnaSMRepliesVO.getParentId();   
        }
}