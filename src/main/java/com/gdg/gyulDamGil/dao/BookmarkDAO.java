package com.gdg.gyulDamGil.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdg.gyulDamGil.vo.BookmarkVO;

@Mapper
public interface BookmarkDAO {

	int insertProduct(BookmarkVO bookmarkVO);

	int deleteProduct(BookmarkVO bookmarkVO);

	int insertFarm(BookmarkVO bookmarkVO);

	int deleteFarm(BookmarkVO bookmarkVO);

	List<BookmarkVO> selectBookMarkList(BookmarkVO bookmarkVO);

	int bookMarkProductDelete(Map<String, Object> param);

	int bookMarkFarmDelete(Map<String, Object> param);


}
