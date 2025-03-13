<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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

<!-- 로그인 여부 확인 -->
<c:if test="${empty sessionScope.userVO}">
	<input type="button" value="로그인" onclick="location.href='login/2'"> 
	<br/><hr/><br/>
</c:if>


<c:if test="${not empty sessionScope.userVO}">
	<c:set var="vo" value="${sessionScope.userVO }"></c:set>
	<c:set var="userType" value="${sessionScope.userType }"></c:set>
	
<form action="/updateOK_/2" method="post" onsubmit="confirmCheck(2)" class="d-flex flex-column align-items-center">
		<input type="hidden" name="id" value="${vo.id}" />
	<!--  로고 (클릭시 홈 화면으로 이동) -->
	<div class="center" style="margin-top: 5%; margin-bottom: 10px; ">
		<img src="/images/gdg/gdgLogo.png" style="width: 150px"
			onclick="location.href='/'">
	</div>
	<br/>
	
<div class="table-container center"  style="width: 600px;">
		<table>	
			<tr>
				<th colspan="3" style="background-color: #F66F0A; border-color:#F66F0A; color: white;">회원정보 수정</th>
			</tr>
			<tr>
				<td width="200" style="border-right: 1px solid #ccc;">이름</td>
				<td width="400" colspan="2">
					<input type="text" name="name" value="${vo.name }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td width="200" style="border-right: 1px solid #ccc;">아이디</td>
				<td width="300" style="border-right: none;">
					<input id="userId" type="text" name="userId" value="${vo.userId}" placeholder="아이디" required="required">
					<div id="result" style="font-size: 80%; justify-content: left; text-align: left; margin-top: 3px"></div>
				</td>
				<td width="100px">
					<input class="rounded-pill" 
					style="background-color: #F66F0A; color: white; display: right; justify-content: right; 
						font-size: 14px; padding-top: 5px; padding-bottom:5px; padding-left: 10px; padding-right: 10px" 
					type="button" value="중복확인" onclick="confirmCheck(2)" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="1" style="border-right: 1px solid #ccc;">기존 비밀번호</td>
				<td colspan="2" >
					<input type="text" name="password0" value="${vo.password }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">새 비밀번호</td>
				<td colspan="2">
					<input type="password" name="password" placeholder="새 비밀번호" required="required">
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">새 비밀번호 확인</td>
				<td colspan="2">
					<input type="password" name="password2" placeholder="새 비밀번호 확인"
						onkeyup="return pwCh(this)" required="required">
					<div id="checkMsg" style="font-size: 80%; justify-content: left; text-align: left; margin-top: 3px""></div>
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">전화번호</td>
				<td colspan="2">
					<input type="text" name="phone" value="${vo.phone }" placeholder="'-'를 제외하고 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">이메일</td>
				<td colspan="2">
					<input type="email" name="email" value="${vo.email }" placeholder="이메일" required="required">
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">사업자등록번호</td>
				<td colspan="2">
					<input type="text" name="bussinessNumber" 
						value="${vo.bussinessNumber }"
						disabled="disabled"
						maxlength="10">	
				</td>
			</tr>
			<tr>
				<td width="200" style="border-right: 1px solid #ccc;">농장이름</td>
				<td width="300" style="border-right: none;">
					<input id="farmName" type="text" 
						value="${vo.farmName }"
						name="farmName" 
						placeholder="농장이름을 입력하세요" 
						required="required">
					<div id="result2" style="font-size: 80%; justify-content: left; text-align: left; margin-top: 3px"></div>
				</td>
				<td width="100px">
				<input class="rounded-pill" 
					style="background-color: #F66F0A; color: white; display: right; justify-content: right; 
						font-size: 14px; padding-top: 5px; padding-bottom:5px; padding-left: 10px; padding-right: 10px" 
					type="button" value="중복확인" onclick="farmNameCheck()" required="required">
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">주소</td>
				<td colspan="2">
					<input type="text" name="address" value="${vo.address }" placeholder="주소" required="required">
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ccc;">상세주소</td>
				<td colspan="2">
					<input type="text" name="detailAddress" value="${vo.detailAddress }" placeholder="상세 주소 (예: 건물명, 층수, 동, 호)" required="required">
				</td>
			</tr>
		</table>
	</div>
		<!-- 버튼 -->
		<input type="reset" class="btn" value="다시쓰기"
			style="background-color: white; width: 300px; color: #ccc; text-decoration: underline; margin-top: 2%" />
	
		<input type="submit" class="btn mb-2 mt-2 btn-lg" value="수정하기"
			style="background-color: #F89D00; width: 300px; color: white;"/>
		<input type="button" class="btn mb-2 btn-lg" value="뒤로가기"
			style="border-color: #F89D00; width: 300px; color: #F89D00;" onclick="history.back()"/>
</form>	
</c:if>

</body>
<jsp:include page="../include/footer.jsp" />
</html>

