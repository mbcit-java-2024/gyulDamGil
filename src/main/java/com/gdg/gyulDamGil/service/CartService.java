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
		if (0 < cartlist.size()) {
			// productId로 cart테이블을 조회해오는 실행문
			// 논리적으로는 단 1건만 나와야하지만 여러개가 나올수 있어서 결과를 목록으로 받음
			// 그 목록의 첫번째 행의 아이디를 가져오도록 함
			// 원래 데이터가 제대로 들어간다고 하면 리스트를 안받고 브이오로 받아서 처리
			// 첫번째 행에 업데이트 -> 한건이라도 나오면 처리
			cartVo.setId(cartlist.get(0).getId());
			resultCnt = cartDAO.updateDetail(cartVo);
		} else
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

	public int selectCartCount(int consumerId) {
		return cartDAO.selectCartCount(consumerId);
	}

}
