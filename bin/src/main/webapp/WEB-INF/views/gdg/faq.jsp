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
            padding-top: 20px;
            border-radius: 5px;
            cursor: pointer;
            background-color: white;
            
        }

        .faq-answer {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-in-out, padding 0.3s ease-in-out;
            margin: 5px;
            padding: 0 10px;
        }
        strong {
        	margin-left: 5px;
        }
    </style>
    
	<script>
	
	    function toggleAnswer(id) {
	        var answers = document.querySelectorAll('.faq-answer');

	        answers.forEach(answer => {
	            if (answer.id === id) {
	                if (answer.style.maxHeight === "0px" || answer.style.maxHeight === "") {
	                    answer.style.maxHeight = answer.scrollHeight + "px";
	                } else {
	                    answer.style.maxHeight = "0px";
	                }
	            } else {
	                answer.style.maxHeight = "0px";
	            }
	        });
	    }
	</script>
	
</head>
<body class="bg-gray-50">
	<div class="container mx-auto px-4 py-8">
		<div class="flex flex-col md:flex-row gap-8">
			<!-- 메뉴바 include -->
			<div>
				<jsp:include page="../include/qnaMenu.jsp"/>
			</div>
			<div class="flex-1">
			
				<!-- 제목글 -->
				<div id="consumerFAQ" style="margin: 10px; font-size: 28px; font-weight: bold;">자주 묻는 질문 (FAQ)</div>
				<br/>
				
				<!-- 소비자FAQ -->
				<div style="font-size: 20px; font-weight: bold; margin: 10px;">소비자</div>
				<div class="faq-item" onclick="toggleAnswer('faq1')">
				    <strong>Q. 반품 및 환불 절차는 어떻게 되나요?</strong>
				    <div id="faq1" class="faq-answer">
				        A. 반품 및 환불은 구매 후 7일 이내에 신청 가능합니다.<br/>해당 판매처에 문의해주세요.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq2')">
				    <strong>Q. 배송 기간은 얼마나 걸리나요?</strong>
				    <div id="faq2" class="faq-answer">
				        A. 평균적으로 3~5일 소요됩니다. 지역 또는 상황에 따라 다를 수 있습니다.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq3')">
				    <strong>Q. 판매자가 주문을 수락한 상태인데 주문을 취소할 수 있나요?</strong>
				    <div id="faq3" class="faq-answer">
				        A. 사이트 문의로 해당 주문건의 정보와 함께 주문 취소 사유를 작성해주시면 주문 취소 안내를 도와드리겠습니다.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq4')">
				    <strong>Q. 이미 주문했는데 배송지를 다른 곳으로 수정할 수 있나요?</strong>
				    <div id="faq4" class="faq-answer">
				        A. 판매자가 아직 주문 요청을 수락하지 않은 상태라면 주문 취소후 다시 주문할 수 있습니다.<br/>
				        하지만 이미 상품이 준비중이라면 판매처에 직접 문의 해주셔야합니다.
				    </div>
				</div>
				
				<div id="sellerFAQ" class="faq-item" onclick="toggleAnswer('faq5')">
				    <strong>Q. 회원 탈퇴는 어떻게 하나요?</strong>
				    <div id="faq5" class="faq-answer">
				        A. [개인정보 수정 > 회원탈퇴] 메뉴를 통해 회원 탈퇴가 가능합니다.
				    </div>
				</div><br/><br/>
				
				<!-- 판매자FAQ -->
				<div style="font-size: 20px; font-weight: bold;">판매자</div>
				<div class="faq-item" onclick="toggleAnswer('faq6')">
				    <strong>Q. 교환 및 환불 배송비는 어떻게 측정하나요?</strong>
				    <div id="faq6" class="faq-answer">
				        A. 배송비의 경우 각 판매처에서 지정할 수 있도록 방침을 두고 있습니다.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq7')">
				    <strong>Q. 부당한 고객의 리뷰를 삭제할 수 있나요?</strong>
				    <div id="faq7" class="faq-answer">
				        A. 고객의 리뷰는 판매자가 임의로 삭제할 수 없습니다.<br/>다만 사실과 다른 악성 리뷰의 경우
				        사이트 문의로 해당 내용과 관련 자료를 제출해주시면 검토 후 삭제 조치 될 수 있습니다.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq8')">
				    <strong>Q. 상품 판매 수수료는 얼마인가요?</strong>
				    <div id="faq8" class="faq-answer">
				        A. '귤담길'은 농가(판매처)에 판매 수수료를 부과하지 않습니다.<br/>
				        수수료 관련 방침은 추후 갱신될 수 있습니다.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq9')">
				    <strong>Q. 상품 등록 및 삭제는 어떻게 하나요?</strong>
				    <div id="faq9" class="faq-answer">
				        A. 상품 등록의 경우 판매자 로그인 후 상단 배너의 상품등록으로 등록 가능합니다.<br/>
				        또한 [내 상품보기 > 해당 상품 클릭 > 수정 및 삭제버튼] 해당 경로를 통해 해당 상품을 수정 또는 삭제할 수 있습니다.
				    </div>
				</div>
				
				<div class="faq-item" onclick="toggleAnswer('faq10')">
				    <strong>Q. 판매자 계정에 대한 제한이 있나요?</strong>
				    <div id="faq10" class="faq-answer">
				        A. 판매자 계정은 규정을 위반하거나 불법 행위가 발생할 경우 제한될 수 있습니다.<br/>
				        예를 들어, 허위 광고나 품질 문제 등은 즉시 조치를 취하게 됩니다.
				    </div>
				</div>
				<div style="height: 150px;"></div>
				
			</div>
		</div>
	</div>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>