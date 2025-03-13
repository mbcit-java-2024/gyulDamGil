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
    
    function orderOKToOne() { // 어딘가 신택스 에러가 잇나봐.. 
        console.log('orderOKToOne:::::::::::::::::::::::::::::');
        console.log('orderOKToOne:::::::::::::paymentMethod::::::::::::::::' + ($('input[name="paymentMethod"]').val()));

        let param = {productId: ${productVO.id}
		, sellerId : ${productVO.sellerId}
		, count: ${productVO.count}
		, price: ${productVO.price}
		, totalPrice: ${productVO.totalPrice}
		, payment: $('input[name="paymentMethod"]:checked').val()
		, title: $('input[name="title"]').val()
		};
        
        console.log('orderOKToOne:::::::::::::::::::param::::::::::'+ JSON.stringify(param));
        
        
        $.ajax({
            url : '/orderOKToOne',
            type : 'POST',
            dataType : "json",
            contentType:"application/json",
            data : JSON.stringify(param),// param, //
            //timeout: 10000,
            beforeSend:function(){
	            console.log('orderOKToOne:::::::::beforeSend::::::::::::::::::::');
                //$('#loading').removeClass('display-none');
            },
            success : function(data){
                console.log('success:::::::::::111::::::::::::' + JSON.stringify(data));
            	if ('0' == data.code) { /// 헐 이것도 같지않음으로돼있어  코드값이 안나와서 이렇게 햇엇나보네.. 컨트롤러를 잘못자서 
            		//console.log('success:::::::::::111::::::::::::' +data.orderId);
            		/* if (!confirm(param.productId + '상품이' + $('#count').val() + '개가 장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {} 
            		else { */
            			location.href = '/orderOKPage?orderIds=' + data.orderIds; 
            	} else {
            		alert(data.message ? data.message : '알 수 없는 에러') ;
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
            <h2 class="text-2xl font-bold mb-6">결제 페이지</h2>
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
                            <tr data-id="${cart.id}">
                                <td>${productVO.title}   
                                <input type="hidden" name="sellerId" value="${productVO.sellerId}">
                                <input type="hidden" name="title" value="${productVO.title}">
                                <input type="hidden" name="id" value="${productVO.id}"></td>
                                <td>${productVO.count}
                                <input type="hidden" name="count" value="${productVO.count}"></td>
                                <td>${productVO.price} 원
                                <input type="hidden" name="price" value="${productVO.price}"></td>
                                <td class="total-price">${productVO.totalPrice} 원
                                <input type="hidden" name="totalPrice" value="${productVO.totalPrice}"></td>
                            </tr>
                    </tbody>
                </table>
                <div class="total-container">
                    총 결제 금액: <span id="totalPayment">0 원</span>
                </div>
                
                <div class="input-group">
                    <label for="recipientName">받는 사람</label>
                    <input type="text" readonly="readonly" id="recipientName" name="name" value="${Consumerinfo.name}" required>
                </div>
                
                <div class="input-group">
                    <label for="email">이메일</label>
                    <input type="email" readonly="readonly" id="email" name="email" value="${Consumerinfo.email}" required>
                </div>
                
                <div class="input-group">
                    <label for="phone">전화번호</label>
                    <input type="tel" readonly="readonly" id="phone" name="phone" value="${Consumerinfo.phone}" required>
                </div>
                
                <div class="input-group">
                    <label for="address">주소</label>
                    <input type="text" readonly="readonly" id="address" name="address" value="${Consumerinfo.address}" required>
                </div>
                
                <div id="togglePaymentMethod" class="toggle-button">결제 수단 선택</div>
                <div class="payment-method">
                <input type="hidden" id="payment" name="payment" value="${Consumerinfo.payment}">
                    <label><input type="radio" name="paymentMethod" value="credit_card"> 신용카드</label>
                    <label><input type="radio" name="paymentMethod" value="bank_transfer"> 계좌이체</label>
                    <label><input type="radio" name="paymentMethod" value="mobile_payment"> 휴대폰 결제</label>
                    <label><input type="radio" name="paymentMethod" value="paypal"> PayPal</label>
                </div>
                
                <div class="btn-container">
                    <button type="button" name="orderOKToOne" onclick="orderOKToOne()">결제하기</button>
                </div>
            <!-- </form> -->
        </div>

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>
