<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>귤담길 - 소개</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body>
	<div id="section-about" class="container mx-auto px-4 py-8">
		<div class="max-w-4xl mx-auto">
			<h2 class="text-3xl font-bold mb-8">귤담길 소개</h2>
			<div class="prose max-w-none">
				<h3 class="text-xl font-semibold mb-4">귤담길 이야기</h3>
				<p class="mb-6">제주의 청정 자연에서 정성껏 키운 감귤을 소비자에게 직접 전달합니다.</p>
				<h3 class="text-xl font-semibold mb-4">귤 품종 소개</h3>
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
					<div class="bg-white p-6 rounded-lg shadow">
						<h4 class="font-semibold mb-2">온주밀감</h4>
						<p>제주를 대표하는 감귤 품종으로 새콤달콤한 맛이 특징입니다.</p>
					</div>
					<div class="bg-white p-6 rounded-lg shadow">
						<h4 class="font-semibold mb-2">한라봉</h4>
						<p>달콤한 과즙이 풍부하며 특유의 향이 매력적인 만감류입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>