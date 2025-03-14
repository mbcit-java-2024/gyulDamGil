<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 답글달기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<jsp:include page="../include/header.jsp"/>
<style>
	
	
	.first-table th {
	    background-color: #ffcc99;
	    color: black; 
	    padding: 10px;
	}

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn-list {
        background-color: #ffcc99;
        color: black;
    }

    .btn-list:hover {
        background-color: #ff7f00;
    }

    .btn-reply {
        background-color: #ffcc99;
        color: black;
    }

    .btn-reply:hover {
        background-color: #ff7f00;
    }
</style>

</head>
<body>
    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>
    </c:if>

    <table class="first-table" width="900" border="1" align="center" cellpadding="3" cellspacing="2">
	    <tr>
	        <th width="80">작성자</th>
	        <td width="520">${consumerUserId}</td>
	        <th width="80">작성일</th>
	        <td width="200"><fmt:formatDate value="${qnaCMVO.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
	    </tr>
	    <tr>
	        <th width="80">제목</th>
	        <td colspan="3">${qnaCMVO.title}</td>
	    </tr>
	    <tr>
	        <th width="80" height="300">내용</th>
	        <td colspan="3" valign="top">${qnaCMVO.comment}</td>
	    </tr>
	</table>
	
	<div style="width: 900px; margin: 20px auto; text-align: right;">
    	 <input type="button" value="목록으로" class="btn btn-list" onclick="location.href='/QnaCMList';" />
	</div>
    
    <br/><br/>
    
    <table width="900" border="1" align="center" cellpadding="3" cellspacing="2">
        <c:if test="${empty replies}">
            <tr>
                <td>답변이 등록되지 않았습니다.</td>
            </tr>
            <br/><br/>
            <form action="QnaCMReplyInsert" method="post">
                <table width="900" border="0" align="center" cellpadding="2" cellspacing="0">
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center;">
                                <textarea name="comment" style="width: 805px; height: 80px; margin-right: 10px;"></textarea>
                                <input type="hidden" name="parentId" value="${qnaCMVO.id}" />
                                <input type="submit" value="답변 달기" class="btn btn-reply"  style="height: 80px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
        
        <c:if test="${not empty replies}">
            <c:forEach var="reply" items="${replies}">
	            <tr>
			        <th width="80">${reply.consumerId}</th>
			        <td width="750">${reply.comment}</td>
			        <td width="170"><fmt:formatDate value="${qnaCMVO.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
			    </tr>
            </c:forEach>
            <form action="QnaCMReplyInsert" method="post">
                <table width="900" border="0" align="center" cellpadding="2" cellspacing="0">
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center;">
                                <textarea name="comment" style="width: 805px; height: 80px; margin-right: 10px;"></textarea>
                                
                                <input type="hidden" name="consumerId" value="${qnaCMVO.consumerId}" /> <!-- 로그인후 session에서 정보꺼내오기 consumerId -> sessionScope.id -->
                                <input type="hidden" name="parentId" value="${qnaCMVO.id}" />
                                <input type="hidden" name="replies" value="${qnaCMVO.replies }">
                                <input type="submit" value="답변 달기" class="btn btn-reply"  style="height: 80px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
    </table>
</body>
<jsp:include page="../include/footer.jsp"/>
</html>
