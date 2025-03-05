<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료 - 제주귤마을</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
    <style>
        body {
            background-color: #fffaf1; /* 따뜻한 아이보리 배경 */
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            border: 2px solid #f4a261; /* 감귤색 테두리 */
        }
        .title {
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #e76f51; /* 감귤 컬러 */
        }
        .info-box {
            background: #ffedd5; /* 따뜻한 오렌지 톤 */
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            border: 1px solid #f4a261;
        }
        .info-box p {
            margin: 5px 0;
            font-size: 16px;
            font-weight: bold;
            color: #6d4c41; /* 고동색 (자연스러운 감귤 느낌) */
        }
        .order-items {
            margin-top: 20px;
        }
        .order-items table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        .order-items th, .order-items td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .order-items th {
            background-color: #f4a261; /* 감귤색 */
            color: white;
        }
        .total-container {
            font-size: 1.4em;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
            color: #e76f51;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-container button {
            padding: 12px 20px;
            font-size: 1.1em;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            margin: 5px;
            width: 220px;
        }
        .btn-detail {
            background-color: #f4a261; /* 감귤색 */
        }
        .btn-detail:hover {
            background-color: #e76f51; /* 진한 감귤색 */
        }
        .btn-shopping {
            background-color: #2a9d8f; /* 초록색 */
        }
        .btn-shopping:hover {
            background-color: #21867a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="title">🎉 주문이 완료되었습니다!</h2>
        
        <div class="info-box">
            <p>📌 <strong>구매자:</strong> ${Consumerinfo.name}</p>
            <p>📩 <strong>이메일:</strong> ${Consumerinfo.email}</p>
            <p>📍 <strong>배송지:</strong> ${Consumerinfo.address}</p>
        </div>

        <div class="order-items">
            <h3>🛒 주문 상품</h3>
            <table>
                <thead>
                    <tr>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>총 가격</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${orderOK}" >
                        <tr>
                            <td>${item.title}</td>
                            <td>${item.count} 개</td>
                            <td>${item.price} 원</td>
                            <td>${item.totalPrice} 원</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="total-container">
            총 결제 금액: <span id="totalPayment">0 원</span>
        </div>

        <div class="btn-container">
            <button class="btn-shopping" type="button" onclick="location.href='/jejugamgyulList/0'">🛍️ 쇼핑 계속하기</button>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            let total = 0;
            $(".order-items tbody tr").each(function() {
                let priceText = $(this).find("td:last").text().replace(/[^0-9]/g, "");
                total += parseInt(priceText) || 0;
            });
            $("#totalPayment").text(total.toLocaleString() + " 원");
        });
    </script>
</body>
</html>
