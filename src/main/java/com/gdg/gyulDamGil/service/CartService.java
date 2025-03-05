package com.gdg.gyulDamGil.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdg.gyulDamGil.dao.CartDAO;
import com.gdg.gyulDamGil.vo.CartVO;
import com.gdg.gyulDamGil.vo.ConsumerVO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public int insert(CartVO cartVo) {
		
//		Integer.parseInt("a");
		
		int resultCnt = 0;
		
		
		List<CartVO> cartlist = cartDAO.selectcartListByProdId(cartVo);
		if (0 < cartlist.size())  {
			cartVo.setId(cartlist.get(0).getId());
			resultCnt = cartDAO.updateDetail(cartVo); 
		}
		else 
			resultCnt = cartDAO.insert(cartVo);
		
		return resultCnt;
	}

	public List<CartVO> selectcartList(CartVO param) {
		return cartDAO.selectcartList(param);
	}
	
	public int updateCart(CartVO cartVo) {
		return cartDAO.updateCart(cartVo);
	}

	public int deleteCartSelectedOne(CartVO cartVo) {
		return cartDAO.deleteCartSelectedOne(cartVo);
	}

	public List<CartVO> selectCartListByIds(String cartIds) {
		return cartDAO.selectCartListByIds(cartIds);
	}

	public ConsumerVO selectConsumerList(int consumerId) {
		return cartDAO.selectConsumerList(consumerId);
	}

	

}
