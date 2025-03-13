<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
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
	color: #ddd
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

.rate input:checked+.rate label:hover, .rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label, .rate label:hover ~
	input:checked ~ label {
	color: gold;
}
</style>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body>

	<form action="ReviewInsertOK" method="post">
		<table width="800" border="1" align="center" cellpadding="5"
			cellspacing="0">
			<tr>
				<th width="100">작성자</th>
				<td width="630"><input type="text" name="consumerId" /></td>
			</tr>
			<tr>
				<th width="100">상품번호</th>
				<td width="500"><input type="text" name="productId" /></td>
			</tr>
			<tr>
				<td width="50" align="center">평점</td>
				<td>
					<fieldset class="rate">
					
					    <input type="radio" id="rating10" name="rate" min="0" value="5" ${review.rate == 5 ? 'checked' : ''} />
					    <label for="rating10" title="5점"></label>
					
					    <input type="radio" id="rating9" name="rate" min="0" value="4.5" ${review.rate == 4.5 ? 'checked' : ''} />
					    <label class="half" for="rating9" title="4.5점"></label>
					
					    <input type="radio" id="rating8" name="rate" min="0" value="4" ${review.rate == 4 ? 'checked' : ''} />
					    <label for="rating8" title="4점"></label>
					
					    <input type="radio" id="rating7" name="rate" min="0" value="3.5" ${review.rate == 3.5 ? 'checked' : ''} />
					    <label class="half" for="rating7" title="3.5점"></label>
					
					    <input type="radio" id="rating6" name="rate" min="0" value="3" ${review.rate == 3 ? 'checked' : ''} />
					    <label for="rating6" title="3점"></label>
					
					    <input type="radio" id="rating5" name="rate" min="0" value="2.5" ${review.rate == 2.5 ? 'checked' : ''} />
					    <label class="half" for="rating5" title="2.5점"></label>
					
					    <input type="radio" id="rating4" name="rate" min="0" value="2" ${review.rate == 2 ? 'checked' : ''} />
					    <label for="rating4" title="2점"></label>
					
					    <input type="radio" id="rating3" name="rate" min="0" value="1.5" ${review.rate == 1.5 ? 'checked' : ''} />
					    <label class="half" for="rating3" title="1.5점"></label>
					
					    <input type="radio" id="rating2" name="rate" min="0" value="1" ${review.rate == 1 ? 'checked' : ''} />
					    <label for="rating2" title="1점"></label>
					
					    <input type="radio" id="rating1" name="rate" min="0" value="0.5" ${review.rate == 0.5 ? 'checked' : ''} />
					    <label class="half" for="rating1" title="0.5점"></label>
					    

					</fieldset>
				</td>
			</tr>
			<tr>
				<th width="100">내용</th>
				<td colspan="3"><textarea rows="15" name="comment"
						style="resize: none; width: 99%"></textarea></td>
			</tr>
			<tr>
				<th colspan="4"><input type="submit" value="등록하기" />
				<input type="button" value="취소하기" onclick="window.history.back();" /></th>
			</tr>
		</table>
	</form>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>