<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>    
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>귤담길</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style type="text/css">

	body::before {
	  content: "";
	  position: absolute;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-image: url('https://i.imgur.com/YCMge5r.png'); /* 배경 이미지 */
	  background-size: cover;
	  background-position: center;
	  background-attachment: fixed;
	  filter: blur(3px); /* 블러 효과 */
	  z-index: -1; /* 컨텐츠 뒤로 보내기 */
	}
	
   	.center {
  		display: flex;
  		justify-content: center;
  	}
  	
  	.search-bar {
      position: absolute;
      top: 55%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #F66F0A; 
      padding: 10px 20px;
      border-radius: 30px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
      width: 50%;
    }
    
  	.search-bar-inner {
      position: absolute;
      top: 55%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: white; 
      border: 20px solid #F66F0A;
      padding: 10px;
      border-radius: 80px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
      width: 45%;
    }

    .search-bar-inner input {
      border-radius: 80px;
      width: 90%;
      padding: 10px;
      border: none;
      font-size: 20px;
	  text-align: center;
    }
  	
  	.search-bar-inner input:focus {
	    outline: none;  /* 기본 브라우저 아웃라인 제거 */
	    border: none;   /* 테두리 제거 */
	    text-align: center;
	}
	
	/* footer 고정 스타일 */
	html, body {
	    height: 100%;
	    display: flex;
	    flex-direction: column;
	    margin: 0;
	}
	
	.wrapper {
	    flex: 1;
	    display: flex;
	    flex-direction: column;
	}
	/* footer 고정 스타일 */
	
</style>
  
<jsp:include page="../include/header.jsp"/>
</head>
<body>
<div class="wrapper">
	<%-- <jsp:include page="../search/search.jsp"></jsp:include> --%>
    <!-- <h2 class="center">상품 검색</h2> -->

    <form action="searchOK" method="get" class="center">
    <div class="search-bar-inner center">
        <input type="hidden" name="categoryId" value="0">
        <input type="text" name="title" placeholder="찾으시는 상품이 있나요?">
        <button type="submit" style="width: 30px;"><img alt="상품검색" src="/images/gdg/search.png"> </button>
    </div>
    </form>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</div>
	
<footer>
	<jsp:include page="../include/footer.jsp"/>
</footer>

</body>
</html>