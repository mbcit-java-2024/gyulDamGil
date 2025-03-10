<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제주귤마을 - 장바구니</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4a261;
            color: white;
        }
        .quantity-box {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .quantity-box button {
            padding: 4px 8px;
            margin: 0 5px;
            background-color: #f4a261;
            color: white;
            border: none;
            cursor: pointer;
        }
        .quantity-box input {
            width: 50px;
            text-align: center;
        }
        .total-container {
            margin-top: 20px;
            text-align: right;
            font-size: 1.2em;
            font-weight: bold;
        }
        .btn-container {
            text-align: right;
            margin-top: 10px;
        }
        .btn-container button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #2a9d8f;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
    <script>
    
    function goToPay() {
    	var f = document.form1;
    	
		let cartIds = '';
        $(".itemCheck:checked").each(function() {
			let row = $(this).closest("tr");
			let cartId = row.attr("data-id");
//			let price = row.attr("data-id");
			if ('' == cartIds)
				cartIds = cartIds + cartId;
			else 
				cartIds = cartIds + ',' + cartId;
		});
        
        console.log('goToPay::::::cartIds:::::::' + cartIds);
    	f.cartIds.value =  cartIds;
    	//return;
    	f.submit();
    	
    }
    
    //=================================================================================================================
    
    function updateCart(cartId) {
        console.log('updateCart::::::::::::::::::::::::::cartId:::' + cartId);
        
        //let tr = $('[data-id="'+cartId+'"]');
        let tr = $('#cart-'+cartId);
        console.log('updateCart::::::::::::::::::::::::::tr:::' + tr.html());
        
        let count = tr.find('input[name="count"]').val();
        console.log('updateCart::::::::::::::::::::::::::count:::' + count);
        //let productId = tr.find('#cart-'+cartId+'-productId').text();
        let productId = tr.find('input[name="productId"]').val();
        console.log('updateCart::::::::::::::::::::::::::productId:::' + productId);
        let title = tr.find('input[name="title"]').val();
        console.log('updateCart::::::::::::::::::::::::::title:::' + title);
        let mainImageUrl = tr.find('input[name="mainImageUrl"]').val();
        console.log('updateCart::::::::::::::::::::::::::mainImageUrl:::' + mainImageUrl);
        
        let productPrice = tr.find('[data-name="productPrice"]').text();
        console.log('updateCart::::::::::::::::::::::::::productPrice:::' + productPrice);
        
        let totalPrice = tr.find('[data-name="totalPrice"]').text();
        console.log('updateCart::::::::::::::::::::::::::totalPrice:::' + totalPrice);
        
        
        //let checked = tr.find('input[name="chk"]').ischeked;
        //console.log('updateCart::::::::::::::::::::::::::checked:::' + checked);
        // return;
        // let quantity = document.getElementById('quantity').value;             
        let param = {
          	  id: cartId
        	, mainImageUrl: mainImageUrl // td.eq(1).text()// ${selectGamgyulDetail.id }
        	, title: title // td.eq(1).text()// ${selectGamgyulDetail.id }
        	, productId: productId // td.eq(1).text()// ${selectGamgyulDetail.id }
            , count: count //$('#count').val() // document.getElementById('count').value
            , price : productPrice //${selectGamgyulDetail.price }
            , totalPrice : totalPrice//$('#totalPrice').val()  //document.getElementById('totalPrice').value
            };     
        
        
        $.ajax({
            url : '/updateCart/',
            type : 'POST',
            dataType : "json",
            contentType:"application/json",
            data : JSON.stringify(param),// param, //
            //timeout: 10000,
            beforeSend:function(){
	            console.log('updateCart:::::::::beforeSend::::::::::::::::::::');
                //$('#loading').removeClass('display-none');
            },
            success : function(data){
                console.log('success:::::::::::111::::::::::::' + JSON.stringify(data));
            	 if ('0' == data.code) {
            		 alert(param.title +'의 수량이 ' + param.count + '개로 변경되었습니다');
            			location.reload();
            			//location.href = '/cartPage';
            	} else {
            		if (null != data.message) {
            			alert(data.message);
            		}
            		else {
            			alert('알수없는 에러');
            		}
            	} 
            	
            },
            error : function(request, status, error){
                console.log('responseText::::::::::::::::::::::::'+request.responseText);
                //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                //var err=JSON.parse(request.responseText);

                //alert(err.resData[0].errorMsg);
                    
                //$('#loading').addClass('display-none');
            },
            complete:function(){
                //$('#loading').addClass('display-none');
            }
    	});

        
        // 
        //var f = document.form1;
        //f.submit;
        //alert(quantity + '개가 장바구니에 추가되었습니다.');
    }
    
    function deleteCartSelectedOne(cartId) {
        console.log('deleteCartSelectedOne::::::::::::::::::::::::::cartId:::' + cartId);
        
        /* let tr = $('#cart-'+cartId);
        console.log('updateCart::::::::::::::::::::::::::tr:::' + tr.html());
        
        let count = tr.find('input[name="count"]').val();
        console.log('updateCart::::::::::::::::::::::::::count:::' + count);
        //let productId = tr.find('#cart-'+cartId+'-productId').text();
        let productId = tr.find('[data-name="productId"]').text();
        console.log('updateCart::::::::::::::::::::::::::productId:::' + productId);
        
        let productPrice = tr.find('[data-name="productPrice"]').text();
        console.log('updateCart::::::::::::::::::::::::::productPrice:::' + productPrice);
        
        let totalPrice = tr.find('[data-name="totalPrice"]').text();
        console.log('updateCart::::::::::::::::::::::::::totalPrice:::' + totalPrice); */
        
        
        let param = {
          	  id: cartId
        	/* , productId: productId // td.eq(1).text()// ${selectGamgyulDetail.id }
            , count: count //$('#count').val() // document.getElementById('count').value
            , price : productPrice //${selectGamgyulDetail.price }
            , totalPrice : totalPrice//$('#totalPrice').val()  //document.getElementById('totalPrice').value */
            };     
        
        
        $.ajax({
            url : '/deleteCartSelectedOne/',
            type : 'POST',
            dataType : "json",
            contentType:"application/json",
            data : JSON.stringify(param),// param, //
            //timeout: 10000,
            beforeSend:function(){
	            console.log('deleteCartSelectedOne:::::::::beforeSend::::::::::::::::::::');
                //$('#loading').removeClass('display-none');
            },
            success : function(data){
                console.log('success:::::::::::111::::::::::::' + JSON.stringify(data));
            			//location.href = '/cartPage';
            			location.reload();
            	
            },
            error : function(request, status, error){
                console.log('responseText::::::::::::::::::::::::'+request.responseText);
                //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                //var err=JSON.parse(request.responseText);

                //alert(err.resData[0].errorMsg);
                    
                //$('#loading').addClass('display-none');
            },
            complete:function(){
                //$('#loading').addClass('display-none');
            }
    	});

        
        // 
        //var f = document.form1;
        //f.submit;
        //alert(quantity + '개가 장바구니에 추가되었습니다.');
    }
    
	    
    
    
    
        $(document).ready(function() {
        	
            function updateTotalPrice(input) {
                let row = input.closest("tr");
                let price = parseInt(row.find(".price").text());
                let quantity = parseInt(input.val());
                let total = price * quantity;
                row.find(".totalPrice").text(total);
                updateTotalPayment();
            }

            function updateTotalPayment() {
                let totalPayment = 0;
                $(".itemCheck:checked").each(function() {
                    let row = $(this).closest("tr");
                    let itemTotal = parseInt(row.find(".totalPrice").text());
                    totalPayment += itemTotal;
                });
                $("#totalPayment").text(totalPayment.toLocaleString() + " 원");
            }

            $("#checkAll").click(function() {
                $(".itemCheck").prop("checked", this.checked);
                updateTotalPayment();
            });

            $(".itemCheck").click(function() {
                $("#checkAll").prop("checked", $(".itemCheck:checked").length === $(".itemCheck").length);
                updateTotalPayment();
            });

            $(".increase").click(function() {
            	let input = $(this).siblings(".quantity");
            	console.log($(this));
            	let stock = $(this).parent().parent().parent().find('input[name="stock"]').val();
            	console.log($(this).parent().parent().parent());
            	console.log(stock);
            	let count = parseInt(input.val()) + 1;
            	if (count > stock) {
            		alert('최대주문수량은 ' + stock +' 개 입니다.');
            		return;
            	}
                input.val(count);
                updateTotalPrice(input);
            });
            $(".decrease").click(function() {
                let input = $(this).siblings(".quantity");
                let newValue = parseInt(input.val()) - 1;
                if (newValue > 0) {
                    input.val(newValue);
                    updateTotalPrice(input);
                }
            });
			

            $("#selectOrder").click(function() {
                let selectedItems = $(".itemCheck:checked").length;
                if (selectedItems === 0) {
                    alert("결제할 상품을 선택해주세요.");
                } else {
                    alert("선택된 상품을 결제합니다.");
                    // 실제 결제 로직을 추가하세요
                    goToPay(); 
                    // location.href = '/orderPage' + ${cart.id}; 
                }
            });

            $("#orderAll").click(function() {
                alert("전체 상품을 결제합니다.");
                // 모든 체크박스 체크 
                $(".itemCheck").prop("checked", true);
                // 실제 결제 로직을 추가하세요
                goToPay();
            });
        });
    </script>
</head>
<body class="bg-gray-50">
    <div class="min-h-screen">
        <%@ include file="../include/header.jsp" %>
        
        <div id="section-shop" class="container mx-auto px-4 py-8">
            <div class="flex flex-col md:flex-row gap-8">
                <div class="flex-1" id="comments-{{id}}">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold">장바구니 목록</h2>
                    </div>
                    <table>
                        <tr>
                            <th><input type="checkbox" id="checkAll"></th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>총 가격</th>
                            <th>수정</th>
                            <th>삭제</th>
                        </tr>
                        <c:forEach var="cart" items="${selectcartList}">
                            <tr id="cart-${cart.id}" data-id="${cart.id}" >
                                <td data-name="chk"><input type="checkbox" class="itemCheck"></td>
                                <td>
                                	<input type="hidden" name="mainImageUrl" value="${cart.mainImageUrl}                     "/>
                                	<div><input type="hidden" name="title" value="${cart.title}"/>${cart.mainImageUrl}</div>
                                	<input type="hidden" name="productId" value="${cart.productId}"/><br>${cart.title}
                                	<input type="hidden" name="consumerId" value="${cart.consumerId}"/>
                                	<input type="hidden" name="stock" value="${cart.stock}"/>${cart.stock}
                                </td>
                                <td data-name="productPrice" class="price">${cart.price}</td>
                                <td>
                                    <div class="quantity-box">
                                        <button class="decrease">-</button>
                                        <input type="text" name="count" class="quantity" value="${cart.count}" readonly>
                                        <button class="increase">+</button>
                                    </div>
                                </td>
                                <td data-name="totalPrice"  class="totalPrice">${cart.totalPrice}</td>
                                <td>
                                	<a href="javascript:void(0)" onclick="updateCart(${cart.id})">수정</a>
                                	<!-- <button
                                	>
                                	수정
                                	</button> -->
                                </td>
                                <!-- <td><a href="javascript:void(1)" onclick="return confirm('삭제하시겠습니까?')">삭제</a></td> -->
                                <td><a href="javascript:void(1)" onclick="deleteCartSelectedOne(${cart.id})">삭제</a></td>
                            </tr>
                        </c:forEach>
                    </table>

                    <!-- 총 결제 금액 표시 -->
                    <div class="total-container">
                        총 결제 금액: <span id="totalPayment">0 원</span>
                    </div>

                    <!-- 버튼 컨테이너 -->
                    <div class="btn-container">
                        <button type="button" id="selectOrder">선택 결제</button>
                        <button id="orderAll">전체 주문</button>
                    </div>
                </div>
            </div>
        </div>

<form name="form1" action="/orderPage"  method="post">
<input type="hidden" name="cartIds" value=""/>
</form>
        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>
