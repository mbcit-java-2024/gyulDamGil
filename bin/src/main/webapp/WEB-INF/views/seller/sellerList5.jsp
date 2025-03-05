<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/seller.js" defer></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<meta charset="UTF-8">
<title>귤담길 - 판매자</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%
	session.setAttribute("sellerId", 1);
//	out.println(request.getSession().getAttribute("sellerId"));
%>

	<input 
		type="button" 
		value="판매자 주문 조회" 
		onclick="goOrderList(<%= request.getSession().getAttribute("sellerId") %>)"
	/>
	<h2>판매자 목록</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
		</tr>
		<c:forEach var="seller" items="${sellerList}">
			<tr>
				<td>${seller.userId}</td>
				<td>${seller.name}</td>
				<td>${seller.email}</td>
				<td>${seller.phone}</td>
				<td>
					<input type="button" value="보기" id="selectSeller()" onclick="selectSeller(${seller.id})"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
<%@ include file="../include/footer.jsp" %>
</html>