const id = document.getElementById("id");
const idResult = document.getElementById("idResult");
const password = document.getElementById("password");
const passwordResult = document.getElementById("passwordResult");
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

//------password CHECK---------
password.addEventListener("blur", function(){
    let check = emptyCheck(password);
    passwordResult.innerHTML = "비밀번호를 입력해주세요.";
    passwordResult.className = "f";
    checkResult[1] = false;
    if (!check) {
        passwordResult.innerHTML = "정상적으로 비밀번호가 입력되었습니다.";
        passwordResult.className = "s";
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