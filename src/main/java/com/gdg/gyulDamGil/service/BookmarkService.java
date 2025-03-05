package com.gdg.gyulDamGil.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdg.gyulDamGil.dao.BookmarkDAO;
import com.gdg.gyulDamGil.vo.BookmarkVO;

@Service
public class BookmarkService {
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	public int insertProduct(BookmarkVO bookmarkVO) {
		System.out.println("BookmarkService클래스의 insert메소드 실행");
		
		
		int resultCnt = 0;	
		
		resultCnt = bookmarkDAO.insertProduct(bookmarkVO);
		
		
		return resultCnt;
	}

	public int deleteProduct(BookmarkVO bookmarkVO) {
		System.out.println("BookmarkService클래스의 deleteProduct메소드 실행");
		int resultCnt = 0;	
		
		resultCnt = bookmarkDAO.deleteProduct(bookmarkVO);
		
		return resultCnt;
	}

}
