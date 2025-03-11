<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>    
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>귤담길 - 홈</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>  
</head>
<body>
	<div id="section-home" class="container mx-auto px-4 py-8">
		<section class="bg-orange-100 rounded-xl p-8 mb-8">
			<h2 class="text-4xl font-bold mb-4">
				제주 농가와 함께하는<br>신선한 귤 직거래
			</h2>
			<p class="text-lg mb-8">맛있는 제주 귤을 직접 만나보세요</p>
			<button
				class="bg-orange-500 text-white px-6 py-3 rounded-lg hover:bg-orange-600 transition-colors">
				지금 구매하기
			</button>
		</section>
		
		<section class="mb-12">
			<h3 class="text-2xl font-bold mb-6">인기 상품</h3>
			<div class="grid grid-cols-1 md:grid-cols-4 gap-6">
				<div class="bg-white rounded-lg shadow-md p-4">
					<div class="h-48 bg-gray-200 rounded-lg mb-4"></div>
					<h4 class="font-semibold mb-2">제주 노지 감귤</h4>
					<p class="text-orange-500 font-bold">15,000원</p>
				</div>
			</div>
		</section>
	</div>
	
</body>
<jsp:include page="../include/footer.jsp"/>
</html>