<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <style>
    
    	.center {
    		display: flex;
    		justify-content: center;
    	}
        .product-list {
            list-style-type: none;
            display: inline-block;
        }
        .product-item {
            display: flex;
            padding: 10px;
            border-bottom: 1px solid #ccc;
            justify-content: space-between;
        }
        .product-item span {
            margin-right: 10px;
        }
        .product-item a {
            text-decoration: none;
            color: black;
        }
        .product-item .category {
            flex: 1;
        }
        .product-item .price {
            width: 120px;
            text-align: right;
        }
        .product-item .date {
            width: 160px;
            text-align: right;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <jsp:include page="../include/header.jsp"/>
</head>
<body>

    <h2 class="center">검색 결과</h2>
	<div class="center">

    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>
    </c:if>

    <div>
        <form action="searchOK" method="get">
            <input type="text" name="title" placeholder="상품명 검색">
            <button type="submit">검색</button>
        </form>
    </div>

    <br /><br />
    </div>

	<div class="center">
    <c:if test="${empty searchResults}">
        <div style="text-align: center;">검색 결과가 없습니다.</div>
    </c:if>
    <c:if test="${not empty searchResults}">
	    <ul class="product-list">
	            <c:forEach var="product" items="${searchResults}" >
	                <li class="product-item">
	                    <span><img src="${product.mainImageUrl}" alt="상품 이미지" width="200"></span>
	                    <span class="category">쇼핑 >
	                        <c:choose>
	                            <c:when test="${product.categoryId == 0}">
	                                과일 > 제주감귤
	                            </c:when>
	                            <c:when test="${product.categoryId == 1}">
	                                과일 > 온주밀감
	                            </c:when>
	                            <c:when test="${product.categoryId == 2}">
	                                과일 > 한라봉
	                            </c:when>
	                            <c:when test="${product.categoryId == 3}">
	                                과일 > 천혜향
	                            </c:when>
	                            <c:when test="${product.categoryId == 4}">
	                                과일 > 레드향
	                            </c:when>
	                            <c:when test="${product.categoryId == 5}">
	                                과일 > 청견
	                            </c:when>
	                            <c:when test="${product.categoryId == 6}">
	                                과일 > 황금향
	                            </c:when>
	                            <c:when test="${product.categoryId == 7}">
	                                과일 > 카라향
	                            </c:when>
	                            <c:when test="${product.categoryId == 8}">
	                                과일 > 진지향
	                            </c:when>
	                            <c:when test="${product.categoryId == 9}">
	                                과일 > 세토카
	                            </c:when>
	                            <c:when test="${product.categoryId == 10}">
	                                식품 > 주스
	                            </c:when>
	                            <c:when test="${product.categoryId == 11}">
	                                식품 > 잼
	                            </c:when>
	                            <c:when test="${product.categoryId == 12}">
	                                식품 > 기타
	                            </c:when>
	                        </c:choose>
	                    </span>
	                    <span>
	                        <a href="jejugamgyulDetail/${product.id}">
	                            ${product.title}
	                        </a>
	                    </span>
	                    <span class="date">
	                        <fmt:formatDate value="${product.createDate}" pattern="yyyy-MM-dd HH:mm" />
	                    </span>
	                    <span class="price">${product.price}원</span>
	                </li>
	            </c:forEach>
	        </ul>
	    </c:if>

		</div>				
</body>
<jsp:include page="../include/footer.jsp"/>
</html>
<%-- 
    	<div class="grid grid-cols-1 md:grid-cols-3 gap-6">

			<c:forEach var="product" items="${searchResults}">
			    <div class="bg-white rounded-lg shadow-md p-4">
			        <div class="h-48 bg-gray-200 rounded-lg mb-4"
			             onclick="location.href='/jejugamgyulDetail/${product.id}'">
			            <img src="${vo.mainImageUrl}" alt="상품 이미지">
			        </div>
			        <input type="hidden" name="id" value="${product.id}">
			        <h4 class="font-semibold mb-2">
			            <a href="/jejugamgyulDetail/${vo.id}">${product.title}</a>
			        </h4>
			        <p class="price">${product.price}원</p>
			        
			        <button
			        	class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600"
			            onclick="location.href='/jejugamgyulDetail/${product.id}'">
			            상세 보기
			        </button>
			    </div>
			</c:forEach>
		</div>
	 --%>