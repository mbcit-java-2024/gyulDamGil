<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta charset="UTF-8">
</head>
<body>
<div
	class="w-full md:w-64 bg-white rounded-lg shadow-md p-4"
	style="
		position: sticky; 
		top: 200px; 
		height: auto;
		align-self: flex-start;">
	<h3 class="font-semibold mb-4">고객센터</h3>
	<ul class="space-y-2">
	
		<li class="pl-4"><a onclick="location.href='/faq'" class="text-gray-600 hover:text-orange-500" style="cursor: pointer">자주 묻는 질문</a></li>
		<c:if test="${sessionScope.userType == 1}">
		<li class="pl-4"><a onclick="location.href='/QnaCMList'" class="text-gray-600 hover:text-orange-500" style="cursor: pointer">사이트 문의</a></li>
		<li class="pl-4"><a onclick="location.href='/QnaCSList'" class="text-gray-600 hover:text-orange-500" style="cursor: pointer">농장 문의</a></li>
		</c:if>
		<c:if test="${sessionScope.userType == 2}">
		<li class="pl-4"><a onclick="location.href='/QnaSMList'" class="text-gray-600 hover:text-orange-500" style="cursor: pointer">사이트 문의</a></li>
		<li class="pl-4"><a onclick="location.href='/QnaCSList'" class="text-gray-600 hover:text-orange-500" style="cursor: pointer">내 고객 문의</a></li>
		</c:if>
	</ul>
</div>


</body>