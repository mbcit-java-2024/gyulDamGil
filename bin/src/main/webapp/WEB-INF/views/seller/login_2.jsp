<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 대입문, 제어문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자, 날짜 등 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 로그인</title>
</head>
<body>

<h4>/seller/login_2.jsp</h4>

<input type="button" value="구매자 로그인" onclick="location.href='/login/1'" >
<input type="button" value="판매자 로그인" onclick="location.href='/login/2'"disabled="disabled">
<br/>
<hr/>
<form action="/loginCheck/2" method="post">
	<input name="userId" type="text" placeholder="아이디를 입력하세요">
	<br/>
	<input name="password" type="password" placeholder="비밀번호를 입력하세요">
	<br/>
	<c:if test="${result == 0}">
	<span style="color: red;"> 아이디 또는 비밀번호가 잘못 되었습니다. <br/> 
	아이디와 비밀번호를 정확히 입력해 주세요.</span>
	</c:if>
	<c:if test="${result == 1}">
	<span style="color: red;"> 비밀번호가 잘못 되었습니다. <br/> 
	비밀번호를 정확히 입력해 주세요.</span>
	</c:if>
	<br/>
	<button type="submit">로그인</button>
	<button type="button" onclick="location.href='/signIn/2'">회원가입</button>
</form>

</body>
</html>