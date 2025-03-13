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

<style type="text/css">

table {
	border: 0px solid white;
}
tr {
	border: 0px solid white;
}
th {
	border: 0px solid white;
	width: 150px;
	text-align: left;
	background-color: #FFE8D1;
}
td {
	border: 0px solid white;
	width: 650px;
	text-align: left;
	background-color: #FFF4E5;
}
.line {
	border: none;
	height: 2px;
	background-color: orange;
	margin: auto;
	width: 800px;
	
}
.newDate {
	font-size: 20px;
	font-weight: bold;
	width: 800px;
	margin: auto;
}
.product-image {
	width: 100%;
	max-width: 150px;
	height: 100%;
	max-height: 100px;
	object-fit: cover;
	border-radius: 8px;
}
.btn-list {
	font-size: 16px; 
	font-weight: bold; 
	padding: 5px; 
	margin: 10px; 
	border: 1px solid orange; 
	cursor: pointer;
	background-color: #FFE5B4;
	margin-left: auto;
	border-radius: 8px;
}
.btn-list:hover {
    background-color: orange;
    color: white;
}
.under-line {
	border-bottom: 1px solid white;
}
.right-line {
	border-right: 1px solid white;
}

</style>

</head>
<body>

	<div style="margin-left: auto; margin-right:auto; margin-top: 60px; width: 800px; display: flex;">
    	<h2 style="font-size: 20px; font-weight: bold; margin-top: auto; margin-right: auto;">&nbsp;&nbsp;주문 정보</h2>
		<input 
			type="button" 
			class="btn-list"
			onclick="location.href='/orderList?currentPage=${currentPage}'" 
			value="목록 돌아가기" />
    </div>
    <hr class="line"/>
    
    <div style="justify-content: center; padding-top: 60px;">
	    <fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 dd일" var="orderDate"/>
		<c:if test="${orderDate != date}">
			<c:set var="date" value="${orderDate}"/>
			<div class="newDate">
				${date} 주문<hr/>
			</div>
		</c:if>
		<div class="bg-white rounded-lg shadow-md p-4" 
			style="border-top: 1px solid orange; display: flex; width: 800px; margin: auto; margin-bottom: 30px;">
			<img class="product-image" src="${order.mainImageUrl}" alt="상품 이미지" style="margin-right: 20px;"/>
			<div style="width: 300px;">
				${order.farmName}<br/>
				${order.productTitle}<br/>
				${order.count}개<br/>
				<c:if test="${order.count > 1}">총 </c:if>
				${order.totalPrice}원<br/>
			</div>
		</div>
	</div>

	<div style="margin-left: auto; margin-right:auto; width: 800px; display: flex;">
    	<h2 style="font-size: 18px; font-weight: bold;">&nbsp;&nbsp;받는사람 정보</h2>
    </div>
    <hr class="line"/>
	
	<table style="margin-left: auto; margin-right:auto;">
		<tr class="under-line">
			<th>상태</th>
			<td>
				<c:choose>
                    <c:when test="${order.status == 0}">주문요청</c:when>
                    <c:when test="${order.status == 1}">상품준비중</c:when>
                    <c:when test="${order.status == 2}">배송중</c:when>
                    <c:when test="${order.status == 3}">배송완료</c:when>
                    <c:when test="${order.status == 4}">구매확정</c:when>
                    <c:when test="${order.status == 5}">주문취소</c:when>
                </c:choose>
			</td>
		</tr>
		<tr class="under-line">
			<th>이름</th>
			<td>${consumer.name}</td>
		</tr>
		<tr class="under-line">
			<th>전화번호</th>
			<td>${consumer.phone}</td>
		</tr>
		<tr class="under-line">
			<th>주소</th>
			<td>${consumer.address} ${consumer.detailAddress}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${consumer.email}</td>
		</tr>
	</table>
	<hr class="line"/><br/><br/><br/>

	<div style="margin-left: auto; margin-right:auto; width: 800px; display: flex;">
    	<h2 style="font-size: 18px; font-weight: bold;">&nbsp;&nbsp;주문수락 및 주문상태 변경</h2>
    </div>
    <hr class="line"/>
	<div style="margin-left: auto; margin-right:auto; width: 800px; display: flex;">
	    <table>
	        <tr style="background-color:orange">
	            <th class="right-line" style="text-align: center; width: 200px;">상품명</th>
	            <th class="right-line" style="text-align: center;">재고</th>
	            <th class="right-line" style="text-align: center; width: 200px;"">주문 날짜</th>
	            <th class="right-line" style="text-align: center;">상태</th>
	            <th style="text-align: center;">상태 변경</th>
	        </tr>
	     		<tr>
	            <td class="right-line" style="text-align: center;">${order.productTitle}</td>
	            <td class="right-line" style="text-align: center;">${stock}개</td>
	            <td class="right-line" style="text-align: center;">
	            	<fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
				</td>
	            <td class="right-line" style="text-align: center;">
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
	            <td style="text-align: center;">
	                <form action="/updateStatus" method="post">
	                    <input type="hidden" name="id" value="${order.id}">
	                    <input type="hidden" name="sellerId" value="${order.sellerId}">
	                    <input type="hidden" name="productId" value="${order.productId}"/>
	                    <input type="hidden" name="url" value="/orderDetail/${order.id}/${currentPage}"/>
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
	        </tr>
	    </table>
	</div>
	<hr class="line"/>
    <br/><br/><br/><br/>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>