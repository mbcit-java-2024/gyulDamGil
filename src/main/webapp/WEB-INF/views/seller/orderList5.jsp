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
	        <tr id="orderListBanner" style="background-color:orange">
	            <th style="width:100px">주문 ID</th>
	            <th style="width:70px">상품 ID</th>
	            <th style="width:50px">수량</th>
	            <th align="right" style="width:100px">총 가격</th>
	            <th style="width:300px">주문 날짜</th>
	            <th style="width:100px">상태</th>
	            <th style="width:220px">상태 변경</th>
	            <th>상세 조회</th>
	        </tr>
        	<c:set var="list" value="${orderList.orderList}"></c:set>
        	
        	<!-- 요청된 주문이 있을 때 -->
        	<c:if test="${fn:length(list) != 0}">
	        <c:forEach var="order" items="${list}" varStatus="i">
            <tr>
                <td>${order.id}</td>
                <td>${order.productId}</td>
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
                        <input type="hidden" name="url" value="/orderList?currentPage=${orderList.currentPage}"/>
                        <select name="status">
                            <c:if test="${order.status < 3}">
                            <option 
                            	value="1"
                            	<c:if test="${order.status > 0}"> disabled="disabled"</c:if>
                            	<c:if test="${order.status == 0}">selected</c:if>>
                            	상품준비중
                            </option>
                            <option 
                            	value="2" 
                            	<c:if test="${order.status > 1}"> disabled="disabled"</c:if>
                            	<c:if test="${order.status == 1}">selected</c:if>>
                            	배송중
                            </option>
                            <option 
                            	value="3"
                            	<c:if test="${order.status > 2}"> disabled="disabled"</c:if>
                            	<c:if test="${order.status == 2 or order.status == 3}">selected</c:if>>
                            	배송완료
                            </option>
                            <option 
                            	value="5" 
                            	<c:if test="${order.status > 1}"> disabled="disabled"</c:if>
                            	<c:if test="${order.status == 5}">selected</c:if>>
                            	주문취소
                            </option>
                            </c:if>
                            <c:if test="${order.status == 3}">
                            <option value="4">
	                            배송완료된 주문입니다.
                            </option>
                            </c:if>
                            <c:if test="${order.status == 4}">
                            <option value="4">
	                            구매확정된 주문입니다.
                            </option>
                            </c:if>
                            <c:if test="${order.status == 5}">
	                    	<option
	                    		selected="selected">
	                    		취소된 주문입니다.
	                    	</option>
	                    	</c:if>
                        </select>
                        <c:if test="${order.status < 3}">
                        <button type="submit">(으)로 변경</button>
                        </c:if>
                    </form>
                </td>
                <td><a href="/orderDetail/${order.id}/${orderList.currentPage}">상세 보기</a></td>
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
							onclick="location.href='/orderList?currentPage=1'"
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
							onclick="location.href='/orderList?currentPage=${orderList.startPage - 1}'"
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
								onclick="location.href='/orderList?currentPage=${i}'"
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
							onclick="location.href='/orderList?currentPage=${orderList.endPage + 1}'"
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
							onclick="location.href='/orderList?currentPage=${orderList.totalPage}'"
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
            <!-- 요청된 주문이 없을 때 -->
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