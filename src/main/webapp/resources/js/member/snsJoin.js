const password = document.getElementById("password");
const passwordResult = document.getElementById("passwordResult");
const pwCheck = document.getElementById("pwCheck");
const pwCheckResult = document.getElementById("pwCheckResult");
const phone = document.getElementById("phone");

const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let checkResult = [false, false, false]

//------PASSWORD CHECK---------
password.addEventListener("blur", function(){
    const passwordResult = document.getElementById(password.id + "Result");
    if(password.value.length > 5 && password.value.length < 12){
        passwordResult.innerHTML = "올바른 비밀번호입니다.";
        passwordResult.className = "s";
        checkResult[0] = true;
    }else{
        passwordResult.innerHTML = "비밀번호를 6글자이상, 12글자 미만이여야 합니다.";
        passwordResult.className = "f";
        checkResult[0] = false;
    }
});

password.addEventListener("change", function(){
    pwCheck.value = "";
    checkResult[1] = false;
    pwCheckResult.innerHTML = "";
});

//------PASSWORD2 CHECK---------
pwCheck.addEventListener("keyup", function(){
    const pwCheckResult = document.getElementById(pwCheck.id + "Result");
    if(pwCheck.value == password.value){
        pwCheckResult.innerHTML = "비밀번호가 같습니다.";
        pwCheckResult.className = "s";
        checkResult[1] = true;
    }else{
        pwCheckResult.innerHTML = "비밀번호가 틀립니다.";
        pwCheckResult.className = "f";
        checkResult[1] = false;
    }
});

//------PHONE CHECK---------
phone.addEventListener("blur", function(){
    let check = emptyCheck(phone);
    const phoneResult = document.getElementById("phoneResult");
    phoneResult.innerHTML = " 전화번호를 입력해주세요.";
    phoneResult.className = "f";
    checkResult[2] = false;
    if(!check) {
        phoneResult.innerHTML = "정상적으로 전화번호가 입력되었습니다.";
        phoneResult.className = "s";
        checkResult[2] = true;
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