<%@page import="java.util.List"%>
<%@page import="com.gdg.gyulDamGil.dao.OrderDAO"%>
<%@page import="com.gdg.gyulDamGil.vo.OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%-- <% session.setAttribute("sellerId", 1);%> --%>
<html>
<head>
<meta charset="UTF-8">
<title>귤담길 - 주문 목록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body>
	
	<div class="body-align">
	    <table id="seller-order-table">
	        <tr style="background-color:orange">
	            <th style="width:70px">주문ID</th>
	            <th style="width:120px">상품</th>
	            <th style="width:100px">판매자</th>
	            <th style="width:50px">수량</th>
	            <th align="right" style="width:100px">총 가격</th>
	            <th style="width:240px">주문 날짜</th>
	            <th style="width:100px">상태</th>
	            <th style="width:220px">상태 변경</th>
	            <th>상세 조회</th>
	        </tr>
        	<c:set var="list" value="${orderList.orderList}"></c:set>
        	<c:if test="${fn:length(list) != 0}">
	        <c:forEach var="order" items="${list}" varStatus="i">
            <tr>
                <td>${order.id}</td>
                <td>${order.productTitle}</td>
                <td>${order.farmName}</td>
                <td>${order.count}</td>
                <td>${order.totalPrice}원</td>
                <td>
                	<fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
				</td>
                <td>
                    <c:choose>
                        <c:when test="${order.status == 0}">
                        	<div style="color: red; font-weight: bold;">주문요청</div>
                        </c:when>
                        <c:when test="${order.status == 1}">상품준비중</c:when>
                        <c:when test="${order.status == 2}">배송중</c:when>
                        <c:when test="${order.status == 3}">배송완료</c:when>
                        <c:when test="${order.status == 4}">구매확정</c:when>
                        <c:when test="${order.status == 5}">주문취소</c:when>
                    </c:choose>
                </td>
                <td>
                    <form action="/updateStatus" method="post">
                        <input type="hidden" name="id" value="${order.id}">
                        <input type="hidden" name="sellerId" value="${order.sellerId}">
                        <input type="hidden" name="productId" value="${order.productId}"/>
                        <input type="hidden" name="url" value="/myOrder?currentPage=${orderList.currentPage}"/>
                        <select name="status">
	                    <c:if test="${order.status < 2 or order.status == 3}">
                            <option 
                            	value="4"
                            	<c:if test="${order.status == 3}">selected</c:if>
                            	<c:if test="${order.status != 3}">disabled="disabled"</c:if>>
	                            구매확정
                            </option>
                            <option 
                            	value="5" 
                            	<c:if test="${order.status == 0 or order.status == 1}">selected</c:if>
                            	<c:if test="${order.status > 1}"> disabled="disabled"</c:if>>
                            	주문취소
                            </option>
	                    </c:if>
	                    <c:if test="${order.status == 2 or order.status == 4}">
	                    	<option
	                    		selected="selected">
	                    		변경불가
	                    	</option>
	                    </c:if>
	                    <c:if test="${order.status == 5}">
	                    	<option
	                    		selected="selected">
	                    		취소된 주문입니다.
	                    	</option>
	                    </c:if>
                        </select>
                    <c:if test="${order.status < 2 or order.status == 3}">
                    	<button type="submit" >하기</button>
                    </c:if>
                    </form>
                </td>
                <td><a href="/myOrderDetail/${order.id}/${orderList.currentPage}">상세 보기</a></td>
            </tr>
	        </c:forEach>
		    
		    <!-- 페이지 이동 버튼 -->
			<tr>
				<td class="text-center align-middle" colspan="8">
					<!-- 처음으로 -->
					<c:if test="${orderList.currentPage > 1}">
						<button 
							class="btn btn-outline-primary btn-sm" 
							type="button" 
							title="첫 페이지로 이동합니다."
							onclick="location.href='/myOrder?currentPage=1'"
						>처음</button>
					</c:if>
					<c:if test="${orderList.currentPage <= 1}">
						<button 
							class="btn btn-danger btn-sm" 
							type="button" 
							disabled="disabled" 
							title="첫 페이지 입니다."
							style="font-weight: bold; color: orange; font"
						>처음</button>
					</c:if>
					&nbsp;
					<!-- 10페이지 앞으로 -->
					<c:if test="${orderList.startPage > 1}">
						<button 
							class="btn btn-outline-primary btn-sm" 
							type="button" 
							title="이전 10페이지로 이동합니다."
							onclick="location.href='/myOrder?currentPage=${orderList.startPage - 1}'"
						>이전</button>
					</c:if>
					<c:if test="${orderList.startPage <= 1}">
						<button 
							class="btn btn-danger btn-sm" 
							type="button" 
							disabled="disabled" 
							title="첫 10페이지 입니다."
							style="font-weight: bold; color: orange; font"
						>이전</button>
					</c:if>
					&nbsp;&nbsp;
					<!-- 페이지 이동 버튼 -->
					<c:forEach var="i" begin="${orderList.startPage}" end="${orderList.endPage}" step="1">
						<c:if test="${orderList.currentPage == i }">
							<button 
								class="btn btn-success btn-sm" 
								type="button" 
								disabled="disabled"
								style="font-weight: bold; color: orange; font"
							>${i}</button>
						</c:if>
						<c:if test="${orderList.currentPage != i }">
							<button 
								class="btn btn-outline-primary btn-sm" 
								type="button" 
								onclick="location.href='/myOrder?currentPage=${i}'"
							>${i}</button>
						</c:if>
						&nbsp;&nbsp;
					</c:forEach>
					<!-- 10페이지 뒤로 -->
		 			<c:if test="${orderList.endPage < orderList.totalPage}">
						<button 
							class="btn btn-outline-primary btn-sm" 
							type="button" 
							title="다음 10페이지로 이동합니다."
							onclick="location.href='/myOrder?currentPage=${orderList.endPage + 1}'"
						>다음</button>
					</c:if>
					<c:if test="${orderList.endPage >= orderList.totalPage}">
						<button 
							class="btn btn-danger btn-sm" 
							type="button" 
							disabled="disabled" 
							title="마지막 10페이지 입니다."
							style="font-weight: bold; color: orange; font"
						>다음</button>
					</c:if>
					&nbsp;
					<!-- 마지막으로 -->
					<c:if test="${orderList.currentPage < orderList.totalPage}">
						<button 
							class="btn btn-outline-primary btn-sm" 
							type="button" 
							title="마지막 페이지로 이동합니다."
							onclick="location.href='/myOrder?currentPage=${orderList.totalPage}'"
						>마지막</button>
					</c:if>
					<c:if test="${orderList.currentPage >= orderList.totalPage}">
						<button 
							class="btn btn-danger btn-sm" 
							type="button" 
							disabled="disabled" 
							title="마지막 페이지 입니다."
							style="font-weight: bold; color: orange; font"
						>마지막</button>
					</c:if>
				</td>
			</tr>
	        
            </c:if>
        	<c:if test="${fn:length(list) == 0}">
        		<tr>
        			<th colspan="8">
        				<marquee>요청된 주문이 없습니다.</marquee>
        			</th>
        		</tr>
        	</c:if>
	    </table>
	</div>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>