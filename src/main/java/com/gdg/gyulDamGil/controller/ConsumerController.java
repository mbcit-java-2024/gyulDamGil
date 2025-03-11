package com.gdg.gyulDamGil.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.origin.SystemEnvironmentOrigin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdg.gyulDamGil.dao.ConsumerDAO;
import com.gdg.gyulDamGil.dao.OrderDAO;
import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.vo.ConsumerVO;
import com.gdg.gyulDamGil.vo.OrderList;
import com.gdg.gyulDamGil.vo.OrderVO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ConsumerController {

	@Autowired
	private ConsumerDAO consumerDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private SellerDAO sellerDAO;
	
	// seller 목록 불러오기
	@RequestMapping("/myOrder")
	public String myOrder(Model model, HttpServletRequest request) {
		log.info("ConsumerController 클래스의 myOrder() 메소드 실행");
		int pageSize = 10;
		int consumerId;
		int currentPage;
		try {
			if ((int) request.getSession().getAttribute("userType") == 2) {
				return "redirect:/orderList";
			}
			consumerId = (int) request.getSession().getAttribute("id");
		} catch (NullPointerException e) {
			return "/consumer/login_2";
		}
		int totalCount = orderDAO.selectCountForC(consumerId);
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			currentPage = (currentPage < 1) ? 1 : currentPage;
			currentPage = (currentPage > totalCount) ? totalCount : currentPage;
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		OrderList orderList = new OrderList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", orderList.getStartNo());
		hmap.put("pageSize", orderList.getPageSize());
		hmap.put("id", consumerId);
		System.out.println((ArrayList<OrderVO>) orderDAO.selectOrderListForC(hmap));
		orderList.setOrderList((ArrayList<OrderVO>) orderDAO.selectOrderListForC(hmap));
		for (int i = 0; i < orderList.getOrderList().size(); i++) {
			orderList.getOrderList().get(i).setFarmName(sellerDAO.selectFarmName(orderList.getOrderList().get(i).getSellerId()));
//			System.out.println("테스트용 프린트 !!! : " + orderList.getOrderList().get(i));
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("currentPage", currentPage);
		return "/consumer/myOrder5";
	}
	
	@RequestMapping("/myOrderDetail/{orderId}/{currentPage}")
    public String myOrderDetail(@PathVariable("orderId") int id,@PathVariable("currentPage") int currentPage, Model model, HttpServletRequest request) {
		log.info("ConsumerController 클래스의 myOrderDetail() 메소드 실행");
		if ((int) request.getSession().getAttribute("userType") == 2) {
			return "redirect:/orderList";
		}
		try {
			int login = (int) request.getSession().getAttribute("id");
		} catch (NullPointerException e) {
			return "/consumer/login_2";
		}
        OrderVO order = orderDAO.selectOrderById(id);
        ConsumerVO consumer = consumerDAO.selectConsumerById(order.getConsumerId());
        SellerVO seller = sellerDAO.selectSellerById(order.getSellerId());
        int stock = productDAO.selectStockById(order.getProductId());
        model.addAttribute("order", order);
        model.addAttribute("consumer", consumer);
        model.addAttribute("stock", stock);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("seller", seller);
        return "/consumer/myOrderDetail5";
    }
	
}
