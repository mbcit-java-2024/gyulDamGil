<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- js -->
<script type="text/javascript" src="/js/signIn_2.js" defer="defer"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
	crossorigin="anonymous"></script>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
    	/* justify-content: center; */
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
</head>

<body>

	<!--  로고 (클릭시 홈 화면으로 이동) -->
	<div class="center" style="margin-top: 10%; margin-bottom: 10px; ">
		<img src="/images/gdg/gdgLogo.png" style="width: 150px"
			onclick="location.href='/'">
	</div>
	<br/>
	
<form action="/consumerSignIn" method="post" onsubmit="return subCheck1();" 
		class="needs-validation d-flex flex-column align-items-center">
		
	<div class="table-container center"  style="width: 500px;">
		<table>
			<!-- 아이디 -->
			<tr >
				<td width="50px" height="50px;" style="border-right: none; padding: 5px;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person" viewBox="-2 0 17 17">
				  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
				</svg>
				</td>
				<td width="350px" style="border-right: none;">
				<input id="userId" type="text" name="userId" placeholder="아이디" 
					required="required">
				<div id="result" style="font-size: 80%; justify-content: left; text-align: left; margin-top: 3px"></div>
				</td>
				<td width="100px">
				<input class="rounded-pill" 
					style="background-color: #F66F0A; color: white; display: right; justify-content: right; 
						font-size: 14px; padding-top: 5px; padding-bottom:5px; padding-left: 10px; padding-right: 10px" 
					type="button" value="중복확인" onclick="confirmCheck(1)" required="required">
				</td>
			</tr>
			<!-- 비밀번호 -->
			<tr>
				<td style="border-right: none;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-lock" viewBox="-3 0 19 19">
				  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
				</svg>
				</td>
				<td colspan="2">
					<input type="password" name="password" placeholder="비밀번호" required="required">
				</td>
			</tr>
			<!-- 비밀번호 확인 -->
			<tr>
				<td style="border-right: none;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-lock" viewBox="-3 0 19 19">
				   <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
				</svg>
				</td>
				<td colspan="2">
					<input type="password" name="password2" placeholder="비밀번호 확인"
						class="is-invalid"  onkeyup="return pwCh(this)" required="required">
					<div id="checkMsg" style="font-size: 80%; justify-content: left; text-align: left; margin-top: 3px""></div>
				</td>
			</tr>
			<!--  이메일 --> 
			<tr style="border-bottom: 0px;">
				<td style="border-right: none;">
					<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-envelope" viewBox="-4 0 20 20">
					  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"/>
					</svg>
				</td>
				<td>
					<input type="email" name="email" placeholder="이메일" required="required">
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<div class="table-container center"  style="width: 500px;">
		<table>
			<!-- 이름 -->
			<tr>
				<td width="50px" height="50px;" style="border-right: none; padding: 5px;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person" viewBox="-2 0 17 17">
				  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
				</svg>
				</td>
				<td width="450px" style="border-right: none;">
						<input type="text" name="name" placeholder="이름" required="required">
				</td>
			</tr>
			<!-- 전화번호 -->
			<tr>
				<td style="border-right: none;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-phone" viewBox="-1 0 16 16">
				  <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
				  <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
				</svg>
				</td>
				<td colspan="2">
					<input type="text" name="phone" placeholder="전화번호 '-'를 제외하고 입력하세요" required="required">
				</td>
			</tr>
			<!-- 주소 -->
			<tr>
				<td style="border-right: none;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-house" viewBox="-2 0 18 18">
				  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
				</svg>
				</td>
				<td colspan="2">
					<input type="text" name="address" placeholder="주소" required="required">
				</td>
			</tr>
			<!--  상세주소 --> 
			<tr style="border-bottom: 0px">
				<td style="border-right: none;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-house-add" viewBox="-2 0 18 18">
				  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
				  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5"/>
				</svg>
				</td>
				<td>
					<input type="text" name="detailAddress" placeholder="상세 주소 (예: 건물명, 층수, 동, 호)" required="required">
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<!-- 개인정보 이용동의 -->
	<div class="table-container center"  style="width: 500px;">
		<table>
		<tr style="border-bottom: 0px">
			<td> 
				개인정보 이용 동의 <br/>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" id="yes" name="agree" value="yes" onclick="agreeCheck(1)">
				  <label class="form-check-label" for="yes">동의함</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" id="no" checked="checked" name="agree" value="no" onclick="agreeCheck(2)">
				  <label class="form-check-label" for="no">동의하지 않음</label>
				</div>
			</td>
		</tr>
		</table>
	</div>
	<!-- 버튼 -->
	<input type="reset" class="btn" value="다시쓰기"
		style="background-color: white; width: 300px; color: #ccc; text-decoration: underline; margin-top: 2%" />
	<input type="submit" class="btn mb-2 mt-2 btn-lg" value="회원가입"
		style="background-color: #F89D00; width: 300px; color: white;" />
</form>

</body>
<jsp:include page="../include/footer.jsp" />

</html>