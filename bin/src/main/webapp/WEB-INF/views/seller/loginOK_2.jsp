<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 대입문, 제어문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자, 날짜 등 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 로그인 완료</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap icon CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<fmt:requestEncoding value="UTF-8" />

<% 
	int userType = (int) session.getAttribute("userType");
	int id = (int) session.getAttribute("id");
	Object vo = session.getAttribute("userVO");
%>

<h4>consumer/loginOK_2</h4>
<h4>로그인이 완료되었습니다.</h4>
<hr/>
userType: 
<c:if test="${userType == 1}" >consumer <br/></c:if> 
<c:if test="${userType == 2}" >seller <br/></c:if> 
id: ${id} <br/>
userId: <br/>
userId: ${sessionScope.userVO.userId} <br/>
vo:<%=session.getAttribute("userVO").toString()%>

<%-- <c:if test="<%= session.getAttribute("id") == null %>">
<button onclick="location.href='/login/2'">로그인하러 가기</button>
</c:if>
<c:if test="<%= session.getAttribute("id") != null %>">
<button onclick="location.href='/logout'">로그아웃</button>
</c:if> --%>
<br/>


</body>
</html>