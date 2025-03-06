<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0204)file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html -->
<!-- <html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제주귤마을</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">

<body class="bg-gray-50">
	<div class="min-h-screen">
		<%@include file="../include/header.jsp"%>

		<!-- Shop Section -->
		<div id="section-shop" class="container mx-auto px-4 py-8">
			<div class="flex flex-col md:flex-row gap-8">

				<%@include file="../include/menu.jsp"%>

				<!-- Products Grid -->
				<div class="flex-1">
					<div class="flex justify-between items-center mb-6">
						<h2 class="text-2xl font-bold">전체 상품</h2>
						<select class="border rounded-lg px-4 py-2">
							<option>최신순</option>
							<option>인기순</option>
							<option>가격 낮은순</option>
							<option>가격 높은순</option>
						</select>
					</div>
					<div class="grid grid-cols-1 md:grid-cols-3 gap-6">

						<c:forEach var="vo" items="${selectJejuGamgyulList}">
						    <div class="bg-white rounded-lg shadow-md p-4">
						        <div class="h-48 bg-gray-200 rounded-lg mb-4"
						             onclick="location.href='/jejugamgyulDetail/${vo.id }'">
						            <img src="${vo.mainImageUrl}" alt="상품 이미지">
						        </div>
						        <input type="hidden" name="id" value="${vo.id}">
						        <h4 class="font-semibold mb-2">
						            <a href="/jejugamgyulDetail/${vo.id}">${vo.title}</a>
						        </h4>
						        <p class="text-orange-500 font-bold mb-2">${vo.price }원</p>
						        <%-- <p class="text-orange-500 font-bold mb-2">${vo.description }</p> --%>
						        <%-- <p class="text-orange-500 font-bold mb-2">재고 : ${vo.stock}개</p> --%>
						        <%-- <p class="text-orange-500 font-bold mb-2">${vo.farmName }</p> --%>
						        <button
						        	class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600"
						            onclick="location.href='/jejugamgyulDetail/${vo.id}'">
						            상세 보기
						        </button>
						    </div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../include/footer.jsp"%>

	</div>

</body>
</html>