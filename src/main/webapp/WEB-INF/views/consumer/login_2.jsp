<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 대입문, 제어문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자, 날짜 등 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
   	.center {
  		display: flex;
  		justify-content: center;
  	}
  	
  </style>
</head>
<body>

<div class="center" style="margin-top: 300px">
<img src="/images/gdg/gdgLogo.png" style="width: 150px">
</div>

<input type="button" value="구매자 로그인" onclick="location.href='/login/1'" disabled="disabled">
<input type="button" value="판매자 로그인" onclick="location.href='/login/2'">
<br/>
<hr/>

<div class="container mt-3" style="width: 600px">
  <form action="/loginCheck/1" method="post" >
    <div class="form-floating mb-2 mt-2" >
		<input id="id" name="userId" class="form-control" type="text" placeholder="아이디를 입력하세요" required="required">
      <label for="id">아이디</label>
    </div>
	<c:if test="${result == 0}">
	<div class="invalid-feedback">
		아이디 또는 비밀번호가 잘못 되었습니다. <br/> 
		아이디와 비밀번호를 정확히 입력해 주세요.
	</div>
	</c:if>
    <div class="form-floating mt-3 mb-3">
		<input id="pw" name="password" class="form-control" type="password" placeholder="비밀번호를 입력하세요" required="required">
      <label for="pw">비밀번호</label>
    </div>
	<c:if test="${result == 1}">
	<div class="invalid-feedback">
		비밀번호가 잘못 되었습니다. 비밀번호를 정확히 입력해 주세요.
	</div>
	</c:if>
    <button type="submit" class="btn mb-2" style="background-color: #F89D00; width: 300px; color: white; font-weight: bold;">로그인</button>
    <button type="button" class="btn" style="border-color: #F89D00; width: 300px; color: #F89D00; font-weight: bold;" onclick="location.href='/signIn/1'">회원가입</button>
  </form>
</div>



</body>
</html>