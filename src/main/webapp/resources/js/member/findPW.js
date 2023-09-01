const id = document.getElementById("id");
const idResult = document.getElementById("idResult");
const email = document.getElementById("email");
const emailDomain = document.getElementById("emailDomain");
const emailResult = document.getElementById("emailResult");
const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let checkResult = [false, false]

//------ID CHECK---------
id.addEventListener("blur", function(){
    let check = emptyCheck(id);
    idResult.innerHTML = "ID를 입력해주세요.";
    idResult.className = "f";
    checkResult[0] = false;
    if (!check) {
        idResult.innerHTML = "정상적으로 ID가 입력되었습니다.";
        idResult.className = "s";
        checkResult[0] = true;
    }
});

//------EMAIL CHECK---------
email.addEventListener("blur", function(){
    let check = emptyCheck(email);
    emailResult.innerHTML = "E-mail을 입력해주세요.";
    emailResult.className = "f";
    checkResult[1] = false;
    if(!check) {
        emailResult.innerHTML = "정상적으로 E-mail이 입력되었습니다.";
        emailResult.className = "s";
        checkResult[1] = true;
    }
});

//이메일 인증확인
// email 발송 버튼 클릭 시
$('#mail-Check-Btn').click(function() {
    const email = $('#email').val() + $('#emailDomain').val(); // 이메일 주소값 얻어오기!
    const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳

	$.ajax({
	    type : 'get',
	    url : '/member/emailPasswordCheck?email=' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
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

btn.addEventListener("click", function(){
    let c = checkResult.includes(false);
    if(!c) {
        //form 전송
        //console.log("form전송");
        frm.submit();
    }else {
        alert("필수 항목을 입력해주세요.");
    }
});

