//SELECTOR
const id = document.getElementById("id");
const idResult = document.getElementById("idResult");
const password = document.getElementById("password");
const passwordResult = document.getElementById("passwordResult");
const pwCheck = document.getElementById("pwCheck");
const pwCheckResult = document.getElementById("pwCheckResult");
const nameAdd = document.getElementById("name");
const phone = document.getElementById("phone");
const email = document.getElementById("email");
const emailDomain = document.getElementById("emailDomain");
const emailResult = document.getElementById("emailResult");

const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let checkResult = [false, false, false, false, false, false]


// //------ID CHECK---------
// id.addEventListener("blur", function(){
//     //중복검사
//     let xhttp = new XMLHttpRequest();

//     //url, method
//     xhttp.open("POST", "./memberIdCheck");

//     //header
//     xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

//     //요청 발생 POST일 경우 parameter 전송
//     xhttp.send("id="+id.value);

//     //응답 처리
//     xhttp.addEventListener("readystatechange", function(){
//         if(this.readyState==4 && this.status==200){
//             if(this.responseText.trim()=='true'){
//                 checkResult[0]=true;
//                 idResult.innerHTML="사용 가능한 ID입니다.";
//                 idResult.className = "s";
//             }else {
//                 checkResult[0]=false;
//                 idResult.innerHTML="중복된 ID입니다.";
//                 idResult.className = "f";
//             }
//         }
//     });
// });

//------ID CHECK---------
id.addEventListener("blur", function(){
    console.log(id.id);
    const idResult = document.getElementById(id.id + "Result");

    fetch("./idCheck?id="+id.value, {method:"GET"})
        .then((response)=>{return response.text()})
        .then((r)=>{
            //alert(r.trim());
            if(r.trim() == '1'){
                if(id.value == "" || id.value.length > 10){
                    //console.log("x");
                    idResult.innerHTML = "ID는 비어있으면 안되고, 10글자 미만이어야 합니다.";
                    idResult.className = "f";
                    checkResult[0] = false;
                    checkResult[6] = false;
                }else{
                    //console.log("0");
                    idResult.innerHTML = "사용 가능한 ID입니다.";
                    idResult.className = "s";
                    checkResult[0] = true;
                    checkResult[6] = true;
                }
            }else{
                idResult.innerHTML = "이미 사용중인 ID입니다.";
                idResult.className = "f";
                checkResult[0] = false;
                checkResult[6] = false;
            }
        })
});

// //PW 검증
// password.addEventListener("keyup", function(){
//     if(password.value.length>5 && password.value.length<13){
//         pwResult.innerHTML='올바른 비밀번호입니다.'
//         checks[1]=true;
//         passwordResult.className = "s";
//     }else {
//         pwResult.innerHTML='비밀번호는 6글자 이상 12자 이하여야 합니다.'
//         checks[1]=false;
//         idResult.classList.add("redResult");
//     }
// })

// password.addEventListener("blur", function(){
//     if(password.value!=''){
//         //pwNullCheck=true;
//         checks[2]=true;
//     }else {
//         pwResult.innerHTML='비밀번호는 필수 입니다.'
//         checks[2]=false;
//     }
// })

// password.addEventListener("change", function(){
//     checks[3]=false;
//     pwCheck.value='';
//     pwCheckResult.innerHTML='비밀번호가 틀립니다.';
//     idResult.classList.add("redResult");
// })

// //pw Equal 검증
// pwCheck.addEventListener("blur", function(){
//     if(pwCheck.value == password.value){
//         pwCheckResult.innerHTML="동일한 비밀번호입니다."
//         checks[3]=true;
//         idResult.classList.add("redResult");
//     }else {
//         pwCheckResult.innerHTML="비밀번호가 틀립니다."
//         checks[3]=false;
//         idResult.classList.add("redResult");
//     }
// });

//------PASSWORD CHECK---------
password.addEventListener("blur", function(){
    const passwordResult = document.getElementById(password.id + "Result");
    if(password.value.length > 5 && password.value.length < 12){
        passwordResult.innerHTML = "올바른 비밀번호입니다.";
        passwordResult.className = "s";
        checkResult[1] = true;
    }else{
        passwordResult.innerHTML = "비밀번호를 6글자이상, 12글자 미만이여야 합니다.";
        passwordResult.className = "f";
        checkResult[1] = false;
    }
});

password.addEventListener("change", function(){
    pwCheck.value = "";
    checkResult[2] = false;
    pwCheckResult.innerHTML = "";
});

//------PASSWORD2 CHECK---------
pwCheck.addEventListener("keyup", function(){
    const pwCheckResult = document.getElementById(pwCheck.id + "Result");
    if(pwCheck.value == password.value){
        pwCheckResult.innerHTML = "비밀번호가 같습니다.";
        pwCheckResult.className = "s";
        checkResult[2] = true;
    }else{
        pwCheckResult.innerHTML = "비밀번호가 틀립니다.";
        pwCheckResult.className = "f";
        checkResult[2] = false;
    }
});

//------NAME CHECK---------
nameAdd.addEventListener("blur", function(){
    let check = emptyCheck(nameAdd);
    const nameResult = document.getElementById("nameResult");
    nameResult.innerHTML = "이름을 입력해주세요.";
    nameResult.className = "f";
    checkResult[3] = false;
    if(!check) {
        nameResult.innerHTML = "정상적으로 이름이 입력되었습니다.";
        nameResult.className = "s";
        checkResult[3] = true;
    }
});

//------PHONE CHECK---------
phone.addEventListener("blur", function(){
    let check = emptyCheck(phone);
    const phoneResult = document.getElementById("phoneResult");
    phoneResult.innerHTML = " 전화번호를 입력해주세요.";
    phoneResult.className = "f";
    checkResult[4] = false;
    if(!check) {
        phoneResult.innerHTML = "정상적으로 전화번호가 입력되었습니다.";
        phoneResult.className = "s";
        checkResult[4] = true;
    }
});


//------EMAIL CHECK---------
function validateEmail() {
    // 중복 검사
    let xhttp = new XMLHttpRequest();

    // URL, method 설정
    xhttp.open("POST", "./memberEmailCheck");

    // 헤더 설정
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // 요청 발생 POST일 경우 파라미터 전송
    xhttp.send("email=" + email.value + "&emailDomain=" + emailDomain.value);

	// 응답 처리
	xhttp.addEventListener("readystatechange", function () {
	    if (this.readyState == 4 && this.status == 200) {
	        const mailCheckBtn = document.getElementById("mail-Check-Btn");
	        if (this.responseText.trim() == "true") {
	            checkResult[5] = true;
	            emailResult.innerHTML = "사용 가능한 이메일 입니다.";
	            emailResult.classList.add("blueResult");
	            emailResult.classList.remove("redResult");
	            mailCheckBtn.disabled = false;
	        } else {
	            checkResult[5] = false;
	            emailResult.innerHTML = "이미 등록된 이메일 입니다.";
	            emailResult.classList.add("redResult");
	            emailResult.classList.remove("blueResult");
	            mailCheckBtn.disabled = true;
	        }
	    }
	});
}

email.addEventListener("blur", validateEmail);
emailDomain.addEventListener("change", validateEmail);

//이메일 인증확인
// email 발송 버튼 클릭 시
$('#mail-Check-Btn').click(function() {
    const email = $('#email').val() + $('#emailDomain').val(); // 이메일 주소값 얻어오기!
    const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳

	$.ajax({
	    type : 'get',
	    url : '/member/mailCheck?email=' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
	    success : function (data) {
	        console.log("data : " +  data);  
	        checkInput.prop('disabled', false);  
	        code = data;
	        alert('인증번호가 전송되었습니다.');
	        $('#mail-Check-Btn').addClass('d-none'); // 발송 버튼 숨기기
	        $('#mail-Confirm-Btn').removeClass('d-none'); // 확인 버튼 보이기
	    }           
	}); // end ajax
}); // end send email

// 인증번호 확인 버튼 클릭 시
$('#mail-Confirm-Btn').click(function() {
	const inputCode = $('.mail-check-input').val();
	const $resultMsg = $('#mail-check-warn');
		
	if (inputCode === code) {
	    $resultMsg.html('인증번호가 일치합니다.');
	    $resultMsg.css('color', 'green');
	    $('.mail-check-input').prop('disabled', true);
	    $('#email, #emailDomain').prop('readonly', true);
	    $('#mail-Check-Btn, #mail-Confirm-Btn').prop('disabled', true); // 버튼 모두 비활성화
	} else {
	    $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
	    $resultMsg.css('color', 'red');
	}
});

//비어있는지 체크하는 함수
function emptyCheck(element){
    if(element.value == null || element.value.length == 0){
        return true;
    }else {
        return false;
    }
};

//form 전송
btn.addEventListener("click", function(){
    if(!checkResult.includes(false)){
        alert('회원가입을 축하드립니다.');
        frm.submit();
    }else {
        alert("필수 사항을 입력해주세요.");
    }
})