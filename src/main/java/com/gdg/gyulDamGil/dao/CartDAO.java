package com.gdg.gyulDamGil.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdg.gyulDamGil.vo.CartVO;
import com.gdg.gyulDamGil.vo.ConsumerVO;

@Mapper
public interface CartDAO {

	public int insert(CartVO cartVo);
	List<CartVO> selectcartList(CartVO param);
	public List<CartVO>  selectcartListByProdId(CartVO cartVo);
	public int updateDetail(CartVO cartVo);
	public int updateCart(CartVO cartVo);
	public int deleteCartSelectedOne(CartVO cartVo);
	public List<CartVO> selectCartListByIds(String cartIds);
	public ConsumerVO selectConsumerList(int consumerId);
	public CartVO selectById(int id);
	public void deleteCartItems(Map<String, Object> param);
	public int selectCartCount(int consumerId);
}
