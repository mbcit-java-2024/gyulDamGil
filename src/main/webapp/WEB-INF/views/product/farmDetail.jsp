<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귤담길 - 농가 상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/style.css">

<style>
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

.cart-btn {
	background-color: orange;
	color: white;
}

.buy-btn {
	background-color: red;
	color: white;
}

.favorite-btn {
	background-color: white;
	border: 1px solid red;
	color: red;
}

.farm-info-btn {
	background-color: green;
	color: white;
}
.liked {
    background-color: red;
    color: white;
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
            	alert('상품이 즐겨찾기에 추가되었습니다')
	                location.reload();
                $(button).toggleClass('liked'); // 색칠 처리 
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
                alert('상품이 즐겨찾기에서 해제되었습니다.');
                $(button).toggleClass('liked'); // 색칠 처리 
                location.reload();
                // 온클릭 이벤트 변경 추가 
            } else {
            	location.href='/login/1';
            }
        },
        error: function(request, status, error) {
            console.log('responseText::::::::::::::::::::::::' + request.responseText);
        }
    });
}

/* function goToFarmDetail(sellerId) {
    location.href = "/farmDetail?sellerId=" + sellerId;
} */ // 이건 안쓰는건가보네. 일단 막아보자 패스로 보내야 하는데 겟으로 보내네..  

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
							<input type="hidden" name="userId" value="${item.userId}">
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

							<div class="product-section">
								<strong>정보 수정일:</strong>
								<fmt:formatDate value="${farmDetail.updateDate}"
									pattern="yyyy-MM-dd" />
							</div>



							<c:choose>
								<c:when test="${farmDetail.bookMarkCnt == 0}">
									<button type="button" class="favorite-btn"
										onclick="addToBookmarkFarm(this)">♡ 즐겨찾기</button>
								</c:when>
								<c:when test="${farmDetail.bookMarkCnt != 0}">
									<button type="button" class="favorite-btn liked"
										onclick="deleteBookmarkFarm(this)">❤️ 즐겨찾기</button>
								</c:when>
							</c:choose>

							<%-- <div class="seller-buttons">
								<button type="button" class="favorite-btn" onclick="addToBookmarkFarm(this)">❤️ 좋아요 ${farmDetail.bookMarkCnt}</button>
							</div> --%>
							
							
							
							
						</div>
					</div>

					<!-- </form> -->
				</div>
			</div>
		</div>

		<%@include file="../include/footer.jsp"%>
	</div>
</body>
</html>
