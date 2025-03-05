<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 확인</title>
</head>
<body>
<h1>show_2.jsp 입니다.</h1>

<br/>
	<table width="600" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th width="100">귤 품종</th>
			<td width="500">
				
				<%
				String[] category = {"제주감귤", "온주밀감", "한라봉", "천혜향", "레드향", "청견", "황금향", "카라향", "진지향","세토카"};
				int cid = (int) request.getAttribute("cid");
				String c = category[cid];
				%>
				<%=c %>
 			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				${productVO.title}
			</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<img width="500" alt="메인 상품 이미지" src="${mainImageUrl}">
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>
				${productVO.description}
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td> ${productVO.price} (원)</td>
		</tr>
		<tr>
			<th>수량</th>
			<td> ${productVO.stock} (개)</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="location.href='/update/${productVO.id}'"/>
				<input type="button" value="삭제하기" onclick="location.href='/delete/${productVO.id}'"/>
				<input type="button" value="목록보기" onclick="location.href='/sellerList'"/>
			</th>
		</tr>
	</table>
	
</body>
</html>