<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    function showSection(sectionId) {
        // 모든 섹션 숨기기
        document.querySelectorAll('[id^="section-"]').forEach(section => {
            section.classList.add('hidden');
        });

        // 선택된 섹션 보이기
        document.getElementById(sectionId).classList.remove('hidden');

        // 활성 탭 스타일 변경
        document.querySelectorAll('[id^="tab-"]').forEach(tab => {
            tab.classList.remove('text-orange-500', 'border-orange-500');
            tab.classList.add('text-gray-500', 'border-transparent');
        });

        const activeTab = document.getElementById('tab-' + sectionId.split('-')[1]);
        if (activeTab) {
            activeTab.classList.add('text-orange-500', 'border-orange-500');
            activeTab.classList.remove('text-gray-500', 'border-transparent');
        }

        // jejugamgyul을 클릭했을 때 URL 업데이트
        if (sectionId === "section-jejugamgyul") {
            history.pushState(null, "", window.location.pathname + "#jejugamgyul");
        } else {
            history.pushState(null, "", window.location.pathname);
        }
    }

    // 페이지 로드 시, URL 해시값을 확인하여 섹션 상태 유지
    window.addEventListener("load", function () {
        if (window.location.hash === "#jejugamgyul") {
            showSection("section-jejugamgyul");
        }
    });

    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        dropdown.classList.toggle('hidden');
    }

    function toggleMobileMenu() {
        document.getElementById('mobile-menu').classList.toggle('hidden');
    }

    function toggleUserMenu() {
        document.getElementById('user-menu').classList.toggle('hidden');
    }
    function getCartCount() {
    	
    	// 1. 여기에 장바구니 개수 셀렉해오는 레스트컨트롤러 메소드 콜하는 부분 추가
    	// 로그인안하면 0
let cnt = 0; // 1. 0으로 초기화 -> .text() 하면 숫자 가져옴 
let param = {};

console.log('getCartCount:::::::::::::cnt::1:' + cnt); 

$.ajax({
    url : '/selectCartCount',
    type : 'POST', 
    dataType : "json",
    contentType:"application/json",
    data : JSON.stringify(param),
    beforeSend:function(){
        console.log('selectCartCount:::::::::beforeSend::::::::::::::::::::');
    },
    success : function(data){
        console.log('success:::::::::::111::::::::JSON.stringify(data)::::' + JSON.stringify(data));
        console.log('success:::::::::::111::::::::data.cnt::::' + data.cnt); 
        console.log('success:::::::::::111::::::::cnt::::' + cnt); 
        		
        // 2. 디비에서 받아온 값을 cnt 에 담음 
        cnt = data;
        /* if ('0' == data.code) {
        	getCartCount();
            if (!confirm($('input[name="title"]').val() + '상품이' + $('#count').val() + '개가 장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {} 
            else {
                location.href = '/cartPage';
            }
        } else {
        	if (null != data.message) {
                alert(data.message);
            }
            else {
                alert('알 수 없는 에러');
            }
        } */
    },
    error : function(request, status, error){
        console.log('responseText::::::::::::::::::::::::'+request.responseText);
    },
    complete:function(){

		console.log('getCartCount:::::::::::::cnt:2::' + cnt);
    	$('#spanCartCount').text(cnt);//  
    	// cnt = Number(cnt) + 1; // 51
    	
    	 
    }
});
}

   </script>

<!-- Top Banner -->
<div class="bg-orange-500 text-white text-sm py-1">
	<div class="container mx-auto px-4 text-center">
		<c:if test="${sessionScope.userType != 2}">
			<a href="/signIn/2" class="hover:underline">판매자 입점 신청하기 →</a>
		</c:if>
		&nbsp;
	</div>
</div>

<!-- Header -->
<header class="top-0 z-50 bg-white border-b">
	<div class="container mx-auto px-4">
		<!-- Upper Header -->
		<div class="flex items-center justify-between py-2 border-b">
			<div class="flex items-center">
				<button class="md:hidden mr-4" onclick="toggleMobileMenu()">
					<svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    	<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
					</svg>
				</button>
				<h1 class="text-2xl font-bold text-orange-500">
					<img alt="귤담길" src="/images/gdg/gdgLogo.png" onclick="location.href='/'" style="width: 120px;">
				</h1>
			</div>

			<div class="flex items-center space-x-4">
				<div class="relative hidden md:block">
				 <form action="searchOK" method="get" class="center">
			        <input type="hidden" name="categoryId" value="0">
					<input type="text" name="title" placeholder="상품 또는 농가를 검색하세요"
						class="w-64 px-4 py-1 border rounded-full text-sm focus:outline-none focus:ring-2 focus:ring-orange-500">
					<button type="submit" class="absolute right-3 top-1/2 transform -translate-y-1/2">
						<svg class="h-4 w-4 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
					</button>
			    </form>
				</div>
				<div class="flex items-center space-x-3">
					<button onclick="toggleUserMenu()"
						class="text-sm hover:text-orange-500">
						<c:if test="${empty sessionScope.userVO}">로그인</c:if>
						<c:if test="${not empty sessionScope.userVO}">${sessionScope.userVO.userId }님</c:if>
					</button>
					<button class="hover:text-orange-500 relative">
						<c:if test="${not empty sessionScope.userVO}">
						<svg onclick="location.href='/cartPage'" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        	<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
							<span id="spanCartCount"
							class="absolute -top-2 -right-2 bg-orange-500 text-white text-xs rounded-full w-4 h-4 flex items-center justify-center">0</span>
						</c:if>
					</button>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->
		<nav class="md:block py-3">
			<ul class="flex items-center space-x-8">
				<li>
					<button id="tab-home" onclick="location.href='/'"
						class="px-4 py-2 font-medium border-b-2 border-transparent text-gray-500 hover:text-orange-500">
						홈</button>
				</li>
				<li>
					<button id="tab-about" onclick="location.href='/info'"
						class="px-4 py-2 font-medium border-b-2 border-transparent  hover:text-orange-500">
						귤담길 소개</button>
				</li>
				<li>
					<button id="tab-shop" onclick="location.href='/jejugamgyulList/0'"
						class="px-4 py-2 font-medium border-b-2 border-orange-500 hover:text-orange-500">
						귤담기</button>
				</li>
				<li>
					<button id="tab-farms" onclick="location.href='/farms'"
						class="px-4 py-2 font-medium border-b-2 border-transparent hover:text-orange-500">
						귤농가들</button>
				</li>
				<c:if test="${sessionScope.userType == 1}">
					<li><a onclick="location.href='/myOrder'"
						class="block hover:text-orange-500" style="cursor: pointer;">주문 목록</a></li>
				</c:if>
				<c:if test="${sessionScope.userType == 2}">
					<li><a onclick="location.href='/sellerList'"
						class="block hover:text-orange-500" style="cursor: pointer;">내 상품보기</a></li>
					<li><a onclick="location.href='/insert'"
						class="block hover:text-orange-500" style="cursor: pointer;">상품 등록</a></li>
					<li><a onclick="location.href='/orderList'"
						class="block hover:text-orange-500" style="cursor: pointer;">주문 목록</a></li>
				</c:if>
				<li>
					<button id="tab-qna" onclick="location.href='/faq'"
						class="px-4 py-2 font-medium border-b-2 border-orange-500 hover:text-orange-500">
						고객센터</button>
				</li>
			</ul>
		</nav>
	</div>
</header>

<!-- Mobile Menu -->
<div id="mobile-menu" class="md:hidden hidden bg-white border-b">
	<nav class="container mx-auto px-4 py-4">
		<ul class="space-y-4">
			<li><a
				href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
				onclick="location.href='/'" class="block hover:text-orange-500">홈</a></li>
			<li><a
				href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
				onclick="location.href='/info'" class="block hover:text-orange-500">귤담길 소개</a></li>
			<li><a
				href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
				onclick="location.href='/jejugamgyulList/1'"
				class="block hover:text-orange-500">귤담기</a></li>
			<li><a
				href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
				href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
				onclick="showSection(&#39;section-farms&#39;)"
				class="block hover:text-orange-500">입점 농가</a></li>

			<c:if test="${sessionScope.userType == 2}">
				<li><a
					href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
					onclick="location.href='/sellerList'"
					class="block hover:text-orange-500">내 상품보기</a></li>
				<li><a
					href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
					onclick="location.href='/insert'"
					class="block hover:text-orange-500">상품 등록</a></li>
			</c:if>
		</ul>
	</nav>
</div>



<!-- User Menu Dropdown -->
<div id="user-menu"
	class="hidden fixed top-16 right-4 w-48 bg-white rounded-lg shadow-lg py-2 z-50">
	<c:if test="${empty sessionScope.userVO}">
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="location.href='/login/1'"
			class="block px-4 py-2 hover:bg-orange-50">로그인</a>
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="location.href='/signIn/1'"
			class="block px-4 py-2 hover:bg-orange-50">회원가입</a>
	</c:if>
	<c:if test="${not empty sessionScope.userVO}">
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="location.href='/cartPage'"
			class="block px-4 py-2 hover:bg-orange-50">귤바구니</a>
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="" class="block px-4 py-2 hover:bg-orange-50">주문/배송 조회</a>
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="location.href='/bookmark'"
			class="block px-4 py-2 hover:bg-orange-50">즐겨찾기</a>
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="location.href='/myInfo'"
			class="block px-4 py-2 hover:bg-orange-50">개인정보 수정</a>
		<hr class="my-2">
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="location.href='/logout'"
			class="block px-4 py-2 hover:bg-orange-50">로그아웃</a>
	</c:if>
</div>
		<script>
        getCartCount(); // 헤더 포함된 페이지들이 로드될때 이 메소드 실행 그러고 나서 버튼 누르는 부분에 이걸 넣으면 숫자가 바뀜
        </script>
</head>