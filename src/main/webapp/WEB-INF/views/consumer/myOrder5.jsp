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
<title>귤담길 - 주문 목록</title>
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

</style>
</head>
<body>

	<div style="justify-content: center; padding-top: 60px;">
		<c:set var="list" value="${orderList.orderList}"></c:set>
		<c:if test="${fn:length(list) != 0}">
			<c:forEach var="order" items="${list}" varStatus="i">
				<div class="bg-white rounded-lg shadow-md p-4" style="display: flex; width: 800px; margin: auto; margin-bottom: 30px;">
					<img class="product-image" src="${order.mainImageUrl}" alt="상품 이미지" style="margin-right: 20px;"/>
					<div style="width: 300px;">
						${order.farmName}<br/>
						${order.productTitle}<br/>
						${order.count}개<br/>
						<c:if test="${order.count > 1}">총 </c:if>
						${order.totalPrice}원<br/>
					</div>
					<div>
						<div>
							주문 상태 :
							<c:choose>
								<c:when test="${order.status == 0}">주문요청</c:when>
								<c:when test="${order.status == 1}">상품준비중</c:when>
								<c:when test="${order.status == 2}">배송중</c:when>
								<c:when test="${order.status == 3}">배송완료</c:when>
								<c:when test="${order.status == 4}">구매확정</c:when>
								<c:when test="${order.status == 5}">주문취소</c:when>
							</c:choose>
							<br/>
							<form action="/updateStatus" method="post">
								<input type="hidden" name="id" value="${order.id}"> <input
									type="hidden" name="sellerId" value="${order.sellerId}">
								<input type="hidden" name="productId" value="${order.productId}" />
								<input type="hidden" name="url"
									value="/myOrder?currentPage=${orderList.currentPage}" /> <select
									name="status">
									<c:if test="${order.status < 2 or order.status == 3}">
										<option value="4"
											<c:if test="${order.status == 3}">selected</c:if>
											<c:if test="${order.status != 3}">disabled="disabled"</c:if>>
											구매확정</option>
										<option value="5"
											<c:if test="${order.status == 0 or order.status == 1}">selected</c:if>
											<c:if test="${order.status > 1}"> disabled="disabled"</c:if>>
											주문취소</option>
									</c:if>
									<c:if test="${order.status == 2 or order.status == 4}">
										<option selected="selected">변경불가</option>
									</c:if>
									<c:if test="${order.status == 5}">
										<option selected="selected">취소된 주문입니다.</option>
									</c:if>
								</select>
								<c:if test="${order.status < 2 or order.status == 3}">
									<button type="submit">하기</button>
								</c:if>
							</form>
							<br />
						</div>
						<div style="justify-content: right;">
							<a href="/myOrderDetail/${order.id}/${orderList.currentPage}">상세보기</a>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- 페이지 이동 버튼 -->
			<!-- 처음으로 -->
			<div style="display: flex; width: 800px; margin: auto; margin-top: 60px; justify-content: center;">
				<c:if test="${orderList.currentPage > 1}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="첫 페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=1'">처음</button>
				</c:if>
				<c:if test="${orderList.currentPage <= 1}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="첫 페이지 입니다."
						style="font-weight: bold; color: orange;">처음</button>
				</c:if>
						&nbsp;
						<!-- 10페이지 앞으로 -->
				<c:if test="${orderList.startPage > 1}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="이전 10페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=${orderList.startPage - 1}'">이전</button>
				</c:if>
				<c:if test="${orderList.startPage <= 1}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="첫 10페이지 입니다."
						style="font-weight: bold; color: orange;">이전</button>
				</c:if>
						&nbsp;&nbsp;
						<!-- 페이지 이동 버튼 -->
				<c:forEach var="i" begin="${orderList.startPage}"
					end="${orderList.endPage}" step="1">
					<c:if test="${orderList.currentPage == i }">
						<button class="btn btn-success btn-sm" type="button"
							disabled="disabled" style="font-weight: bold; color: orange;">${i}</button>
					</c:if>
					<c:if test="${orderList.currentPage != i }">
						<button class="btn btn-outline-primary btn-sm" type="button"
							onclick="location.href='/myOrder?currentPage=${i}'">${i}</button>
					</c:if>
							&nbsp;&nbsp;
						</c:forEach>
				<!-- 10페이지 뒤로 -->
				<c:if test="${orderList.endPage < orderList.totalPage}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="다음 10페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=${orderList.endPage + 1}'">다음</button>
				</c:if>
				<c:if test="${orderList.endPage >= orderList.totalPage}">
					<button class="btn btn-danger btn-sm" type="button"
						disabled="disabled" title="마지막 10페이지 입니다."
						style="font-weight: bold; color: orange;">다음</button>
				</c:if>
						&nbsp;
						<!-- 마지막으로 -->
				<c:if test="${orderList.currentPage < orderList.totalPage}">
					<button class="btn btn-outline-primary btn-sm" type="button"
						title="마지막 페이지로 이동합니다."
						onclick="location.href='/myOrder?currentPage=${orderList.totalPage}'">마지막</button>
				</c:if>
				<c:if test="${orderList.currentPage >= orderList.totalPage}">
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
</body>
	<jsp:include page="../include/footer.jsp" />
</html>