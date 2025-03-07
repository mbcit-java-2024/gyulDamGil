package com.gdg.gyulDamGil.vo;

import java.util.ArrayList;

public class ProductList {
	private ArrayList<ProductVO> productListForOnePage = new ArrayList<ProductVO>();
	
	private int pageSize = 10;
	private int totalCount= 0;
	private int totalPage = 0;
	private int currentPage = 1;
	private int startNo = 0;
	private int startPage = 0;
	private int endNo = 0;
	private int endPage = 0;
	
	public ProductList() {}
	public ProductList(int pageSize, int totalCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
	
	private void calculator() {
		totalPage = (totalCount-1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9 <= totalPage ? startPage + 9 : totalPage;
	}
	
	
	public ArrayList<ProductVO> getProductListForOnePage() {
		return productListForOnePage;
	}
	public void setProductListForOnePage(ArrayList<ProductVO> productList) {
		this.productListForOnePage = productList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	@Override
	public String toString() {
		return "ProductList [productList=" + productListForOnePage + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", startPage="
				+ startPage + ", endNo=" + endNo + ", endPage=" + endPage + "]";
	}
	

}
