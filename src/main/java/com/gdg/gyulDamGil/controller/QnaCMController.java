package com.gdg.gyulDamGil.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdg.gyulDamGil.dao.QnaCMDAO;
import com.gdg.gyulDamGil.vo.QnaCMRepliesVO;
import com.gdg.gyulDamGil.vo.QnaCMVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaCMController {

    @Autowired
    private QnaCMDAO dao;

    // 전체 QnA 목록 출력
    @RequestMapping("/QnaCMList")
    public String selectQnaList(Model model) {
        List<QnaCMVO> qnaList = dao.selectList();
        log.info("QnaCMController - selectQnaList() 실행");
        
        model.addAttribute("qnaList", qnaList);
        log.info("qnaList: {}", qnaList);
        return "/QnaCM/QnaCMList";
    }

    // QnA 작성 페이지 이동
    @RequestMapping("/QnaCMInsert")
    public String QnaInsert() {
        log.info("QnaCMController - QnaInsert() 실행");

        return "/QnaCM/QnaCMInsert";
    }

    // QnA 작성 처리
    @RequestMapping("/QnaCMInsertOK")
    public String QnaInsertOK(QnaCMVO qnaCMVO, RedirectAttributes redirectAttributes) {
        log.info("QnaCMController - QnaInsertOK() 실행");
        dao.insert(qnaCMVO);

        redirectAttributes.addFlashAttribute("message", "문의가 등록되었습니다.");
        return "redirect:/QnaCMList";
    }

    // QnA 상세 조회
    @RequestMapping("/QnaCMDetail")
    public String selectQnaByIdx(@RequestParam("idx") int idx, Model model) {
        QnaCMVO qnaCMVO = dao.selectQnaByIdx(idx);
        List<QnaCMRepliesVO> replies = dao.selectRepliesByQnaIdx(idx);

        log.info("QnaCMController - selectQnaByIdx() 실행");

        model.addAttribute("qnaCMVO", qnaCMVO);
        model.addAttribute("replies", replies);

        return "/QnaCM/QnaCMDetail";
    }

    // QnA 답글 작성 처리
    @RequestMapping("/QnaCMReplyInsert")
    public String QnaReplyInsert(QnaCMRepliesVO qnaCMRepliesVO, RedirectAttributes redirectAttributes) {
        log.info("QnaCMController - QnaReplyInsert() 실행");
        dao.insertReply(qnaCMRepliesVO);

        redirectAttributes.addAttribute("idx", qnaCMRepliesVO.getParentId());
        return "redirect:/QnaCMDetail?idx=" + qnaCMRepliesVO.getParentId();   
        }
}