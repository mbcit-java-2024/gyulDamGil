<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <style>
        table {
            width: 100%;
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
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <jsp:include page="../include/header.jsp"/>
</head>
<body>

    <h2>상품 검색</h2>

    <div>
    <form action="searchOK" method="get">
        <input type="text" name="title" placeholder="상품명 검색">
        <input type="hidden" name="categoryId" value="0"> <!-- 기본 값은 0으로 설정 -->
        <button type="submit">검색</button>
    </form>
	</div>

</body>
<jsp:include page="../include/footer.jsp"/>
</html>