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
	<div class="center" style="margin-top: 18%; margin-bottom: 10px;">
		<div style="font-weight: bold; color: #F66F0A; font-size: 30px;">회원가입이 완료되었습니다.</div>
		<br/>
	</div>
	<div class="center" style="margin-top: 5%; margin-bottom: 10px;">
		<a href='/login/2' style="color: #ccc">로그인하러 가기</a>
		<br/>
	</div>
		
</div>
	
<img alt="" src="https://i.imgur.com/TQTOWg2.png">	
<footer class="bg-gray-800 text-white py-8">
	<div class="container mx-auto px-4">
		<div class="grid grid-cols-1 md:grid-cols-4 gap-8">
			<div>
				<h5 class="font-bold mb-4">고객센터</h5>
				<p>1588-0000</p>
				<p>평일 09:00 am - 06:00 pm</p>
			</div>
			<div>
				<h5 class="font-bold mb-4">회사소개</h5>
				<ul class="space-y-2">
					<li class="hover:text-orange-300 cursor-pointer">회사소개</li>
					<li class="hover:text-orange-300 cursor-pointer">이용약관</li>
					<li class="hover:text-orange-300 cursor-pointer">개인정보처리방침</li>
				</ul>
			</div>
			<div>
				<h5 class="font-bold mb-4">입점문의</h5>
				<a href="/signIn/2" class="space-y-2 hover:text-orange-300 cursor-pointer" style="color: white">판매자 입점</a>
			</div>
			<div>
				<h5 class="font-bold mb-4">SNS</h5>
				<div class="flex space-x-4">
					<span class="hover:text-orange-300 cursor-pointer">
					<svg style="margin-bottom: 10px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
  						<path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"/>
					</svg>@gyuldamgil</span>
					<span class="hover:text-orange-300 cursor-pointer">
					<svg style="margin-bottom: 10px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
  						<path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
					</svg>GyulDamGil</span>
				</div>
			</div>
		</div>
	</div>
</footer>
</body>
</html>
