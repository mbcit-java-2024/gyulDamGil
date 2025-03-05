<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- <style>*, ::before, ::after{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:rgb(59 130 246 / 0.5);--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }::backdrop{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:rgb(59 130 246 / 0.5);--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }/* ! tailwindcss v3.4.16 | MIT License | https://tailwindcss.com */*,::after,::before{box-sizing:border-box;border-width:0;border-style:solid;border-color:#e5e7eb}::after,::before{--tw-content:''}:host,html{line-height:1.5;-webkit-text-size-adjust:100%;-moz-tab-size:4;tab-size:4;font-family:ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";font-feature-settings:normal;font-variation-settings:normal;-webkit-tap-highlight-color:transparent}body{margin:0;line-height:inherit}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline dotted;text-decoration:underline dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,pre,samp{font-family:ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;font-feature-settings:normal;font-variation-settings:normal;font-size:1em}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}button,input,optgroup,select,textarea{font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;letter-spacing:inherit;color:inherit;margin:0;padding:0}button,select{text-transform:none}button,input:where([type=button]),input:where([type=reset]),input:where([type=submit]){-webkit-appearance:button;background-color:transparent;background-image:none}:-moz-focusring{outline:auto}:-moz-ui-invalid{box-shadow:none}progress{vertical-align:baseline}::-webkit-inner-spin-button,::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}summary{display:list-item}blockquote,dd,dl,figure,h1,h2,h3,h4,h5,h6,hr,p,pre{margin:0}fieldset{margin:0;padding:0}legend{padding:0}menu,ol,ul{list-style:none;margin:0;padding:0}dialog{padding:0}textarea{resize:vertical}input::placeholder,textarea::placeholder{opacity:1;color:#9ca3af}[role=button],button{cursor:pointer}:disabled{cursor:default}audio,canvas,embed,iframe,img,object,svg,video{display:block;vertical-align:middle}img,video{max-width:100%;height:auto}[hidden]:where(:not([hidden=until-found])){display:none}.container{width:100%}@media (min-width: 640px){.container{max-width:640px}}@media (min-width: 768px){.container{max-width:768px}}@media (min-width: 1024px){.container{max-width:1024px}}@media (min-width: 1280px){.container{max-width:1280px}}@media (min-width: 1536px){.container{max-width:1536px}}.fixed{position:fixed}.absolute{position:absolute}.relative{position:relative}.sticky{position:sticky}.-right-2{right:-0.5rem}.-top-2{top:-0.5rem}.right-3{right:0.75rem}.right-4{right:1rem}.top-0{top:0px}.top-1\/2{top:50%}.top-16{top:4rem}.z-50{z-index:50}.mx-auto{margin-left:auto;margin-right:auto}.my-2{margin-top:0.5rem;margin-bottom:0.5rem}.mb-12{margin-bottom:3rem}.mb-2{margin-bottom:0.5rem}.mb-4{margin-bottom:1rem}.mb-6{margin-bottom:1.5rem}.mb-8{margin-bottom:2rem}.mr-4{margin-right:1rem}.mt-12{margin-top:3rem}.mt-4{margin-top:1rem}.block{display:block}.flex{display:flex}.grid{display:grid}.hidden{display:none}.h-4{height:1rem}.h-48{height:12rem}.h-5{height:1.25rem}.h-6{height:1.5rem}.min-h-screen{min-height:100vh}.w-4{width:1rem}.w-48{width:12rem}.w-5{width:1.25rem}.w-6{width:1.5rem}.w-64{width:16rem}.w-full{width:100%}.max-w-4xl{max-width:56rem}.max-w-none{max-width:none}.flex-1{flex:1 1 0%}.-translate-y-1\/2{--tw-translate-y:-50%;transform:translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}.transform{transform:translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}.cursor-pointer{cursor:pointer}.list-inside{list-style-position:inside}.list-disc{list-style-type:disc}.grid-cols-1{grid-template-columns:repeat(1, minmax(0, 1fr))}.flex-col{flex-direction:column}.items-center{align-items:center}.justify-center{justify-content:center}.justify-between{justify-content:space-between}.gap-6{gap:1.5rem}.gap-8{gap:2rem}.space-x-3 > :not([hidden]) ~ :not([hidden]){--tw-space-x-reverse:0;margin-right:calc(0.75rem * var(--tw-space-x-reverse));margin-left:calc(0.75rem * calc(1 - var(--tw-space-x-reverse)))}.space-x-4 > :not([hidden]) ~ :not([hidden]){--tw-space-x-reverse:0;margin-right:calc(1rem * var(--tw-space-x-reverse));margin-left:calc(1rem * calc(1 - var(--tw-space-x-reverse)))}.space-x-8 > :not([hidden]) ~ :not([hidden]){--tw-space-x-reverse:0;margin-right:calc(2rem * var(--tw-space-x-reverse));margin-left:calc(2rem * calc(1 - var(--tw-space-x-reverse)))}.space-y-2 > :not([hidden]) ~ :not([hidden]){--tw-space-y-reverse:0;margin-top:calc(0.5rem * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(0.5rem * var(--tw-space-y-reverse))}.space-y-4 > :not([hidden]) ~ :not([hidden]){--tw-space-y-reverse:0;margin-top:calc(1rem * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(1rem * var(--tw-space-y-reverse))}.overflow-hidden{overflow:hidden}.rounded-full{border-radius:9999px}.rounded-lg{border-radius:0.5rem}.rounded-xl{border-radius:0.75rem}.border{border-width:1px}.border-b{border-bottom-width:1px}.border-b-2{border-bottom-width:2px}.border-orange-500{--tw-border-opacity:1;border-color:rgb(249 115 22 / var(--tw-border-opacity, 1))}.border-transparent{border-color:transparent}.bg-gray-200{--tw-bg-opacity:1;background-color:rgb(229 231 235 / var(--tw-bg-opacity, 1))}.bg-gray-50{--tw-bg-opacity:1;background-color:rgb(249 250 251 / var(--tw-bg-opacity, 1))}.bg-gray-800{--tw-bg-opacity:1;background-color:rgb(31 41 55 / var(--tw-bg-opacity, 1))}.bg-orange-100{--tw-bg-opacity:1;background-color:rgb(255 237 213 / var(--tw-bg-opacity, 1))}.bg-orange-500{--tw-bg-opacity:1;background-color:rgb(249 115 22 / var(--tw-bg-opacity, 1))}.bg-white{--tw-bg-opacity:1;background-color:rgb(255 255 255 / var(--tw-bg-opacity, 1))}.p-4{padding:1rem}.p-6{padding:1.5rem}.p-8{padding:2rem}.px-4{padding-left:1rem;padding-right:1rem}.px-6{padding-left:1.5rem;padding-right:1.5rem}.py-1{padding-top:0.25rem;padding-bottom:0.25rem}.py-2{padding-top:0.5rem;padding-bottom:0.5rem}.py-3{padding-top:0.75rem;padding-bottom:0.75rem}.py-4{padding-top:1rem;padding-bottom:1rem}.py-8{padding-top:2rem;padding-bottom:2rem}.pl-4{padding-left:1rem}.text-center{text-align:center}.text-2xl{font-size:1.5rem;line-height:2rem}.text-3xl{font-size:1.875rem;line-height:2.25rem}.text-4xl{font-size:2.25rem;line-height:2.5rem}.text-lg{font-size:1.125rem;line-height:1.75rem}.text-sm{font-size:0.875rem;line-height:1.25rem}.text-xl{font-size:1.25rem;line-height:1.75rem}.text-xs{font-size:0.75rem;line-height:1rem}.font-bold{font-weight:700}.font-medium{font-weight:500}.font-semibold{font-weight:600}.text-gray-500{--tw-text-opacity:1;color:rgb(107 114 128 / var(--tw-text-opacity, 1))}.text-gray-600{--tw-text-opacity:1;color:rgb(75 85 99 / var(--tw-text-opacity, 1))}.text-orange-500{--tw-text-opacity:1;color:rgb(249 115 22 / var(--tw-text-opacity, 1))}.text-white{--tw-text-opacity:1;color:rgb(255 255 255 / var(--tw-text-opacity, 1))}.shadow{--tw-shadow:0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);--tw-shadow-colored:0 1px 3px 0 var(--tw-shadow-color), 0 1px 2px -1px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)}.shadow-lg{--tw-shadow:0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);--tw-shadow-colored:0 10px 15px -3px var(--tw-shadow-color), 0 4px 6px -4px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)}.shadow-md{--tw-shadow:0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);--tw-shadow-colored:0 4px 6px -1px var(--tw-shadow-color), 0 2px 4px -2px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)}.transition-colors{transition-property:color, background-color, border-color, fill, stroke, -webkit-text-decoration-color;transition-property:color, background-color, border-color, text-decoration-color, fill, stroke;transition-property:color, background-color, border-color, text-decoration-color, fill, stroke, -webkit-text-decoration-color;transition-timing-function:cubic-bezier(0.4, 0, 0.2, 1);transition-duration:150ms}.hover\:bg-orange-50:hover{--tw-bg-opacity:1;background-color:rgb(255 247 237 / var(--tw-bg-opacity, 1))}.hover\:bg-orange-600:hover{--tw-bg-opacity:1;background-color:rgb(234 88 12 / var(--tw-bg-opacity, 1))}.hover\:text-orange-300:hover{--tw-text-opacity:1;color:rgb(253 186 116 / var(--tw-text-opacity, 1))}.hover\:text-orange-500:hover{--tw-text-opacity:1;color:rgb(249 115 22 / var(--tw-text-opacity, 1))}.hover\:text-orange-600:hover{--tw-text-opacity:1;color:rgb(234 88 12 / var(--tw-text-opacity, 1))}.hover\:underline:hover{-webkit-text-decoration-line:underline;text-decoration-line:underline}.focus\:outline-none:focus{outline:2px solid transparent;outline-offset:2px}.focus\:ring-2:focus{--tw-ring-offset-shadow:var(--tw-ring-inset) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);--tw-ring-shadow:var(--tw-ring-inset) 0 0 0 calc(2px + var(--tw-ring-offset-width)) var(--tw-ring-color);box-shadow:var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow, 0 0 #0000)}.focus\:ring-orange-500:focus{--tw-ring-opacity:1;--tw-ring-color:rgb(249 115 22 / var(--tw-ring-opacity, 1))}@media (min-width: 768px){.md\:block{display:block}.md\:hidden{display:none}.md\:w-64{width:16rem}.md\:grid-cols-2{grid-template-columns:repeat(2, minmax(0, 1fr))}.md\:grid-cols-3{grid-template-columns:repeat(3, minmax(0, 1fr))}.md\:grid-cols-4{grid-template-columns:repeat(4, minmax(0, 1fr))}.md\:flex-row{flex-direction:row}}</style> -->
<!-- <link rel="stylesheet" type="text/css" href="resources/css/headerStyle.css"> -->
</head>
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
   </script>

<!-- Top Banner -->
<div class="bg-orange-500 text-white text-sm py-1">
	<div class="container mx-auto px-4 text-center">
		<a href="/signIn/2" class="hover:underline">판매자 입점 신청하기 →</a>
	</div>
</div>

<!-- Header -->
<header class="sticky top-0 z-50 bg-white border-b">
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
					<a href="/">귤담길</a>
				</h1>
			</div>

			<div class="flex items-center space-x-4">
				<div class="relative hidden md:block">
					<input type="text" placeholder="상품 또는 농가를 검색하세요"
						class="w-64 px-4 py-1 border rounded-full text-sm focus:outline-none focus:ring-2 focus:ring-orange-500">
					<button class="absolute right-3 top-1/2 transform -translate-y-1/2">
						<svg class="h-4 w-4 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
					</button>
				</div>
				<div class="flex items-center space-x-3">
					<button onclick="toggleUserMenu()"
						class="text-sm hover:text-orange-500">
						<c:if test="${empty sessionScope.userVO}">로그인</c:if>
						<c:if test="${not empty sessionScope.userVO}">${sessionScope.userVO.userId }님</c:if>
					</button>
					<button class="hover:text-orange-500 relative">
						<svg onclick="location.href='/cartPage'" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        	<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
						<span class="absolute -top-2 -right-2 bg-orange-500 text-white text-xs rounded-full w-4 h-4 flex items-center justify-center">0</span>
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
					<button id="tab-about" onclick="showSection('section-about')"
						class="px-4 py-2 font-medium border-b-2 border-transparent  hover:text-orange-500">
						귤담길 소개</button>
				</li>
				<li>
					<button id="tab-shop" onclick="location.href='/jejugamgyulList/1'"
						class="px-4 py-2 font-medium border-b-2 border-orange-500 hover:text-orange-500">
						쇼핑</button>
				</li>
				<li>
					<button id="tab-farms"
						onclick="showSection(&#39;section-farms&#39;)"
						class="px-4 py-2 font-medium border-b-2 border-transparent text-gray-500 hover:text-orange-500">
						입점 농가</button>
				</li>
				<c:if test="${sessionScope.userType == 1}">
					<li><a onclick="location.href='/myOrder'"
						class="block hover:text-orange-500">주문 목록</a></li>
				</c:if>
				<c:if test="${sessionScope.userType == 2}">
					<li><a onclick="location.href='/sellerList'"
						class="block hover:text-orange-500">내 상품보기</a></li>
					<li><a onclick="location.href='/insert'"
						class="block hover:text-orange-500">상품 등록</a></li>
					<li><a onclick="location.href='/orderList'"
						class="block hover:text-orange-500">주문 목록</a></li>
				</c:if>
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
				class="block hover:text-orange-500">쇼핑</a></li>
			<li><a
				href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
				onclick="showSection(&#39;section-reservation&#39;)"
				class="block hover:text-orange-500">체험예약</a></li>
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




<!-- Reservation Section -->
<div id="section-reservation" class="hidden container mx-auto px-4 py-8">
	<h2 class="text-3xl font-bold mb-8">체험 예약</h2>
	<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
		<!-- Farm Experience -->
		<div class="bg-white rounded-lg shadow-md p-6">
			<h3 class="text-xl font-semibold mb-4">귤 따기 체험</h3>
			<p class="text-gray-600 mb-4">제주 귤농장에서 직접 귤을 따보는 특별한 체험을 해보세요.</p>
			<div class="mb-4">
				<h4 class="font-medium mb-2">체험 내용</h4>
				<ul class="list-disc list-inside text-gray-600">
					<li>귤 따기 체험 (1시간)</li>
					<li>귤 시식</li>
					<li>농장 투어</li>
				</ul>
			</div>
			<button
				class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600">
				예약하기</button>
		</div>

		<!-- Farm Stay -->
		<div class="bg-white rounded-lg shadow-md p-6">
			<h3 class="text-xl font-semibold mb-4">귤밭 숙소</h3>
			<p class="text-gray-600 mb-4">귤밭 한가운데서 특별한 하룻밤을 보내보세요.</p>
			<div class="mb-4">
				<h4 class="font-medium mb-2">숙소 정보</h4>
				<ul class="list-disc list-inside text-gray-600">
					<li>최대 4인 수용</li>
					<li>조식 제공</li>
					<li>귤밭 뷰</li>
				</ul>
			</div>
			<button
				class="w-full bg-orange-500 text-white py-2 rounded-lg hover:bg-orange-600">
				예약하기</button>
		</div>
	</div>
</div>

<!-- Farms Section -->
<div id="section-farms" class="hidden container mx-auto px-4 py-8">
	<h2 class="text-3xl font-bold mb-8">입점 농가 소개</h2>
	<div class="grid grid-cols-1 md:grid-cols-3 gap-8">
		<!-- Farm Card -->
		<div class="bg-white rounded-lg shadow-md overflow-hidden">
			<div class="h-48 bg-gray-200"></div>
			<div class="p-6">
				<h3 class="font-semibold mb-2">한라농원</h3>
				<p class="text-gray-600 mb-4">3대째 이어오는 제주 감귤 농장입니다.</p>
				<div class="flex justify-between items-center">
					<span class="text-sm text-gray-500">제주시 한림읍</span>
					<button class="text-orange-500 hover:text-orange-600">자세히
						보기 →</button>
				</div>
			</div>
		</div>
		<!-- More farm cards... -->
	</div>
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
			class="block px-4 py-2 hover:bg-orange-50">장바구니</a>
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
			onclick="" class="block px-4 py-2 hover:bg-orange-50">주문/배송 조회</a>
		<a
			href="file:///C:/Users/hi/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/%EC%A0%9C%EC%A3%BC%20%EA%B7%A4%20%EC%A7%81%EA%B1%B0%EB%9E%98%20%ED%8E%98%EC%9D%B4%EC%A7%80.html#"
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