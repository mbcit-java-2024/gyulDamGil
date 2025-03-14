<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귤담길 - 상품 상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

.product-section {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: center; /* 가로 중앙 정렬 */
    text-align: center; /* 텍스트 가로 정렬 */
    width: 100%;
    height: 100%;
    padding: 10px;
    box-sizing: border-box;
    border: none; /* 테두리 제거 */
    background: none; /* 배경 제거 */
}
.fixed-buttons {
    position: fixed; /* 화면 크기가 줄어도 고정 */
    top: 20px; /* 화면 상단에서 20px 아래 */
    right: 20px; /* 오른쪽에서 20px */
    display: flex;
    flex-direction: column; /* 버튼을 세로로 배치 */
    align-items: center;
    gap: 10px; /* 버튼 간격 */
    z-index: 1000; /* 다른 요소 위에 표시 */
}

.favorite-btn, .farm-info-btn, .review-btn, .cart-btn, .buy-btn {
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

.favorite-btn:hover  {
    background-color: #e76f51;
    transform: scale(1.05);
}

.farm-info-btn:hover {
	background-color: #329632;
    transform: scale(1.05);
}
.buy-btn:hover {
	background-color: #148CFF;
    transform: scale(1.05);
}
.cart-btn:hover {
	background-color: #FF8200;
    transform: scale(1.05);
}
.review-btn:hover {
	background-color: #FFC31E;
    transform: scale(1.05);
}

.product-container {
    display: flex;
    flex-wrap: wrap; /* 내용이 벗어나지 않도록 자동 줄바꿈 */
    width: 100%;
    max-width: 900px; /* 최대 너비 제한 */
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
    overflow: hidden; /* 넘치는 요소 숨김 */
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #fff;
}
#count {
    width: 60px; /* 입력 필드 너비 */
    height: 30px; /* 높이 조정 */
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 5px;
}


.liked {
    background-color: red !important;
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
    
     .product-section {
        padding: 8px;
    }

    .product-section p {
        font-size: 14px;
        padding: 4px;
    }
}
</style>

<script>
function addToBookmarkProduct(button) {
    console.log('addToBookmarkProduct:::::::::::::::::::::::::::::');
    
    let param = { 
          productId: ${selectGamgyulDetail.id }
        , sellerId: ${selectGamgyulDetail.sellerId }
    };

    $.ajax({
        url: '/addToBookmarkProduct', // 즐겨찾기 추가 API
        type: 'POST',
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(param),
        success: function(data) {
            console.log('success::::::::::::' + JSON.stringify(data));
            
            if (data.code === '0') {
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

function deleteBookmarkProduct(button) {
    console.log('deleteBookmarkProduct:::::::::::::::::::::::::::::');
    
    let param = { 
          productId: ${selectGamgyulDetail.id }
        , sellerId: ${selectGamgyulDetail.sellerId }
    };

    $.ajax({
        url: '/deleteBookmarkProduct', // 즐겨찾기 추가 API
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
    function addToCart() {
        console.log('addToCart:::::::::::::::::::::::::::::');
        let param = {
              productId: ${selectGamgyulDetail.id }
            , count: $('#count').val()
            , price : ${selectGamgyulDetail.price }
            , totalPrice : $('#totalPrice').val()
            , sellerId : ${selectGamgyulDetail.sellerId }
            };         
        
        $.ajax({
            url : '/addToCart',
            type : 'POST',
            dataType : "json",
            contentType:"application/json",
            data : JSON.stringify(param),
            beforeSend:function(){
                console.log('addToCart:::::::::beforeSend::::::::::::::::::::');
            },
            success : function(data){
                console.log('success:::::::::::111::::::::::::' + JSON.stringify(data));
                if ('0' == data.code) {
                	getCartCount();
                    if (!confirm('${selectGamgyulDetail.title }' + ' 상품 ' + $('#count').val() + '개가 장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {} 
                    else {
                        location.href = '/cartPage';
                    }
                } else {
                	location.href='/login/1';
                }
            },
            error : function(request, status, error){
                console.log('responseText::::::::::::::::::::::::'+request.responseText);
            },
            complete:function(){}
        });
    }
</script>
</head>

<body class="bg-gray-50">
	<div class="min-h-screen">
		<%@include file="../include/header.jsp"%>

		<!-- Shop Section -->
		<div id="section-shop" class="container mx-auto px-4 py-8">
			<div class="flex flex-col md:flex-row gap-8">
				<%@include file="../include/menu.jsp"%>

				<!-- Products Grid -->
				<div class="flex-1">
					<form name="form1" action="/detailToOrderPage" method="post">
						<c:set var="productDetail" value="${ selectGamgyulDetail}" />

						<div class="product-container">
							<div class="product-image">
								<img src="${productDetail.mainImageUrl }" alt="상품 이미지">
								<div class="buttons">
									<c:choose>
										<c:when test="${productDetail.bookMarkCnt == 0}">
											<button type="button" class="favorite-btn"
												onclick="addToBookmarkProduct(this)">❤️ 즐겨찾기</button>
										</c:when>
										<c:when test="${productDetail.bookMarkCnt != 0}">
											<%-- <c:otherwise test="${productDetail.bookMarkCnt != 0}"> --%>
											<button type="button" class="favorite-btn liked"
												onclick="deleteBookmarkProduct(this)">❤️ 즐겨찾기</button>
											<%-- </c:otherwise> --%>
										</c:when>
									</c:choose>
									<button type="button" class="farm-info-btn"
										onclick="location.href='/farmDetail/${productDetail.sellerId}'">🏡
										농장 정보</button>
									<button type="button" class="review-btn"
										onclick="location.href='/ReviewList?productId=${productDetail.id}'">⭐
										리뷰 보기</button>
								</div>
							</div>
							<div class="product-details">
								<div class="product-section" id="title">
									<p>${productDetail.title }</p>
									<input type="hidden" name="title"
										value="${productDetail.title}"> <input type="hidden"
										name="sellerId" value="${productDetail.sellerId}"> <input
										type="hidden" name="id" value="${productDetail.id}"> <input
										type="hidden" name="mainImageUrl"
										value="${productDetail.mainImageUrl}">
								</div>
								<div class="product-section">
									<p>${productDetail.description }</p>
								</div>
								<div class="product-section">
									<p>
										가격 : <span id="spanprice">${productDetail.price }</span>원
									</p>
									<input type="hidden" name="price"
										value="${productDetail.price}">
								</div>

								<!-- 재고 및 수량 선택 영역: 재고가 0이면 품절 표시 -->
								<c:choose>
									<c:when test="${productDetail.stock > 0}">
										<div class="product-section">
											<p>
												재고 : <span id="stock">${productDetail.stock }</span>개
											</p>
										</div>
										<div class="product-section quantity-container">
											<p>
												수량선택 : 
											<input type="number"
												onkeyup="calctotalPrice(${productDetail.id })"
												onchange="calctotalPrice(${selectGamgyulDetail.id })"
												id="count" name="count" min="1"
												max="${productDetail.stock }" value="1"> <input
												type="hidden" id="price" name="price"
												value="${productDetail.price }"> <input
												type="hidden" id="totalPrice" name="totalPrice"
												value="${productDetail.price }">
											</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="product-section">
											<p class="text-red-500 font-bold">품절</p>
										</div>
									</c:otherwise>
								</c:choose>

								<div class="product-section">
									<p>
										총 금액 : <span id="spantotalPrice">${productDetail.price }</span>원
									</p>
								</div>
								<div class="buttons">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:choose>
										<c:when test="${productDetail.stock > 0}">
											<button type="button" class="cart-btn" onclick="addToCart()"> <i class="fas fa-shopping-cart"></i>&nbsp;귤바구니</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="cart-btn" disabled><i class="fas fa-shopping-cart"></i>&nbsp;귤바구니</button>
										</c:otherwise>
									</c:choose>
									<button type="submit" class="buy-btn"><i class="fas fa-credit-card"></i>&nbsp;결제하기</button>

								</div>
							</div>
						</div>
				</div>

			</div>

			</form>
		</div>
	</div>
	</div>
	<!--  수정 -->
	<%@include file="../include/footer.jsp"%>
	</div>
</body>
</html>
