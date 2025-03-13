<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body>

	<form action="QnaCSInsertOK" method="post">
		<table width="800" border="1" align="center" cellpadding="5"
			cellspacing="0">
			<tr>
				<th width="100">작성자</th>
				<td width="630">${consumerUserId}</td>
			</tr>
			<tr>
				<th width="100">판매자</th>
				<td width="500">${farmName}</td>
			</tr>
			<tr>
				<th width="100">제목</th>
				<td width="500"><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th width="100">내용</th>
				<td colspan="3"><textarea rows="15" name="comment"
						style="resize: none; width: 99%"></textarea></td>
			</tr>
			<tr>
				<th colspan="4"><input type="submit" value="등록하기" />
				<input type="hidden" name="consumerId" value="${consumerId}">
				<input type="button" value="취소하기" onclick="window.history.back();" /></th>
			</tr>
		</table>
	</form>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>