<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귤담길 - 농장 상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/style.css">

<style>
.button-group {
    display: flex;
    align-items: center;
    gap: 10px;
    padding-left: 240px;
}

.common-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    padding: 8px 15px;
    font-size: 0.9rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    text-align: center;
}

.common-btn i {
    font-size: 1rem;
}
.inquiry-form {
    display: inline-block; /* 폼을 인라인 요소처럼 배치하여 버튼이 옆으로 정렬되도록 함 */
}


.inquiry-btn {
    background-color: #007bff;
    color: white;
}

.inquiry-btn:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}
.seller-container {
	display: flex;
	align-items: center;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	margin: auto;
}

.seller-image img {
	width: 120px;
	height: 120px;
	border-radius: 10px;
	object-fit: cover;
	margin-right: 20px;
}

.seller-details {
	flex: 1;
}

.seller-details h2 {
	font-size: 1.5rem;
	margin-bottom: 10px;
}

.product-section {
	font-size: 1rem;
	margin: 5px 0;
	padding: 5px 0;
}

.status-active {
	color: green;
	font-weight: bold;
}

.status-inactive {
	color: red;
	font-weight: bold;
}

.seller-buttons {
	margin-top: 15px;
}

.seller-buttons button {
	padding: 8px 15px;
	font-size: 1rem;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 5px;
}


.favorite-btn,  .inquiry-btn {
    width: 140px; /* 버튼 크기 일정 */
    height: 40px;
    font-size: 14px;
    font-weight: bold;
    white-space: nowrap; /* 줄바꿈 방지 */
    text-align: center;
    border: none;
    background-color: #f4a261;
    color: white;
    cursor: pointer;
    flex-shrink: 0; /* 크기 변경 방지 */
}
/* .favorite-btn i {
    color: black;
} */

.favorite-btn:hover {
     background-color: #e76f51;
     transform: scale(1.05);
}
.liked {
    background-color: red !important;
    color: white !important;
}
.liked:hover {
    background-color: #cc0000 !important;
    transform: scale(1.05);
}
.liked i {
    color: white !important;
}

@media (max-width: 768px) {
    .fixed-buttons {
        top: auto;
        bottom: 10px; /* 화면 하단에 고정 */
        right: 10px;
        flex-direction: row; /* 가로 정렬 */
        background: rgba(255, 255, 255, 0.9);
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }
    
    .favorite-btn, .farm-info-btn, .review-btn {
        width: 120px; /* 작은 화면에서도 크기 일정 */
    }
    
}
</style>
<script>
function addToBookmarkFarm(button) {
    console.log('addToBookmarkFarm:::::::::::::::::::::::::::::');
    
    let param = { 
          sellerId: ${selectFarmDetail.id }
    };

    $.ajax({
        url: '/addToBookmarkFarm', // 즐겨찾기 추가 API
        type: 'POST',
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(param),
        success: function(data) {
            console.log('success::::::::::::' + JSON.stringify(data));
            
            if (data.code === '0') {
                $(button).toggleClass('liked'); // 색칠 처리 
	            location.reload();
            		
            } else {
            	location.href='/login/1';
            }
        },
        error: function(request, status, error) {
            console.log('responseText::::::::::::::::::::::::' + request.responseText);
        }
    });
}

function deleteBookmarkFarm(button) {
    console.log('deleteBookmarkFarm:::::::::::::::::::::::::::::');
    
    let param = { 
          sellerId: ${selectFarmDetail.id }
    
        <%--//, sellerId: ${selectFarmDetail.sellerId }--%>
    };

    $.ajax({
        url: '/deleteBookmarkFarm', // 즐겨찾기 추가 API
        type: 'POST',
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(param),
        success: function(data) {
            console.log('success::::::::::::' + JSON.stringify(data));
            
            if (data.code === '0') {
                $(button).toggleClass('liked'); // 색칠 처리 
                location.reload();
                // 온클릭 이벤트 변경 추가 
            } else {
            	 //alert(data.message ? data.message : '알 수 없는 오류');
            	location.href='/login/1';
            }
        },
        error: function(request, status, error) {
            console.log('responseText::::::::::::::::::::::::' + request.responseText);
        }
    });
}


    function calctotalPrice(id) {
        var price = parseFloat(document.getElementById('price').value);
        var countInput = document.getElementById('count');
        var count = parseInt(countInput.value);
        var stock = parseInt(document.getElementById('stock').innerText);
        
        // 수량이 재고보다 많은 경우 재고 수량으로 조정
        if(count > stock) {
            alert("재고가 부족합니다. 최대 " + stock + "개만 주문할 수 있습니다.");
            count = stock;
            countInput.value = stock;
        }
        
        // 1보다 작을 경우 최소 수량 1로 설정 (옵션)
        if(count < 1) {
            count = 1;
            countInput.value = 1;
        }
        
        var total = price * count;
        document.getElementById('spantotalPrice').innerHTML = total;
        document.getElementById('totalPrice').value = total;
    }
    
    // 상품 디테일에서 결제페이지
    
</script>
</head>

<body class="bg-gray-50">
	<div class="min-h-screen">
		<%@include file="../include/header.jsp"%>

		<!-- Shop Section -->
		<div id="section-shop" class="container mx-auto px-4 py-8">
			<div class="flex flex-col md:flex-row gap-8">

				<!-- Products Grid -->
				<div class="flex-1">
					<!-- <form name="form1" action="/detailToOrderPage" method="post"> -->
					<c:set var="farmDetail" value="${ selectFarmDetail}" />
					<div class="seller-container">

						<div class="seller-details">
							<h2>${farmDetail.farmName}</h2>

							<div class="product-section">
								<input type="hidden" name="userId" value="${farmDetail.userId}">
								<input type="hidden" name="id" value="${farmDetail.id}">
								<strong>판매자:</strong> ${farmDetail.name}
							</div>

							<div class="product-section">
								<strong>이메일:</strong> ${farmDetail.email}
							</div>

							<div class="product-section">
								<strong>전화번호:</strong> ${farmDetail.phone}
							</div>

							<div class="product-section">
								<strong>주소:</strong> ${farmDetail.address},
								${farmDetail.detailAddress}
							</div>

							<div class="product-section">
								<strong>사업자 번호:</strong> ${farmDetail.bussinessNumber}
							</div>

							<div class="product-section">
								<strong>리뷰 수:</strong> ${farmDetail.reviewCount}
							</div>


							<div class="product-section">
								<strong>가입일:</strong>
								<fmt:formatDate value="${farmDetail.createDate}"
									pattern="yyyy-MM-dd" />
							</div>



						<div class="button-group">
							<c:choose>
								<c:when test="${farmDetail.bookMarkCnt == 0}">
									<button type="button" class="favorite-btn"
										onclick="addToBookmarkFarm(this)">❤️ 즐겨찾기</button>
								</c:when>
								<c:when test="${farmDetail.bookMarkCnt != 0}">
									<button type="button" class="favorite-btn liked"
										onclick="deleteBookmarkFarm(this)">❤️ 즐겨찾기</button>
								</c:when>
							</c:choose>
							<c:if test="${not empty sessionScope.userVO}">
								<form id="qnaForm" action="/QnaCSInsert?farmId=${farmDetail.id}"
									method="post">
									<input type="hidden" name="farmId" value="${farmDetail.id}">
									<button type="submit" class="inquiry-btn">
										<i class="fas fa-envelope"></i> 문의하기
									</button>
								</form>
							</c:if>


							</div>


						</div>
					</div>

					<!-- </form> -->
				</div>
			</div>
		</div>

	</div>
		<%@include file="../include/footer.jsp"%>
</body>
</html>
