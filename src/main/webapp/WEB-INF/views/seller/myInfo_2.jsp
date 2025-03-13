<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 회원정보</title>
<script type="text/javascript">
	function confirmDelete(){
		console.log("confirmDelete() 메소드 실행")
		if (confirm("정말 탈퇴하시겠습니까?")) {
           location.href = '/delete';
		}
	}
</script>
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

<c:if test="${empty sessionScope.userVO}">
	<input type="button" value="로그인" onclick="location.href='login/2'"> 
	<br/><hr/><br/>
</c:if>

<c:if test="${not empty sessionScope.userVO}">
	<c:set var="vo" value="${sessionScope.userVO }"></c:set>

	<!--  로고 (클릭시 홈 화면으로 이동) -->
	<div class="center" style="margin-top: 5%; margin-bottom: 10px; ">
		<img src="/images/gdg/gdgLogo.png" style="width: 150px"
			onclick="location.href='/'">
	</div>
	<br/>
	
<div class="table-container center"  style="width: 500px;">
	<table>	
		<tr>
			<th colspan="2" style="background-color: #F66F0A; border-color:#F66F0A; color: white;">회원정보</th>
		</tr>
		<tr>
			<td width="150" style="border-right: 1px solid #ccc;">이름</th>
			<td width="350" style="text-align: left;">
				${vo.name} 
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">아이디</td>
			<td style="text-align: left;">
				${vo.userId }
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">비밀번호</td>
			<td style="text-align: left;">
				${vo.password}
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">전화번호</td>
			<td style="text-align: left;">
				${vo.phone }
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">이메일</td>
			<td style="text-align: left;">
				${vo.email}
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">사업자등록번호</td>
			<td style="text-align: left;">
				${vo.bussinessNumber}
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">농장이름</td>
			<td style="text-align: left;">
				${vo.farmName}
			</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">주소</td>
			<td style="text-align: left;">
				${vo.address }
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">상세주소</td>
			<td style="text-align: left;">
				${vo.detailAddress }
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" class="btn" value="수정하기" onclick="location.href='/updateInfo'"
					style="background-color: #F89D00; width: 300px; color: white;  margin-top: 2%">
				<input type="button" value="회원탈퇴" onclick="confirmDelete()"
					style="background-color: white; width: 300px; color: #ccc; text-decoration: underline; margin-top: 2%">
			</td>
		</tr>
</table>
</div>	
</c:if> 

</body>
</html>