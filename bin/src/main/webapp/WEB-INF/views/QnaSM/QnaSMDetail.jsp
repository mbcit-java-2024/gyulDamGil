<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 답글달기</title>
</head>
<body>
    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>
    </c:if>

    <table width="900" border="1" align="center" cellpadding="3" cellspacing="2">
	    <tr>
	        <th width="80">작성자</th>
	        <td width="520">${qnaSMVO.sellerId}</td>
	        <th width="80">작성일</th>
	        <td width="200"><fmt:formatDate value="${qnaSMVO.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
	    </tr>
	    <tr>
	        <th width="80">제목</th>
	        <td colspan="3">${qnaSMVO.title}</td>
	    </tr>
	    <tr>
	        <th width="80" height="300">내용</th>
	        <td colspan="3" valign="top">${qnaSMVO.comment}</td>
	    </tr>
	</table>

    <table width="900" border="0" align="center" cellpadding="3" cellspacing="2">
        <tr>
            <td style="text-align: right;">
                <input type="button" value="목록으로" onclick="location.href='/QnaSMList';" />
            </td>
        </tr>
    </table>
    
    <br/><br/>
    
    <table width="900" border="1" align="center" cellpadding="3" cellspacing="2">
        <c:if test="${empty replies}">
            <tr>
                <td>답변이 등록되지 않았습니다.</td>
            </tr>
            <br/><br/>
            <form action="QnaSMReplyInsert" method="post">
                <table width="900" border="0" align="center" cellpadding="2" cellspacing="0">
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center;">
                                <textarea name="comment" style="width: 805px; height: 80px; margin-right: 10px;"></textarea>
                                <input type="hidden" name="parentId" value="${qnaSMVO.idx}" />
                                <input type="submit" value="답변 달기" style="height: 80px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
        
        <c:if test="${not empty replies}">
            <c:forEach var="reply" items="${replies}">
	            <tr>
			        <th width="80">${reply.sellerId}</th>
			        <td width="750">${reply.comment}</td>
			        <td width="170"><fmt:formatDate value="${qnaSMVO.createDate}" pattern="yyyy-MM-dd HH:mm" /></td>
			    </tr>
            </c:forEach>
            <form action="QnaSMReplyInsert" method="post">
                <table width="900" border="0" align="center" cellpadding="2" cellspacing="0">
                    <tr>
                        <td>
                            <div style="display: flex; align-items: center;">
                                <textarea name="comment" style="width: 805px; height: 80px; margin-right: 10px;"></textarea>
                                
                                <input type="hidden" name="sellerId" value="${qnaSMVO.sellerId}" /> <!-- 로그인후 session에서 정보꺼내오기 consumerId -> sessionScope.id -->
                                <input type="hidden" name="parentId" value="${qnaSMVO.idx}" />
                                <input type="hidden" name="replies" value="${qnaSMVO.replies }">
                                <input type="submit" value="답변 달기" style="height: 80px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
    </table>
</body>
</html>
