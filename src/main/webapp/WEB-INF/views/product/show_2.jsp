<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<%@ page session="true" %>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- footer style -->
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<!-- this style -->
<style>

    .table-container {
        border-radius: 10px; /* 원하는 둥근 모서리 정도 */
        overflow: hidden;   /* 테두리 밖으로 넘치는 부분 숨기기 */
        border: 1px solid #ccc; /* 테두리 색상 및 두께 */
        display: inline-block; /* 컨테이너 크기를 테이블과 일치시키기 */
    }
    
    table {
    	border: 0px;
        border-collapse: collapse; /* 셀 간격 제거 */
        width: 100%; /* 테이블 너비를 컨테이너에 맞추기 */
    }
    th, td {
    	border: 0px;
    	border-bottom: 1px;
    	height: 50px
    }
    
    tr{
    	border: 0px;
    	border-bottom: 1px solid #ccc;
    
    }
   
    
	.center {
		margin: auto;
		display: flex;
		justify-content: center;
	}
	
	input {
    	border: none;
    	margin-top: auto;
    	margin-bottom: auto;
    	width: 100%;
	}
	input:focus {
	    outline: none;
	}
	
	svg {
		color: #ccc;
		width: 80%
	}
	
</style>
<jsp:include page="../include/header.jsp"/>
</head>
<body>

<br/>

<form action="/insertOK" method="post" enctype="multipart/form-data">
<div class="table-container center"  style="width: 600px;">
	<table>
		<tr>
			<th colspan="2" style="background-color: #F66F0A; border-color:#F66F0A; color: white;">상품보기</th>
		</tr>
		
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">귤 품종</td>
			<td width="500">
				<%
				String[] category = {"제주감귤", "온주밀감", "한라봉", "천혜향", "레드향", "청견", "황금향", "카라향", "진지향","세토카","주스", "잼/청", "기타"};
				int cid = (int) request.getAttribute("cid");
				String c = category[cid];
				%>
				<%=c %>
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">제목</td>
			<td>${productVO.title}</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">이미지</td>
			<td style="text-align: right;">
				<img width="500" alt="메인 상품 이미지" src="${mainImageUrl}">
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">설명</td>
			<td>${productVO.description}</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">가격</td>
			<td> 
				<fmt:formatNumber value="${productVO.price}" pattern="#,###" var="price"/>
				${price} (원)
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">수량</td>
			<td> 
				${productVO.stock} (개)
			</td>
		</tr>
	</table>
</div>	
	
	<!-- 버튼 -->
<div style="margin: auto; justify-content: center; display: flex; text-align: center; align-items: center; align-content: center;">
	<input type="button" value="수정하기" class="btn mb-2 mt-2 btn-lg" onclick="location.href='/update/${productVO.id}'"
		style="background-color: #F89D00; width: 200px; color: white; margin: 5px"/>
	<input type="button"  value="목록보기" class="btn mt-2 mb-2 btn-lg" onclick="location.href='/sellerList'"
		style="border-color: #F89D00; width: 200px; color: #F89D00; margin: 5px"/>
	<input type="button" value="삭제하기" class="btn btn-outline-danger mb-2 mt-2 btn-lg" onclick="location.href='/delete/${productVO.id}'"
		style="width: 200px; margin: 5px;"/>
</div>
</form>
</body>
<jsp:include page="../include/footer.jsp" />
</html>