<%@page import="java.util.List"%>
<%@page import="com.gdg.gyulDamGil.dao.OrderDAO"%>
<%@page import="com.gdg.gyulDamGil.vo.OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%-- <% session.setAttribute("sellerId", 1);%> --%>
<html>
<head>
<meta charset="UTF-8">
<title>내 판매상품</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp" />
<style>

.product-image {
	width: 100%;
	max-width: 150px;
	height: 100%;
	max-height: 100px;
	object-fit: cover;
	border-radius: 8px;
}

.newDate {
	font-size: 20px;
	font-weight: bold;
	width: 800px;
	margin: auto;
}

html, body {
    height: 100%;
    display: flex;
    flex-direction: column;
}
.wrapper {
    flex: 1;
}

</style>
</head>
<body style="flex: 1;">

<br/>
나의 상품 총 개수: ${count} | 나의 등록완료된 상품: ${status1} /${count} | 나의 임시저장된 상품: ${status0} /${count}
<br/>

<div class="wrapper">
	<div style="justify-content: center; padding-top: 60px;">
		<c:set var="list" value="${productList.productListForOnePage}"></c:set>
		<c:if test="${fn:length(list) != 0}">
			
			<c:forEach var="product" items="${list}" varStatus="i">
				<fmt:formatNumber value="${product.price}" pattern="#,###" var="price"/>
				
				<div class="bg-white rounded-lg shadow-md p-4" onclick="location.href='/show/'${product.id}"
					style="border-top: 1px solid orange; display: flex; width: 800px; margin: auto; margin-bottom: 30px;">
					<img class="product-image" src="${product.mainImageUrl}" alt="상품 이미지" style="margin-right: 20px;"/>
					<div style="width: 300px;">
						<h3 style="font-weight: bold;">${product.title}</h3><!-- 상품명 -->
								<hr/>
						재고 : 
						<c:if test="${product.stock > 1}">총 </c:if>
						${product.stock}개<br/>
								<hr/>
						${price}원<br/>
					</div>
					<div>
						${product.farmName}<br/> <!-- 판매자 (농장이름) -->
						<div>
							등록상태 :
								<c:if test="${product.status == 0}">임시 저장</c:if>
								<c:if test="${product.status == 1}">등록 완료</c:if>
								<c:if test="${product.status == 2}">품절</c:if>
							<br/>
								<hr/>
							<!-- 상품 등록일 -->
							<c:set var="date" value="null"/>
							<c:if test="${product.updateDate == date}">
								<fmt:formatDate value="${product.createDate}" pattern="yyyy년 MM월 dd일" var="createDate"/>
								<c:set var="date" value="${createDate}"/>
								${date} 등록
							</c:if> 
							<c:if test="${product.updateDate != date}">
							<fmt:formatDate value="${product.updateDate}" pattern="yyyy년 MM월 dd일" var="updateDate"/>
								${updateDate}
							</c:if> 
								<hr/>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- 페이지 이동 버튼 -->
			<!-- 처음으로 -->
			<div style="display: flex; width: 800px; margin: auto; margin-top: 60px; justify-content: center;">
				<c:if test="${productList.currentPage > 1}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="첫 페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=1'">처음</button>
				</c:if>
				<c:if test="${productList.currentPage <= 1}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="첫 페이지 입니다."
						style="font-weight: bold; color: orange;">처음</button>
				</c:if>
						&nbsp;
						<!-- 10페이지 앞으로 -->
				<c:if test="${productList.startPage > 1}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="이전 10페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=${orderList.startPage - 1}'">이전</button>
				</c:if>
				<c:if test="${productList.startPage <= 1}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="첫 10페이지 입니다."
						style="font-weight: bold; color: orange;">이전</button>
				</c:if>
						&nbsp;&nbsp;
						<!-- 페이지 이동 버튼 -->
				<c:forEach var="i" begin="${productList.startPage}"
					end="${productList.endPage}" step="1">
					<c:if test="${productList.currentPage == i }">
						<button class="btn btn-success btn-sm" type="button"
							disabled="disabled" style="font-weight: bold; color: orange;">${i}</button>
					</c:if>
					<c:if test="${productList.currentPage != i }">
						<button class="btn btn-outline-primary btn-sm" type="button"
							onclick="location.href='/myOrder?currentPage=${i}'">${i}</button>
					</c:if>
							&nbsp;&nbsp;
						</c:forEach>
				<!-- 10페이지 뒤로 -->
				<c:if test="${productList.endPage < productList.totalPage}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="다음 10페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=${productList.endPage + 1}'">다음</button>
				</c:if>
				<c:if test="${productList.endPage >= orderList.totalPage}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="마지막 10페이지 입니다."
						style="font-weight: bold; color: orange;">다음</button>
				</c:if>
						&nbsp;
						<!-- 마지막으로 -->
				<c:if test="${productList.currentPage < productList.totalPage}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="마지막 페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=${productList.totalPage}'">마지막</button>
				</c:if>
				<c:if test="${productList.currentPage >= productList.totalPage}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="마지막 페이지 입니다."
						style="font-weight: bold; color: orange;">마지막</button>
				</c:if>
			</div>
		</c:if>
		<c:if test="${fn:length(list) == 0}">
			<div class="bg-white rounded-lg shadow-md p-4" style="display: flex; width: 800px; margin: auto;">
				<marquee>주문하신 상품이 없습니다.</marquee>
			</div>
		</c:if>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>

