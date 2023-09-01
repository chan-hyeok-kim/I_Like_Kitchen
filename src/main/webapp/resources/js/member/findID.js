const nameAdd = document.getElementById("name");
const nameResult = document.getElementById("nameResult");
const email = document.getElementById("email");
const emailDomain = document.getElementById("emailDomain");
const emailResult = document.getElementById("emailResult");
const btn = document.getElementById("btn");
const frm = document.getElementById("frm");

let checkResult = [false, false];

//------NAME CHECK---------
nameAdd.addEventListener("blur", function(){
    let check = emptyCheck(nameAdd);
    nameResult.innerHTML = "이름을 입력해주세요.";
    nameResult.className = "f";
    checkResult[0] = false;
    if(!check) {
        nameResult.innerHTML = "정상적으로 이름이 입력되었습니다.";
        nameResult.className = "s";
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

