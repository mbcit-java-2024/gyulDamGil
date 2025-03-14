<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>

</head>
<body>

	<form action="QnaSMInsertOK" method="post">
		<table width="800" border="1" align="center" cellpadding="5"
			cellspacing="0" style="border-radius: 10px; overflow: hidden;">
			<tr>
				<th width="100" style="background-color: #ffcc99;">작성자</th> <!--th 색상 변경-->
				<td width="630">${sellerUserId}</td>
			</tr>
			<tr>
				<th width="100" style="background-color: #ffcc99;">제목</th> <!--th 색상 변경-->
				<td width="500"><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th width="100" style="background-color: #ffcc99;">내용</th> <!--th 색상 변경-->
				<td colspan="3"><textarea rows="15" name="comment"
						style="resize: none; width: 99%"></textarea></td>
			</tr>
			<tr>
				<th colspan="4" style="text-align: center;">
					<!-- 버튼 스타일 -->
					<input type="submit" value="등록하기" style="background-color: #ff7f00; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" />
					<input type ="hidden" name="sellerId" value="${sellerId}">
					<input type="button" value="취소하기" onclick="window.history.back();" style="background-color: #cccccc; color: black; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" />
				</th>
			</tr>
		</table>
	</form>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>