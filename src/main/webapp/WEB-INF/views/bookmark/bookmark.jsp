<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>귤담길 - 즐겨찾기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
        }
        .favorite-card {
            width: 100%;
            max-width: 280px;
            background: #fff;
            padding: 16px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .favorite-card:hover {
            transform: scale(1.03);
        }
        .image-container {
            width: 100%;
            height: 200px;
            border-radius: 8px;
            overflow: hidden;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .seller-info p {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 12px 0;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }
        .seller-info p:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body class="bg-white">
    <div class="min-h-screen">
        <%@include file="../include/header.jsp"%>

        <!-- Favorite Section -->
        <div id="section-favorites" class="container mx-auto px-6 py-12">
            <div class="flex flex-col md:flex-row gap-8">


                <!-- Favorites Grid -->
                <div class="flex-1">
                    <div class="flex justify-center items-center mb-8">
                    <br /><br /><br />
                        <h2 class="text-3xl font-bold text-gray-800">⭐ 즐겨찾기한 목록 ⭐</h2>
                    </div>
					<div style="margin-left: 30px;">
	                    <h2 style="font-size: 20px; font-weight: bold;">상품 즐겨찾기</h2><br /><br />
	                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4" style="display: flex;">
	                        <c:forEach var="fav" items="${selectBookMarkList}">
	                            <!-- 상품 정보 카드 (productId가 존재할 때) -->
	                            <c:if test="${not empty fav.productId and fav.productId ne 0}">
	                                <div class="favorite-card" style="margin-right: 15px; width: 280px;">
	                                    <div class="image-container" onclick="location.href='/jejugamgyulDetail/${fav.productId }'"> 
	                                        <img src="${fav.mainImageUrl}" alt="상품 이미지">
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4 class="font-semibold text-gray-900">📌 ${fav.title}</h4>
	                                        <p class="text-orange-500 font-bold">💰 ${fav.price}원</p>
	                                        <p class="text-blue-500 font-semibold">📦 재고: ${fav.stock}</p>
	                                        <p class="text-green-500 font-semibold">🏡 농장명: ${fav.farmName}</p>
	                                        <button class="w-full bg-orange-500 text-white py-2 rounded-lg mt-4 hover:bg-orange-600 transition font-bold"
	                                            onclick="location.href='/bookMarkProductDelete/${fav.id}'">
	                                            🗑 즐겨찾기 해제
	                                        </button>
	                                    </div>
	                                </div>
	                            </c:if>
	                        </c:forEach>
	                    </div>
						<h2 style="font-size: 20px; font-weight: bold; margin-top: 80px;">농가 즐겨찾기</h2><br />
	                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4" style="display: flex;">
							<c:forEach var="fav" items="${selectBookMarkList}">
	                            <!-- 판매자 정보 카드 (productId가 없을 때) -->
	                            <c:if test="${empty fav.productId or fav.productId eq 0}">
	                                <div class="favorite-card" style="margin-right: 15px; width: 280px;">
	                                    <h5 class="text-lg font-bold text-gray-900 mb-3">🛒 판매자 정보</h5>
	                                    <div class="seller-info">
	                                        <p>🆔 판매자 ID: ${fav.userId}</p>
	                                        <p>👤 이름: ${fav.name}</p>
	                                        <p>📧 이메일: ${fav.email}</p>
	                                        <p>📞 전화번호: ${fav.phone}</p>
	                                        <p>📍 주소: ${fav.address}, ${fav.detailAddress}</p>
	                                    </div>
	                                    <button class="w-full bg-orange-500 text-white py-2 rounded-lg mt-4 hover:bg-orange-600 transition font-bold"
	                                        onclick="location.href='/bookMarkFarmDelete/${fav.sellerId}'">
	                                        🗑 즐겨찾기 해제
	                                    </button>
	                                </div>
	                            </c:if>
	                        </c:forEach>
	                    </div>
	                </div>
                </div>
            </div>
        </div>
        
    </div>
        <%@include file="../include/footer.jsp"%>
</body>
</html>
