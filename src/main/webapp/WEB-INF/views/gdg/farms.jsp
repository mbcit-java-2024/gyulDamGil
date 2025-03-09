<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귤담길 - 입점농가</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body>

	<!-- Farms Section -->
	<div id="section-farms" class="container mx-auto px-4 py-8">
		<h2 class="text-3xl font-bold mb-8">입점 농가 소개</h2>
		<div class="grid grid-cols-1 md:grid-cols-3 gap-8">
			<!-- Farm Card -->
			<c:forEach var="vo" items="${farmList}" varStatus="vs">
			
				<div class="bg-white rounded-lg shadow-md overflow-hidden" style="border-top: 1px solid orange;">
					<div class="p-6">
						<h3 class="font-semibold mb-2">${vo.farmName}</h3>
						<p class="text-gray-600 mb-4">${vo.address} ${vo.detailAddress}</p>
						<div class="flex justify-between items-center">
							<span class="text-sm text-gray-500">리뷰 ${vo.reviewCount}개</span>
							<button 
								class="text-orange-500 hover:text-orange-600"
								onclick="location.href='/farmDetail/${vo.id}'">
								자세히 보기 →
							</button>
						</div>
					</div>
				</div>
				
			</c:forEach>
		</div>
	</div>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>