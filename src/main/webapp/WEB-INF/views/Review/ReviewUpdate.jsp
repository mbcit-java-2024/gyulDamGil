<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<style type="text/css">
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.rate {
	display: inline-block;
	border: 0;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: #ddd;
}

.rate>label:before {
	display: inline-block;
	font-size: 1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, .rate label:hover, .rate label:hover ~
	label {
	color: gold;
}

.rate input:checked+.rate label:hover, .rate input:checked ~ .rate label:hover 
	~ label, .rate label:hover ~ input:checked ~ label {
	color: gold;
}
</style>
</head>
<body>
	<c:if test="${not empty message}">
	    <script>
	        alert("${message}");
	    </script>
	</c:if>

	<form action="ReviewUpdateOK" method="post">
		<input type="hidden" name="id" value="${review.id}" />

		<table width="800" border="1" align="center" cellpadding="5"
			cellspacing="0">
			<tr>
				<th width="100">작성자</th>
				<td width="630"><input type="text" name="userId"
					value="${review.userId}" /></td>
			</tr>
			<tr>
				<th width="100">상품번호</th>
				<td width="500"><input type="text" name="productId"
					value="${review.productId}" /></td>
			</tr>
			<tr>
				<td width="50" align="center">평점</td>
				<td width="170">
					<fieldset class="rate">
						<input type="radio" id="rating10" name="rate" value="5.0">
						<label for="rating10" title="5점"></label>
						 
						<input type="radio" id="rating9" name="rate" value="4.5">
						<label class="half" for="rating9" title="4.5점"></label> 
						
						<input type="radio" id="rating8" name="rate" value="4.0">
						<label for="rating8" title="4점"></label> 
						
						<input type="radio" id="rating7" name="rate" value="3.5">
						<label class="half" for="rating7" title="3.5점"></label> 
						
						<input type="radio" id="rating6" name="rate" value="3.0"/>
						<label for="rating6" title="3점"></label> 
						
						<input type="radio" id="rating5" name="rate" value="2.5"/>
						<label class="half" for="rating5" title="2.5점"></label> 
						
						<input type="radio" id="rating4" name="rate" value="2.0"/>
						<label for="rating4" title="2점"></label>
						
						<input type="radio"	id="rating3" name="rate" value="1.5"/>
						<label class="half" for="rating3" title="1.5점"></label>
						
						<input type="radio" id="rating2" name="rate" value="1.0"/>
						<label for="rating2" title="1점"></label>
						
						<input type="radio"	id="rating1" name="rate" value="0.5"/>
						<label class="half" for="rating1" title="0.5점"></label>
						
					</fieldset>
				</td>
			</tr>
			<tr>
				<th width="100">내용</th>
				<td colspan="3"><textarea rows="15" name="comment"
						style="resize: none; width: 99%">${review.comment}</textarea></td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="hidden" name="productId" value="${productId}">
					<input type="submit" value="수정 완료" >
					<input type="button" value="취소" onclick="window.history.back();" />
				</th>
			</tr>
		</table>
	</form>

</body>
</html>