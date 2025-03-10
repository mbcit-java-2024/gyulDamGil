<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>즐겨찾기</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
        }
        .input-box {
            width: 100%;
            max-width: 300px;
            background: #f8f9fa;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
        }
        .description-box {
            width: 100%;
            max-width: 300px;
            background: #fff5e1;
            padding: 10px;
            border-radius: 8px;
            text-align: left;
            font-size: 14px;
            color: #555;
            overflow-wrap: break-word;
        }
    </style>
</head>
<body class="bg-gray-50">
    <div class="min-h-screen">
        <%@include file="../include/header.jsp"%>

        <!-- Favorite Section -->
        <div id="section-favorites" class="container mx-auto px-6 py-12">
            <div class="flex flex-col md:flex-row gap-8">

                <%@include file="../include/menu.jsp"%>

                <!-- Favorites Grid -->
                <div class="flex-1">
                    <div class="flex justify-center items-center mb-8">
                        <h2 class="text-3xl font-bold text-gray-800">⭐ 즐겨찾기한 목록 ⭐</h2>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
                        <c:forEach var="fav" items="${selectBookMarkList}">

                            <!-- 상품 정보 카드 (productId가 존재할 때) -->
                            <c:if test="${not empty fav.productId and fav.productId ne 0}">
                                <div class="bg-white rounded-2xl shadow-lg p-5 hover:shadow-xl transition duration-300 text-center">
                                    <div class="relative h-52 bg-gray-200 cursor-pointer rounded-lg overflow-hidden"
                                         onclick="location.href='/jejugamgyulDetail/${fav.productId }'"> 
                                        <img src="${fav.mainImageUrl}" alt="상품 이미지" class="w-full h-full object-cover">
                                    </div>

                                    <div class="mt-4 flex flex-col items-center space-y-3">
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-gray-700 text-center font-semibold"
                                                   value="📌 상품명: ${fav.title}">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-orange-500 text-center font-semibold"
                                                   value="💰 가격: ${fav.price}원">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-blue-500 text-center font-semibold"
                                                   value="📦 재고: ${fav.stock}">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-green-500 text-center font-semibold"
                                                   value="🏡 농장명: ${fav.farmName}">
                                        </div>
                                        <div class="description-box">
                                            <p class="font-semibold text-gray-800">📖 상품 설명</p>
                                            <p>${fav.description}</p>
                                        </div>

                                        <button class="w-full bg-orange-500 text-white py-2 rounded-lg mt-4 hover:bg-orange-600 transition font-bold"
                                            onclick="location.href='/bookMarkProductDelete/${fav.id}'">
                                            🗑 즐겨찾기 해제
                                        </button>
                                    </div>
                                </div>
                            </c:if>

                            <!-- 판매자 정보 카드 (productId가 없을 때) -->
                            <c:if test="${empty fav.productId or fav.productId eq 0}">
                                <div class="bg-white rounded-2xl shadow-lg p-5 hover:shadow-xl transition duration-300 text-center">
                                    <h5 class="text-lg font-bold text-gray-900 mb-3">🛒 판매자 정보</h5>
                                    <div class="mt-4 flex flex-col items-center space-y-3">
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-gray-700 text-center"
                                                   value="🆔 판매자 ID: ${fav.userId}">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-gray-700 text-center"
                                                   value="👤 이름: ${fav.name}">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-gray-700 text-center"
                                                   value="📧 이메일: ${fav.email}">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-gray-700 text-center"
                                                   value="📞 전화번호: ${fav.phone}">
                                        </div>
                                        <div class="input-box">
                                            <input type="text" readonly class="w-full bg-transparent text-gray-700 text-center"
                                                   value="📍 주소: ${fav.address}, ${fav.detailAddress}">
                                        </div>

                                        <button class="w-full bg-orange-500 text-white py-2 rounded-lg mt-4 hover:bg-orange-600 transition font-bold"
                                            onclick="location.href='/bookMarkFarmDelete/${fav.sellerId}'">
                                            🗑 즐겨찾기 해제
                                        </button>
                                    </div>
                                </div>
                            </c:if>

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="../include/footer.jsp"%>
    </div>
</body>
</html>
