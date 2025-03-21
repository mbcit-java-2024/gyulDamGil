package com.gdg.gyulDamGil.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gdg.gyulDamGil.dao.ConsumerDAO;
import com.gdg.gyulDamGil.dao.OrderDAO;
import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.service.OrderService;
import com.gdg.gyulDamGil.vo.ConsumerVO;
import com.gdg.gyulDamGil.vo.OrderList;
import com.gdg.gyulDamGil.vo.OrderVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController5 {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ConsumerDAO consumerDAO;
	
	@Autowired
	private SellerDAO sellerDAO;
	
	@RequestMapping("/orderList")
	public String orderList(Model model, HttpServletRequest request) {
		log.info("OrderController5 클래스의 orderList() 메소드 실행");
		int pageSize = 10;
		int sellerId;
		int currentPage;
		try {
			if ((int) request.getSession().getAttribute("userType") == 1) {
				return "redirect:/myOrder";
			}
			sellerId = (int) request.getSession().getAttribute("id");
		} catch (NullPointerException e) {
			return "/seller/login_2";
		}
		int totalCount = orderDAO.selectCountForS(sellerId); // 셀러에 대한 오더리스트의 총 개수 (주문의개수)
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
		hmap.put("id", sellerId);
//		System.out.println((ArrayList<OrderVO>) orderDAO.selectOrderListForS(hmap));
		orderList.setOrderList((ArrayList<OrderVO>) orderDAO.selectOrderListForS(hmap)); // 오더의 셀러에게 들어온 주문을 페이지 개수만큼 역순으로 불러옴
		System.out.println(orderList.getOrderList()); // 디비에 있는 주문 목록을 가져옴
		model.addAttribute("orderList", orderList);
		model.addAttribute("currentPage", currentPage);
		return "/seller/orderList5";
	}
	
	@RequestMapping("/orderDetail/{orderId}/{currentPage}")
    public String orderDetail(@PathVariable("orderId") int id,@PathVariable("currentPage") int currentPage, Model model, HttpServletRequest request) {
		log.info("OrderController5 클래스의 orderDetail() 메소드 실행");
		try {
			if ((int) request.getSession().getAttribute("userType") == 1) {
				return "redirect:/myOrder";
			}
			int login = (int) request.getSession().getAttribute("id");
		} catch (NullPointerException e) {
			return "/seller/login_2";
		}
        OrderVO order = orderDAO.selectOrderById(id);
        order.setFarmName(sellerDAO.selectFarmName(order.getSellerId()));
        order.setProductTitle(productDAO.selectTitleById(order.getProductId()));
        order.setMainImageUrl(productDAO.selectImageById(order.getProductId()));
        ConsumerVO consumer = consumerDAO.selectConsumerById(order.getConsumerId());
        int stock = productDAO.selectStockById(order.getProductId());
        model.addAttribute("order", order);
        model.addAttribute("consumer", consumer);
        model.addAttribute("stock", stock);
        model.addAttribute("currentPage", currentPage);
        return "/seller/orderDetail5";
    }
	
	@RequestMapping("/updateStatus")
    public String updateOrderStatus(@RequestParam("id") int id, @RequestParam("status") int status, @RequestParam("url") String url) {
		log.info("OrderController5 클래스의 updateOrderStatus() 메소드 실행");
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("status", status);
        orderDAO.updateOrderStatus(map);
        OrderVO order = orderDAO.selectOrderById(id);
        if (status == 1) {
        	minusStock(order);
        }
        log.info("url");
        return "redirect:" + url;
    }
	
	private void minusStock(OrderVO order) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("count", order.getCount());
		map.put("productId", order.getProductId());
		productDAO.minusStock(map);
		int stock = productDAO.selectStockById(order.getProductId());
		if (stock == 0) {
			productDAO.updateForSoldOut(order.getProductId());
		}
	}
	
}

