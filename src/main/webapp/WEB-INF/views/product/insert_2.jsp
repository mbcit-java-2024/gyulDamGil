<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<%@ page session="true" %>
</head>
<body>
<h1>insert.jsp 입니다.</h1>

<br/>
<form action="/insertOK" method="post" enctype="multipart/form-data">
	<table width="600" border="1" cellpadding="5" cellspacing="0">
		<input type="hidden" name="sellerId" value="${sessionScope.id}"/>
		<input type="hidden" name="farmName" value="${sessionScope.userVO.farmName}"/>
		<tr>
			<th width="100">귤 품종</th>
			<td width="500">
				제주감귤<input type="radio" name="categoryId" value="0" required="required"> 
				온주밀감<input type="radio" name="categoryId" value="1" > 
				한라봉<input type="radio" name="categoryId" value="2" > 
				천혜향<input type="radio" name="categoryId" value="3" > 
				레드향<input type="radio" name="categoryId" value="4" > 
				청견<input type="radio" name="categoryId" value="5" > 
				황금향<input type="radio" name="categoryId" value="6" > 
				카라향<input type="radio" name="categoryId" value="7" > 
				진지향<input type="radio" name="categoryId" value="8" > 
				세토카<input type="radio" name="categoryId" value="9"> 
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" required="required"/>
			</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<input type="file" name="mainImage" required="required">
				<c:if test="${not empty fail}">
					<span style="color: red;">${fail}</span> 
				</c:if>
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>
				<textarea rows="5" name="description" style="resize: none; width: 99%;" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td> <input type="number" name="price" required="required" > (원)</td>
		</tr>
		<tr>
			<th>수량</th>
			<td> <input type="number" name="stock" required="required" > (개)</td>
		</tr>
		<tr>
			<th colspan="2">
				임시저장 <input type="checkbox" name="status" value="0"/>
				<input type="submit" value="저장"/>
				<input type="button" value="목록보기" onclick="location.href='sellerList'"/>
			</th>
		</tr>
	</table>
	
</form>


</body>
</html>