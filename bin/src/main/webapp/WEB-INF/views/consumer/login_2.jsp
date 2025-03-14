<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 대입문, 제어문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 숫자, 날짜 등 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style type="text/css">
.center {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>

	<!--  로고 (클릭시 홈 화면으로 이동) -->
	<div class="center" style="margin-top: 200px; margin-bottom: 100px">
		<img src="/images/gdg/gdgLogo.png" style="width: 150px"
			onclick="location.href='/'">
	</div>

<div class="container" style="width: 600px; margin-bottom: 200px">
	<!-- 구매자/판매자 선택 탭 -->
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link active" href="/login/1"
				style="color: #F89D00; padding-top: 20px">일반회원 로그인</a></li>
			<li class="nav-item"><a class="nav-link"
				style="color: black; padding-top: 15px; padding-bottom: 12px; background-color: #FFECD2; color: #F66F0A;"
				href="/login/2">농장 로그인</a></li>
		</ul>
	
	<!-- 로그인 박스 -->
	<div class="container border border-top-0 pb-5 rounded-bottom-1"
		style="width: 600px">
		<br />
		<form action="/loginCheck/1" method="post"
			class="needs-validation d-flex flex-column align-items-center">
			
			<!-- 아이디 -->
			<div class="form-floating mb-1 mt-2">
				<input id="id" name="userId"
					class="form-control form-control ${result == 0 ? 'is-invalid' : ''}"
					style="width: 500px;" type="text" placeholder="아이디를 입력하세요"
					required="required" value="${id}"> 
				<label for="id">아이디</label>
				<div class="invalid-feedback">
					<c:if test="${result == 0}">
						아이디를 찾을 수 없습니다. 아이디를 정확히 입력해 주세요.
					</c:if>
				</div>
			</div>
			
			<!-- 비밀번호 -->
			<div class="form-floating mt-1 mb-3">
				<input id="pw" name="password"
					class="form-control ${result == 1 ? 'is-invalid' : ''}"
					style="width: 500px;" type="password" placeholder="비밀번호를 입력하세요"
					required="required"> <label for="pw">비밀번호</label>
				<div class="invalid-feedback">
					<c:if test="${result == 1}">
						비밀번호가 잘못 되었습니다. 비밀번호를 정확히 입력해 주세요.
					</c:if>
				</div>
			</div>
			
			<!-- 로그인 버튼 -->
			<button type="submit" class="btn mb-2 mt-2 btn-lg"
				style="background-color: #F89D00; width: 300px; color: white; font-weight: bold;">로그인</button>
			<!-- 회원가입 버튼 -->
			<a href="/signIn/1" style="text-dㅁecoration: none; color: #707070;">회원가입</a>
		</form>
	</div>
	</div>
</body>

<jsp:include page="../include/footer.jsp" />

</html>