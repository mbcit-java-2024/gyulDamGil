<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <jsp:include page="../include/header.jsp"/>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff2e6; /* 연한 주황색 배경 */
            padding: 20px;
            margin: 0; /* 전체 여백을 없애서 왼쪽으로 붙게 함 */
        }

        h2 {
            text-align: left; /* 제목을 왼쪽 정렬 */
            color: #ff7f00; /* 귤색으로 제목 강조 */
            font-size: 2rem; /* 제목 크기 조정 */
            font-weight: bold;
            margin-bottom: 30px;
        }

        .review-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 15px 0;
            padding: 20px;
            width: 100%; /* 왼쪽 끝으로 붙도록 크기 확장 */
            max-width: 800px;
            overflow: hidden;
            height: auto; /* 내용에 맞게 크기 조정 */
        }

        .review-container p {
            font-size: 16px;
            color: #333;
        }

        .review-container p span {
            font-weight: bold;
        }

        .rating-img {
            width: 80px; /* 크기 조정 */
        }

        .button-container {
            text-align: right;
            margin-top: 20px;
        }

        .button-container form {
            display: inline-block;
            margin: 0 5px;
        }

        .button-container button {
            background-color: #ff7f00; /* 귤색 버튼 */
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #e06c00; /* 더 진한 귤색 */
        }

        .rating-container {
            margin-top: 10px;
        }

        .review-title {
            font-size: 18px;
            color: #555;
        }

        .review-date {
            font-size: 14px;
            color: #888;
        }

        .review-content {
            font-size: 16px;
            margin-top: 10px;
        }

        .no-reviews {
            text-align: center;
            font-size: 18px;
            color: #888;
        }

        .review-item {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
    </style>
</head>
<body>

    <h2>리뷰 목록</h2>
    
    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>
    </c:if>

    <c:if test="${empty reviewList}">
        <p class="no-reviews">리뷰가 없습니다.</p>
    </c:if>

    <c:forEach var="review" items="${reviewList}">
        <div class="review-container">
            <div class="review-item">
                <p class="review-title">상품 이름: ${productName}</p>
                <p class="review-title">작성자: ${review.consumerId}</p>

                <p class="review-date">
                    날짜: 
                    <c:choose>
                        <c:when test="${not empty review.updateDate}">
                            <fmt:formatDate value="${review.updateDate}" pattern="yyyy-MM-dd HH:mm" />
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate value="${review.createDate}" pattern="yyyy/MM/dd/H:mm" />
                        </c:otherwise>
                    </c:choose>
                </p>

                <div class="rating-container">
                    <p>별점:</p>
                    <c:choose>
                        <c:when test="${review.rate == 5}">
                            <img src="images/rating/5.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 4.5}">
                            <img src="images/rating/4.5.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 4}">
                            <img src="images/rating/4.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 3.5}">
                            <img src="images/rating/3.5.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 3}">
                            <img src="images/rating/3.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 2.5}">
                            <img src="images/rating/2.5.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 2}">
                            <img src="images/rating/2.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 1.5}">
                            <img src="images/rating/1.5.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 1}">
                            <img src="images/rating/1.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 0.5}">
                            <img src="images/rating/0.5.jpg" class="rating-img">
                        </c:when>
                        <c:when test="${review.rate == 0.0}">
                            <img src="images/rating/0.0.jpg" class="rating-img">
                        </c:when>
                    </c:choose>
                </div>

                <p class="review-content">리뷰 내용: ${review.comment}</p>
                
                <div class="button-container">
                    <form action="ReviewUpdate" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="${review.id}">
                        <input type="hidden" name="productId" value="${review.productId}">
                        <input type="hidden" name="sellerId" value="${review.sellerId}">
                        <button type="submit">수정</button>
                    </form>
                    <form action="ReviewDelete" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${review.id}">
                        <input type="hidden" name="productId" value="${review.productId}">
                        <button type="submit">삭제</button>
                    </form>
                </div>
            </div>
        </div>
        <hr>
    </c:forEach>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>