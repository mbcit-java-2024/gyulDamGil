<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 회원정보 수정</title>
<script type="text/javascript" src="/js/signIn_2.js" defer="defer"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
	crossorigin="anonymous"></script>

</head>
<body>
<c:if test="${empty sessionScope.userVO}">
	<input type="button" value="로그인" onclick="location.href='login/1'"> 
	<br/><hr/><br/>
</c:if>
<c:if test="${not empty sessionScope.userVO}">
	<c:set var="vo" value="${sessionScope.userVO }"></c:set>
	<c:set var="userType" value="${sessionScope.userType }"></c:set>
	
	<form action="/updateOK_/1" method="post" onsubmit="confirmCheck(1)">
	<table width="500" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="2">회원정보 수정</th>
			</tr>
			<tr>
				<input type="hidden" name="id" value="${vo.id}">
				<th width="150">이름</th>
				<td width="350">
					<input type="text" name="name" value="${vo.name }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th width="150">아이디</th>
				<td width="350">
					<input id="userId" type="text" name="userId" value="${vo.userId}" placeholder="아이디를 입력하세요" required="required">
					<input type="button" value="중복확인" onclick="confirmCheck(1)" required="required">
					<div id="result"></div>
				</td>
			</tr>
			<tr>
				<th width="150">기존 비밀번호</th>
				<td width="350">
					<input type="text" name="password0" value="${vo.password }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th width="150">새 비밀번호</th>
				<td width="350">
					<input type="password" name="password" placeholder="비밀번호를 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th width="150">새 비밀번호 확인</th>
				<td width="350">
					<input type="password" name="password2" placeholder="비밀번호를 한 번 더 입력하세요"
						onkeyup="return pwCh(this)" required="required">
					<div id="checkMsg"></div>
				</td>
			</tr>
			<tr>
				<th width="150">전화번호</th>
				<td width="350">
					<input type="text" name="phone" value="${vo.phone }" placeholder="'-'를 제외하고 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th width="150">이메일</th>
				<td width="350">
					<input type="email" name="email" value="${vo.email }" placeholder="email을 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th width="150">주소</th>
				<td width="350">
					<input type="text" name="address" value="${vo.address }" placeholder="주소를 입력하세요" required="required">
					<input type="text" name="detailAddress" value="${vo.detailAddress }" placeholder="상세 주소를 입력하세요 (예: 건물명, 층수, 동, 호)" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기" onclick="agreeCheck(1)">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
</form>	
</c:if> 

</body>
</html>