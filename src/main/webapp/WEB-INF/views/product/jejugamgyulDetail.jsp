<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제주귤마을</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/style.css">
	
	<style>
.liked {
    background-color: red;
    color: white;
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
                    if (!confirm($('input[name="title"]').val() + '상품이' + $('#count').val() + '개가 장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {} 
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
							</div>
							<div class="product-details">
								<div class="product-section" id="title">
									<h2>${productDetail.title }</h2>
									<input type="hidden" name="title"
										value="${productDetail.title}"> <input type="hidden"
										name="sellerId" value="${productDetail.sellerId}"> <input
										type="hidden" name="id" value="${productDetail.id}">
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
											<label for="count">수량 선택: </label> <input type="number"
												onkeyup="calctotalPrice(${productDetail.id })"
												onchange="calctotalPrice(${selectGamgyulDetail.id })"
												id="count" name="count" min="1"
												max="${productDetail.stock }" value="1"> <input
												type="hidden" id="price" name="price"
												value="${productDetail.price }"> <input
												type="hidden" id="totalPrice" name="totalPrice"
												value="${productDetail.price }">
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
									<div class="buttons">
										<c:choose>
											<c:when test="${productDetail.stock > 0}">
												<button type="button" class="cart-btn" onclick="addToCart()">장바구니</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="cart-btn" disabled>장바구니</button>
											</c:otherwise>
										</c:choose>
										<button type="submit" class="buy-btn">결제하기</button>
										<div class="buttons">
										<c:choose>
										<c:when test="${productDetail.bookMarkCnt == 0}">
									<button type="button" class="favorite-btn" onclick="addToBookmarkProduct(this)">❤️ 즐겨찾기</button>
										</c:when>
										<c:when test="${productDetail.bookMarkCnt != 0}">
										<%-- <c:otherwise test="${productDetail.bookMarkCnt != 0}"> --%>
									<button type="button" class="favorite-btn liked" onclick="deleteBookmarkProduct(this)">❤️ 즐겨찾기</button>
										<%-- </c:otherwise> --%>
										</c:when>
										</c:choose>
								</div>
										<button type="button" class="farm-info-btn"
											onclick="location.href='/farmDetail/${productDetail.sellerId}'">🏡
											농장 정보</button> 
									</div>
								</div>
							</div>

						</div>

					</form>
				</div>
			</div>
		</div>

		<%@include file="../include/footer.jsp"%>
	</div>
</body>
</html>
