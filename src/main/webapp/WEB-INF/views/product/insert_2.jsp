<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="table-container center"  style="width: 500px;">
	<table>
		<tr>
			<th colspan="2" style="background-color: #F66F0A; border-color:#F66F0A; color: white;">상품등록</th>
		</tr>
		
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">귤 품종</td>
			<td width="500" style="text-align: left;">
				<input type="hidden" name="sellerId" value="${sessionScope.id}"/>
				<input type="hidden" name="farmName" value="${sessionScope.userVO.farmName}"/>
				<input type="radio" class="btn-check" name="categoryId" id="option0" value="0" required="required">
				<label class="btn" for="option0">제주감귤</label>
				<input type="radio" class="btn-check" name="categoryId" id="option1" value="1">
				<label class="btn" for="option1">온주밀감</label>
				<input type="radio" class="btn-check" name="categoryId" id="option2" value="2">
				<label class="btn" for="option2">한라봉</label>
				<input type="radio" class="btn-check" name="categoryId" id="option3" value="3">
				<label class="btn" for="option3">천혜향</label>
				<input type="radio" class="btn-check" name="categoryId" id="option4" value="4">
				<label class="btn" for="option4">레드향</label>
				<input type="radio" class="btn-check" name="categoryId" id="option5" value="5">
				<label class="btn" for="option5">청견</label>
				<input type="radio" class="btn-check" name="categoryId" id="option6" value="6">
				<label class="btn" for="option6">황금향</label>
				<input type="radio" class="btn-check" name="categoryId" id="option7" value="7">
				<label class="btn" for="option7">카라향</label>
				<input type="radio" class="btn-check" name="categoryId" id="option8" value="8">
				<label class="btn" for="option8">진지향</label>
				<input type="radio" class="btn-check" name="categoryId" id="option9" value="9">
				<label class="btn" for="option9">세토카</label>
				<input type="radio" class="btn-check" name="categoryId" id="option10" value="10">
				<label class="btn" for="option10">주스</label>
				<input type="radio" class="btn-check" name="categoryId" id="option11" value="11">
				<label class="btn" for="option11">잼/청</label>
				<input type="radio" class="btn-check" name="categoryId" id="option12" value="12">
				<label class="btn" for="option12">기타</label>
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">제목</td>
			<td style="text-align: left;">
				<input type="text" name="title" required="required"/>
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">이미지</td>
			<td style="text-align: left;">
			  <input class="form-control" type="file" name="mainImage" required="required">
				<c:if test="${not empty fail}">
					<span style="color: red;">${fail}</span> 
				</c:if>
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">설명</td>
			<td>
				<textarea class="form-control" rows="5" name="description" style="resize: none; width: 99%;" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">가격</td>
			<td style="text-align: left;"> 
				<div class="input-group mb-3">
				  <input type="number" class="form-control" name="price"required="required" style="width: 70%">
				  <span class="input-group-text">(원)</span>
				</div>
			</td>
		</tr>
		<tr>
			<td width="100" style="border-right: 1px solid #ccc;">수량</td>
			<td style="text-align: left;"> 
				<div class="input-group mb-3">
				  <input type="number" class="form-control" name="stock" required="required" style="width: 70%">
				  <span class="input-group-text">(개)</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label class="form-check-label" for="check">임시저장</label>
				<input id="check" class="form-check-input" type="checkbox" name="status" value="0"/>
			</td>
		</tr>
	</table>
</div>	
	
	<!-- 버튼 -->
<div style="margin: auto; justify-content: center; display: flex; text-align: center; align-items: center; align-content: center;">
	<input type="submit" class="btn mb-2 mt-2 btn-lg" value="저장하기"
			style="background-color: #F89D00; width: 200px; color: white; margin: 10px"/>
	<input type="button" class="btn mb-2 btn-lg" value="목록보기"
		style="border-color: #F89D00; width: 200px; color: #F89D00;" onclick="location.href='sellerList'"/>
</div>
</form>
</body>
<jsp:include page="../include/footer.jsp" />
</html>