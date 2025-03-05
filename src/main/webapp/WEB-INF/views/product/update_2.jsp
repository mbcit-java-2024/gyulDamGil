<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<%@ page session="true" %>
</head>
<body>
<h1>update.jsp 입니다.</h1>

<br/>
<form action="/updateOK" method="post">
	<table width="600" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<input type="hidden" name="id" value="${vo.id}"/>
			<th width="130">귤 품종</th>
			<td width="470">
				<%
				String[] category = {"제주감귤", "온주밀감", "한라봉", "천혜향", "레드향", "청견", "황금향", "카라향", "진지향","세토카"};
				int cid = (int) request.getAttribute("cid");
				for (int i=0; i<category.length; i++){
					out.print(category[i]);
					if (i == cid){
				%>
					<input type="radio" name="categoryId" value="<%=i%>" checked="checked" > 
				<%
					}else {
				%>		
					<input type="radio" name="categoryId" value="<%=i%>"> 
				<%
					}
					out.print("/");
				}
				%>
	
			</td>
		</tr>
		<tr>
				<th>제목</th>
			<td>
				<input type="text" name="title" value="${vo.title }" required="required"/>
			</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<img width="500" alt="메인 상품 이미지" src="${mainImageUrl}">
				<br/>
				기존 이미지 파일명: <input type="text" name="mainImageUrl" value="${vo.mainImageUrl }">
				<br/>
				<input type="file" name="mainImage" >
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>
				<textarea rows="5" name="description" style="resize: none; width: 99%;">${vo.description}</textarea>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td> <input type="number" name="price" value="${vo.price}" > (원)</td>
		</tr>
		<tr>
			<th>수량</th>
			<td> <input type="number" name="stock" value="${vo.stock}" > (개)</td>
		</tr>
		<tr>
			<th>저장상태 변경</th>
			<td> 
			<c:if test="${vo.status == 0}">
			 	저장 등록<input type="checkbox" name="status" value="1" checked="checked" >
			</c:if>
			<c:if test="${vo.status == 1}">
				임시저장<input type="checkbox" name="status" value="0" > 
			</c:if>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<input type="submit" value="수정하기" />
				<input type="button" value="뒤로가기" onclick="history.back()"/>
				<input type="button" value="목록보기" onclick="location.href='/sellerList'"/>
			</th>
		</tr>
	</table>
</form>
	
</body>
</html>