<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>귤담길 - 결제</title>
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
        .input-group {
            margin-top: 15px;
        }
        .input-group label {
            font-weight: bold;
        }
        .input-group input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .toggle-button {
            cursor: pointer;
            background-color: #f4a261;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-top: 15px;
        }
        .payment-method {
            display: none;
            margin-top: 10px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .payment-method label {
            display: block;
            padding: 5px 0;
        }
    </style>
    <script>
    
    function addToOrder() {
        console.log('addToOrder:::::::::::::::::::::::::::::');
            
            let param = {cartIds: '${cartIds}' 
            		, recipientName: $('#recipientName').val()
            		, address: $('#address').val()
            		, title: $('input[name="title"]').val()
            		, count: $('input[name="count"]').val()
            		, price: $('input[name="price"]').val()
            			, totalPrice: $('input[name="totalPrice"]').val()
            			, email: $('#email').val()
            			, phone: $('#phone').val()
            			, payment: $('input[name="paymentMethod"]').val()
            			, consumerId: $('input[name="consumerId"]').val()
            			};
            
        

        console.log('addToOrder:::::::::::::::::::param::::::::::'+ JSON.stringify(param));

        //return;
        
        $.ajax({
            url : '/addToOrder',
            type : 'POST',
            dataType : "json",
            contentType:"application/json",
            data : JSON.stringify(param),// param, //
            //timeout: 10000,
            beforeSend:function(){
	            console.log('addToOrder:::::::::beforeSend::::::::::::::::::::');
                //$('#loading').removeClass('display-none');
            },
            success : function(data){
                console.log('success:::::::::::111::::::::::::' + JSON.stringify(data));
            	if ('0' != data.code) {
            		console.log('success:::::::::::111::::::::::::' +data.orderIds);
            		/* if (!confirm(param.productId + '상품이' + $('#count').val() + '개가 장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {} 
            		else { */
            			// 주문완료페이지로 이동 
            			location.href = '/orderOKPage?orderIds=' + data.orderIds;
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
        
    }
        $(document).ready(function() {
            $("#togglePaymentMethod").click(function() {
                $(".payment-method").slideToggle();
            });
            
            // 총 결제 금액 계산 및 콤마 추가
            let total = 0;
            $(".total-price").each(function() {
                total += parseInt($(this).text().replace(/[^0-9]/g, ""));
            });
            $("#totalPayment").text(total.toLocaleString() + " 원");
        });
        
        
    </script>
</head>
<body class="bg-gray-50">
    <div class="min-h-screen">
        <%@ include file="../include/header.jsp" %>
        
        <div id="section-payment" class="container mx-auto px-4 py-8">
            <h1 class="text-2xl font-bold mb-6">결제 페이지</h1>
            <!-- <form action="/orderOKPage" method="post"> -->
                <table>
                    <thead>
                        <tr>
                            <th>상품</th>
                            <th>수량</th>
                            <th>가격</th>
                            <th>총 가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${selectCartListByIds}">
                            <tr data-id="${cart.id}">
                                <td>${item.title}
                                <input type="hidden" name="title" value="${item.title}">
                                <input type="hidden" name="consumerId" value="${item.consumerId}"></td>
                                <td>${item.count}
                                <input type="hidden" name="count" value="${item.count}"></td>
                                <td>${item.price} 원
                                <input type="hidden" name="price" value="${item.price}"></td>
                                <td class="total-price">${item.totalPrice} 원
                                <input type="hidden" name="totalPrice" value="${item.totalPrice}"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="total-container">
                    총 결제 금액: <span id="totalPayment">0 원</span>
                </div>
                
                <div class="input-group">
                    <label for="recipientName">받는 사람</label>
                    <input type="text" id="recipientName" name="name" value="${Consumerinfo.name}" required>
                </div>
                
                <div class="input-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" value="${Consumerinfo.email}" required>
                </div>
                
                <div class="input-group">
                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" name="phone" value="${Consumerinfo.phone}" required>
                </div>
                
                <div class="input-group">
                    <label for="address">주소</label>
                    <input type="text" id="address" name="address" value="${Consumerinfo.address}" required>
                </div>
                
                <div id="togglePaymentMethod" class="toggle-button">결제 수단 선택</div>
                <div class="payment-method">
                    <label><input type="radio" name="paymentMethod" value="credit_card" required> 신용카드</label>
                    <label><input type="radio" name="paymentMethod" value="bank_transfer"> 계좌이체</label>
                    <label><input type="radio" name="paymentMethod" value="mobile_payment"> 휴대폰 결제</label>
                    <label><input type="radio" name="paymentMethod" value="paypal"> PayPal</label>
                </div>
                
                <div class="btn-container">
                    <button type="button" name="addToOrder" onclick="addToOrder()">결제하기</button>
                </div>
            <!-- </form> -->
        </div>

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>
