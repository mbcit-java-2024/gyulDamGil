<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>즐겨찾기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
</head>
<body class="bg-gray-50">
    <div class="min-h-screen">
        <%@include file="../include/header.jsp"%>

        <!-- Favorite Section -->
        <div id="section-favorites" class="container mx-auto px-4 py-8">
            <div class="flex flex-col md:flex-row gap-8">

                <%@include file="../include/menu.jsp"%>

                <!-- Favorites Grid -->
                <div class="flex-1">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold">즐겨찾기한 상품</h2>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <c:forEach var="fav" items="${favoriteList}">
                            <div class="bg-white rounded-lg shadow-md p-4">
                                <div class="h-48 bg-gray-200 rounded-lg mb-4"
                                     onclick="location.href='/jejugamgyulDetail/${fav.id }'">
                                    <img src="images/${fav.mainImageUrl }" alt="상품 이미지">
                                </div>
                                <h4 class="font-semibold mb-2">
                                    <a href="/jejugamgyulDetail/${fav.id }">${fav.title }</a>
                                </h4>
                                <p class="text-orange-500 font-bold mb-2">${fav.price }원</p>
                                <button class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600"
                                        onclick="location.href='/jejugamgyulDetail/${fav.id}'">
                                    상세 보기
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${empty favoriteList}">
                        <p class="text-center text-gray-500">즐겨찾기한 상품이 없습니다.</p>
                    </c:if>
                </div>
            </div>
        </div>
        
        <%@include file="../include/footer.jsp"%>
    </div>
</body>
</html>
