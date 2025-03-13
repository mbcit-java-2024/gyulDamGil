let ch1 = 0;
let ch2 = 0;
let ch3 = 0;
let ch4 = 0;
function confirmCheck(i) {
	console.log("confirmCheck() 실행");
	let userid = document.getElementById('userId').value.trim()
	let result = document.getElementById('result')
	console.log("userid: " + userid);
	
	$.ajax({
		url: "/idCheck/"+i,
		type: "POST",
		data: {
			userId : userid
		},
		success: function (check) {
			console.log("result: " + check)
			console.log(typeof check)
			if (userid.length === 0) {
							result.innerHTML = '<span style="color: #F89D00;">아이디 중복검사를 진행하세요.</span>'
						} else if (check === 1){
							result.innerHTML = 
							'<span style="color: red;">' + userid +'는(은) 사용할 수 없는 아이디입니다.</span>'
						//	아이디를 입력하지 않았거나 사용중인 아이디일 경우 아이디를 다시 입력할 수 있도록 아이디 입력 상자의 내용을 지우고
						// 	focus를 이동시킨다.
							ch1 = 0;
							document.getElementById('userId').value = '' 
							document.getElementById('userId').focus()  
						} else {
							ch1 = 1;
							result.innerHTML = 
							'<span style="color: green;">' + userid +'는(은) 사용할 수 있는 아이디입니다.</span>'
							document.getElementsByName('password')[0].focus()  
							//+ '&nbsp;&nbsp; <input type="button" value="사용하기" onclick="insertID( \''+userid+'\')"/>'
						}
        },
        error: function () {
			console.log("값이 안넘어감")
        } 
	})
		
}

function insertID(id){
//	console.log(id)
//	중복 검사를 통과한 아이디를 부모 창으로 넘기고 부모 창의 비밀번호에 포거스를 위치시킨다.
//	opener.document.getElementsByName('userid')[0].value = id 
	opener.document.getElementsByName('password')[0].focus()  

//	중복 검사 창을 닫는다.
	self.close()
}

function pwCh(obj){
	console.log("pwCh() 실행");
	let pw1 = document.getElementsByName('password')[0].value
	let pw2 = obj.value
//	console.log(pw1)
//	console.log(pw2)
	let msg = document.querySelector('#checkMsg')
//	console.log(msg)
	
	if (pw1 == pw2){
		msg.innerHTML = '<span style="color: green;"> 비밀번호가 일치합니다.</span>'
	}else{
		msg.innerHTML = '<span style="color: red;"> 비밀번호가 일치하지않습니다.</span>'
	}
	
}

function farmNameCheck() {
	console.log("farmNameCheck() 실행");
	let farmName = document.getElementById('farmName').value.trim()
	let result = document.getElementById('result2')
	console.log("farmName: " + farmName);
	
	$.ajax({
		url: "/farmNameCheck",
		type: "POST",
		data: {
			farmName : farmName
		},
		success: function (check) {
			console.log("result: " + check)
			if (farmName.length === 0) {
							result.innerHTML = '<span style="color: blue;">중복 검사할 농장이름을 입력하세요.</span>'
						} else if (check == 1){
							result.innerHTML = 
							'<span style="color: red;">' + farmName +'는(은) 사용할 수 없는 이름입니다.</span>'
						//	아이디를 입력하지 않았거나 사용중인 아이디일 경우 아이디를 다시 입력할 수 있도록 아이디 입력 상자의 내용을 지우고
						// 	focus를 이동시킨다.
							document.getElementById('farmName').value = '' 
							document.getElementById('farmName').focus()  
							ch2 = 0;
						} else {
							ch2=1;
							result.innerHTML = 
							'<span style="color: green;">' + farmName +'는(은) 사용할 수 있는 이름입니다.</span>'
							document.getElementsByName('address')[0].focus()  
							//+ '&nbsp;&nbsp; <input type="button" value="사용하기" onclick="insertID( \''+userid+'\')"/>'
						}
        },
        error: function () {
			console.log("값이 안넘어감")
        } 
	})
		
}

function agreeCheck(i) {
	console.log("agreeCheck() 실행")
	if ( i === 1){
		ch3 = 1;
	} else {
		ch3 = 0;
	}
}


// 사업자등록번호 유효성 검사
function bnCheck(obj){
	let bn = obj.value
	let msg = document.querySelector('#checkBnMsg')
	if (bn.length == 10){
		msg.innerHTML = ''
		ch4 = 1;
	}else{
		msg.innerHTML = '<span style="color: red;"> 올바르지 않은 사업자등록 번호입니다. </span>'
	}
		
}

// 구매자 제출 검사
function subCheck1(){
	if (ch1 == 0){
		alert("아이디 중복확인을 진행하세요.")
		return false
	} else if (ch3 == 0){
		alert("개인정보 이용에 동의해주세요.")
		return false
	}else if (ch1 == 1 && ch3 == 1){
		return true
	}else {
		return false
	}
}

// 판매자 제출 검사
function subCheck2(){
	if (ch1 == 0){
		alert("아이디 중복확인을 진행하세요.")
		return false
	} else if (ch2 == 0){
		alert("농장이름 중복확인을 진행하세요.")
		return false
	} else if (ch3 == 0){
		alert("개인정보 이용에 동의해주세요.")
		return false
	} else if (ch4 == 0){
		alert("사업자등록번호를 확인해 주세요.")
		return false
	}else if (ch1 == 1 && ch3 == 1 && ch2 == 1){
		return true
	}else {
		return false
	}
}








