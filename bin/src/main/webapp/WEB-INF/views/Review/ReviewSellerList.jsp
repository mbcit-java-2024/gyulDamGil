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

	        <p>별점:
	        </p>
    <h2>리뷰 목록</h2>
    <hr>
   <p> 판매자 전체 평점 :
		<c:choose>
    <c:when test="${averageRating >= 4.7}">
	        <img src="images/rating/5.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 4.3 && averageRating < 4.7}">
	        <img src="images/rating/4.5.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 3.9 && averageRating < 4.3}">
	        <img src="images/rating/4.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 3.5 && averageRating < 3.9}">
	        <img src="images/rating/3.5.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 3.0 && averageRating < 3.5}">
	        <img src="images/rating/3.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 2.5 && averageRating < 3.0}">
	        <img src="images/rating/2.5.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 2.0 && averageRating < 2.5}">
	        <img src="images/rating/2.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 1.5 && averageRating < 2.0}">
	        <img src="images/rating/1.5.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 1.0 && averageRating < 1.5}">
	        <img src="images/rating/1.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 0.5 && averageRating < 1.0}">
	        <img src="images/rating/0.5.jpg" width="90" >
	    </c:when>
	    <c:when test="${averageRating >= 0.0 && averageRating < 0.5}">
	        <img src="images/rating/0.0.jpg" width="90" >
	    </c:when>
	</c:choose>
   		 ${averageRating}
   	</p>
    
    <hr>
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
	        <p>작성자: ${review.userId}</p>
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
	                    <img src="images/5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 4.5}">
	                    <img src="images/4.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 4}">
	                    <img src="images/4.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 3.5}">
	                    <img src="images/3.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 3}">
	                    <img src="images/3.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 2.5}">
	                    <img src="images/2.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 2}">
	                    <img src="images/2.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 1.5}">
	                    <img src="images/1.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 1}">
	                    <img src="images/1.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 0.5}">
	                    <img src="images/0.5.jpg" width="90" >
	                </c:when>
	                <c:when test="${review.rate == 0.0}">
	                    <img src="images/0.0.jpg" width="90" >
	                </c:when>
				</c:choose>
	        </p>
	        
	        <p>리뷰 내용: ${review.comment}</p>
			
        <hr>
    </c:forEach>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>