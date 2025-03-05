<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 회원정보</title>
<script type="text/javascript">
	function confirmDelete(){
		console.log("confirmDelete() 메소드 실행")
		if (confirm("정말 탈퇴하시겠습니까?")) {
           location.href = '/delete';
		}
	}
</script>
</head>
<body>

<c:if test="${empty sessionScope.userVO}">
	<input type="button" value="로그인" onclick="location.href='login/1'"> 
	<br/><hr/><br/>
</c:if>
<c:if test="${not empty sessionScope.userVO}">
	<c:set var="vo" value="${sessionScope.userVO }"></c:set>
<table width="500" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="2">회원정보</th>
		</tr>
		<tr>
			<th width="150">이름</th>
			<td width="350">
				${vo.name} 
			</td>
		</tr>
		<tr>
			<th width="150">아이디</th>
			<td width="350">
				${vo.userId }
			</td>
		</tr>
		<tr>
			<th width="150">비밀번호</th>
			<td width="350">
				${vo.password}
			</td>
		</tr>
		<tr>
			<th width="150">전화번호</th>
			<td width="350">
				${vo.phone }
			</td>
		</tr>
		<tr>
			<th width="150">이메일</th>
			<td width="350">
				${vo.email}
			</td>
		</tr>
		<tr>
			<th width="150">주소</th>
			<td width="350">
				${vo.address } <br/>
				${vo.detailAddress }
			</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="수정하기" onclick="location.href='/updateInfo'">
				<input type="button" value="회원탈퇴" onclick="confirmDelete()">
				<input type="button" value="나가기" onclick="location.href='/'">
			</td>
		</tr>
</table>	
</c:if> 

</body>
</html>