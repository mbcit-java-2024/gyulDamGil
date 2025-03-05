<%@page import="com.gdg.gyulDamGil.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귤담길 - 주문 목록</title>
<script src="/resources/js/pdateStatus.js" defer></script>
</head>
<body>
<%
	out.println(request.getParameter("id"));
	//OrderDAO.updateStatus(request.getParameter("id"));
%>

</body>
</html>