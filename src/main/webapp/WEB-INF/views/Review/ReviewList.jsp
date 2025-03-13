<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <jsp:include page="../include/header.jsp"/>
</head>
<body>

    <h2>리뷰 목록</h2>
    
    <c:if test="${not empty message}">
	    <script>
	        alert("${message}");
	    </script>
	</c:if>

    <c:if test="${empty reviewList}">
        <p>리뷰가 없습니다.</p>
    </c:if>

    <c:forEach var="review" items="${reviewList}">
	    <div class="review-container">
	        <p>상품 이름: ${review.productId}</p>
	        <p>작성자: ${review.consumerId}</p>
	        <p>날짜:
	        	<c:choose>
			        <c:when test="${not empty review.updateDate}">
			            ${review.updateDate}
			        </c:when>
			        <c:otherwise>
			            ${review.createDate}
			        </c:otherwise>
    			</c:choose>
	        </p>
	        <p>별점:
	            <c:choose>
	                <c:when test="${review.rate == 5}">
	                    <img src="images/rating/5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 4.5}">
	                    <img src="images/rating/4.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 4}">
	                    <img src="images/rating/4.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 3.5}">
	                    <img src="images/rating/3.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 3}">
	                    <img src="images/rating/3.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 2.5}">
	                    <img src="images/rating/2.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 2}">
	                    <img src="images/rating/2.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 1.5}">
	                    <img src="images/rating/1.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 1}">
	                    <img src="images/rating/1.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 0.5}">
	                    <img src="images/rating/0.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 0.0}">
	                    <img src="images/rating/0.0.jpg" width="90" >
	                </c:when>
				</c:choose>
	        </p>
	        
	        <p>리뷰 내용: ${review.comment}</p>
			    
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
        <hr>
    </c:forEach>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>