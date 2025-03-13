<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귤담길 - 상품 목록</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">

<style>
.product-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 800px;
    margin: 0 auto;
}

.product-image {
    width: 100%;
    max-width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 8px;
}

.product-details {
    width: 100%;
    text-align: center;
}
</style>

<body class="bg-white">
	<div class="min-h-screen">
		<%@include file="../include/header.jsp"%>

		<!-- Shop Section -->
		<div id="section-shop" class="container mx-auto px-4 py-8">
			<div class="flex flex-col md:flex-row gap-8">

				<%@include file="../include/menu.jsp"%>

				<!-- Products Grid -->
				<div class="flex-1">
					<div class="flex justify-between items-center mb-6">
						<h2 class="text-2xl font-bold">
						<%
							String[] category = {"제주감귤","온주밀감","한라봉", "천혜향","레드향",	"청견", "황금향", "카라향", "진지향", "세토카","주스", "잼/청", "기타"};
						int cid = (int) request.getAttribute("categoryId");
						%>
						<%=category[cid]%>
						</h2>
					</div>
					<div class="grid grid-cols-1 md:grid-cols-3 gap-6">

						<c:forEach var="vo" items="${selectJejuGamgyulList}">
						    <div class="bg-white rounded-lg shadow-md p-4">
						        <div class="h-48 bg-white rounded-lg mb-4 flex justify-center items-center overflow-hidden"
						             onclick="location.href='/jejugamgyulDetail/${vo.id }'">
						            <img class="product-image" src="${vo.mainImageUrl}" alt="상품 이미지">
						        </div>
						        <input type="hidden" name="id" value="${vo.id}">
						        <input type="hidden" name="id" value="${vo.title}">
						        <h4 class="font-semibold mb-2 text-center">
						            <a href="/jejugamgyulDetail/${vo.id}">${vo.title}</a>
						        </h4>
						        <p class="text-orange-500 font-bold mb-2 text-center">${vo.price }원</p>
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

	</div>
		<%@include file="../include/footer.jsp"%>
</body>
</html>
