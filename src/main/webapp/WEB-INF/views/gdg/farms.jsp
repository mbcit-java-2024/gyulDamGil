<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="bg-white rounded-lg shadow-md overflow-hidden">
				<div class="h-48 bg-gray-200"></div>
				<div class="p-6">
					<h3 class="font-semibold mb-2">한라농원</h3>
					<p class="text-gray-600 mb-4">3대째 이어오는 제주 감귤 농장입니다.</p>
					<div class="flex justify-between items-center">
						<span class="text-sm text-gray-500">제주시 한림읍</span>
						<button class="text-orange-500 hover:text-orange-600">자세히
							보기 →</button>
					</div>
				</div>
			</div>
			<!-- More farm cards... -->
		</div>
	</div>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>