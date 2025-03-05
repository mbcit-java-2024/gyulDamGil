<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입-판매자</title>
<script type="text/javascript" src="/js/signIn_2.js" defer="defer"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
	crossorigin="anonymous"></script>
</head>

<body>

<h4>/seller/signIn_2.jsp</h4>

<br/>

<form action="/sellerSignIn" method="post" onsubmit="return subCheck2();">
<table width="500" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="2">회원가입</th>
		</tr>
		<tr>
			<th width="150">이름</th>
			<td width="350">
				<input type="text" name="name" placeholder="이름을 입력하세요" required="required">
			</td>
		</tr>
		<tr>
			<th width="150">아이디</th>
			<td width="350">
				<input id="userId" type="text" name="userId" placeholder="아이디를 입력하세요" required="required">
				<input type="button" value="중복확인" onclick="confirmCheck(2)" required="required">
				<div id="result"></div>
			</td>
		</tr>
		<tr>
			<th width="150">비밀번호</th>
			<td width="350">
				<input type="password" name="password" placeholder="비밀번호를 입력하세요" required="required">
			</td>
		</tr>
		<tr>
			<th width="150">비밀번호 확인</th>
			<td width="350">
				<input type="password" name="password2" placeholder="비밀번호를 한 번 더 입력하세요"
					onkeyup="return pwCh(this)" required="required">
				<div id="checkMsg"></div>
			</td>
		</tr>
		<tr>
			<th width="150">전화번호</th>
			<td width="350">
				<input type="text" name="phone" 
					placeholder="'-'를 제외하고 입력하세요" 
					required="required"
					maxlength="11"
					min="">
			</td>
		</tr>
		<tr>
			<th width="150">이메일</th>
			<td width="350">
				<input type="email" name="email" placeholder="email을 입력하세요" required="required">
			</td>
		</tr>
		<tr>
			<th width="150">사업자등록번호</th>
			<td width="350">
				<input type="text" name="bussinessNumber" 
					placeholder="'-'를 제외하고 입력하세요" 
					onkeyup="bnCheck(this)"
					required="required"
					maxlength="10">
				<div id="checkBnMsg"></div>
			</td>
		</tr>
		<tr>
			<th width="150">농장이름</th>
			<td width="350">
				<input id="farmName" type="text" name="farmName" placeholder="농장이름을 입력하세요" required="required">
				<input type="button" value="중복확인" onclick="farmNameCheck()" required="required">
				<div id="result2"></div>
			</td>
		</tr>
		<tr>
			<th width="150">주소</th>
			<td width="350">
				<input type="text" name="address" placeholder="주소를 입력하세요" required="required">
				<input type="text" name="detailAddress" placeholder="상세 주소를 입력하세요 (예: 건물명, 층수, 동, 호)" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				개인정보 이용 동의 <br/>
				동의함<input type="radio" name="agree" value="yes" required="required"  onclick="agreeCheck(1)">
				동의하지 않음<input type="radio" name="agree" checked="checked" value="no" onclick="agreeCheck(2)">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>


</body>
</html>