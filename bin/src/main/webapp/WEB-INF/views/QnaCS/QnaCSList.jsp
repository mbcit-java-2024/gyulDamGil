<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
<head>
    <meta charset="UTF-8">
    <title>QnA 목록</title>
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
<body>

    <h2>QnA 목록</h2>
    
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
	            <c:forEach var="qna" items="${qnaList}" >
	            	<input type="hidden" name="consumerId" value="${qna.consumerId}">
	            	<input type="hidden" name="title" value="${qna.title}">
	            	<input type="hidden" name="comment" value="${qna.comment}">
	                <tr>
	                    <td>${qna.id}</td> 
	                    <td>
	                        ${consumerId}
	                    </td>
	                    <td>
	                        <a href="QnaCSDetail?id=${qna.id}">
		                    ${qna.title}
	                        </a>
	                    </td>
	                    <td>${qna.createDate}</td>
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
				    <button onclick="location.href='QnaCSInsert'">문의글 작성</button>
				</div>
	        </tbody>
	    </table>
   	</c:if>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>