<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 등록상품 목록</title>
<%@ page session="true" %>
</head>
<body>

<h1>/product/sellerList_2.jsp 입니다.</h1>

<form action="/insert" method="get">
	<!-- <input type="hidden" name="sellerId" value="7" /> -->
	<input type="submit" value="상품 등록">
</form>
	<input type="button" value="전체 목록가기" onclick="location.href='/'">

<br/>
나의 상품 총 개수: ${count}
<br/>
나의 등록완료된 상품: ${status1} /${count}
<br/>
나의 임시저장된 상품: ${status0} /${count}
<br/>
<table>
	<c:forEach var="vo" items="${productList}" varStatus="vs">
	<tr>
		<td>
			${vs.count}.
		</td> 
		<td>
			<a href="/show/${vo.id}" style="text-decoration: none; color: black;">${vo.title}</a>
		</td> 
		<td>
			 가격: ${vo.price} (원) 
		</td> 
		<td>
	  		 판매자: ${vo.farmName}
		</td> 
		<td>
	  		상태: 
			<c:if test="${vo.status == 0}">임시 저장</c:if>
			<c:if test="${vo.status == 1}">등록 완료</c:if>
			<c:if test="${vo.status == 2}">품절</c:if>
	  <%--  <input type="hidden" name="id" value="${vo.id}"> --%>
		</td> 
	</tr>
	</c:forEach>
</table>

<br/>

</body>
</html>