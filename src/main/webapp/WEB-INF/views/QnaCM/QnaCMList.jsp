<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaCM</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
<head>
    <meta charset="UTF-8">
    <style>
        table {
            width:100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        
        a {
            text-decoration: none;
            color: black;
        }
        
    </style>
</head>
<body class="bg-gray-50">
	<div class="container mx-auto px-4 py-8">
		<div class="flex flex-col md:flex-row gap-8">
			<!-- 메뉴바 include -->
			<div>
				<jsp:include page="../include/qnaMenu.jsp"/>
			</div>
			<div class="flex-1">
			     <c:if test="${not empty message}">
				    <script>
				        alert("${message}");
				    </script>
				</c:if>
			    
			    <c:if test="${empty qnaList}">
				    <table>
				        <thead>
				            <tr>
				                <th width=5% >번호</th>
				                <th width=10%>작성자</th>
				                <th width=55%>제목</th>
				                <th width=20%>등록일</th>
				                <th width=10%>답변상태</th>
				            </tr>
				        </thead>
				        <tbody>
						    <tr>
				                <td colspan="5" style="text-align: center;">등록된 문의가 없습니다.</td>
				            </tr>
				        </tbody>
				    </table>
				</c:if>
			
			    <c:if test="${not empty qnaList}">
				    <table>
				        <thead>
				            <tr>
				                <th width=5% >번호</th>
				                <th width=10%>작성자</th>
				                <th width=55%>제목</th>
				                <th width=20%>등록일</th>
				                <th width=10%>답변상태</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach var="qna" items="${qnaList}" varStatus="status">
				            	<input type="hidden" name="consumerId" value="${qna.consumerId}">
				            	<input type="hidden" name="title" value="${qna.title}">
				            	<input type="hidden" name="comment" value="${qna.comment}">
				                <tr>
				                    <td>${status.index + 1}</td>
				                    <td>
				                        ${consumerName}
				                    </td>
				                    <td>
				                        <a href="QnaCMDetail?id=${qna.id}">
					                    ${qna.title}
				                        </a>
				                    </td>
				                    <td><fmt:formatDate value="${qna.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				                    <td>
				                    	<c:if test="${empty qna.replies}">
				                    		답변 대기
				                    	</c:if>
				                    	<c:if test="${not empty qna.replies}">
				                    		답변 완료
				                    	</c:if>
				                    	
				                    </td>
				                </tr>
				            </c:forEach>
				            <div align="right">
							    <button onclick="location.href='QnaCMInsert'">문의글 작성</button>
							</div>
				        </tbody>
				        
				    </table>
			   	</c:if>	
			</div>
		</div>
	</div>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>