<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>귤담길 - 고객센터</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>

    <style>
        .faq-item {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            background: #f9f9f9;
        }
        .faq-answer {
            display: none; /* 기본적으로 숨김 */
            padding-top: 5px;
        }
    </style>
    
	<script>
	    function toggleAnswer(id) {
	        var answer = document.getElementById(id);
	        if (answer.style.display === "none" || answer.style.display === "") {
	            answer.style.display = "block";  // 답변 보이기
	        } else {
	            answer.style.display = "none";  // 답변 숨기기
	        }
	    }
	</script>
	
</head>
<body>

<h2>자주 묻는 질문 (FAQ)</h2>

<div class="faq-item" onclick="toggleAnswer('faq1')">
    <strong>Q1. 반품 및 환불 절차는 어떻게 되나요?</strong>
    <div id="faq1" class="faq-answer">
        A1. 반품 및 환불은 구매 후 7일 이내에 신청 가능합니다. 고객센터로 문의해주세요.
    </div>
</div>

<div class="faq-item" onclick="toggleAnswer('faq2')">
    <strong>Q2. 배송 기간은 얼마나 걸리나요?</strong>
    <div id="faq2" class="faq-answer">
        A2. 평균적으로 2~3일 소요됩니다. 지역에 따라 다를 수 있습니다.
    </div>
</div>


</body>
<jsp:include page="../include/footer.jsp"/>
</html>