<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귤담길 - 주문 상세 정보</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body>
	<a type="button" href="/myOrder?currentPage=${currentPage}">
		목록보기
	</a>
    <table>
        <tr style="width:1010px; background-color:orange">
            <th style="width:100px">주문 ID</th>
            <th style="width:70px">상품 ID</th>
            <th style="width:70px">재고</th>
            <th style="width:50px">수량</th>
            <th style="width:100px" align="right">총 가격</th>
            <th style="width:300px">주문 날짜</th>
            <th style="width:100px">상태</th>
            <th style="width:220px">상태 변경</th>
        </tr>
     		<tr>
            <td>${order.id}</td>
            <td>${order.productId}</td>
            <td>${stock}</td>
            <td>${order.count}</td>
            <td>${order.totalPrice}원</td>
            <td>
            	<fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
		</td>
            <td>
                <c:choose>
                    <c:when test="${order.status == 0}">
                    	<div style="color: red;">주문요청</div>
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
					<input type="hidden" name="url" value="/myOrderDetail/${order.id}/${currentPage}"/>
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
        </tr>
    </table>
    <br/><br/><br/><br/>
    <h2>주문 정보</h2>
    <table>
    	<tr style="width:1010px; background-color:orange">
    		<th style="width:150px">판매농가</th>
    		<th style="width:70px">이름</th>
    		<th style="width:150px">전화번호</th>
    		<th style="width:370px">주소</th>
    		<th style="width:270px">이메일</th>
    	</tr>
    	<tr>
    		<td>${seller.farmName}</td>
    		<td>${consumer.name}</td>
    		<td>${consumer.phone}</td>
    		<td>${consumer.address} ${consumer.detailAddress}</td>
    		<td>${consumer.email}</td>
    	</tr>
    </table>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>