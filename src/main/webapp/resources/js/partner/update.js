const companyName = document.getElementById("companyName");
const companyNameResult = document.getElementById("companyNameResult");
const partnerPhone = document.getElementById("partnerPhone");
const partnerPhoneResult = document.getElementById("partnerPhoneResult");
const partnerEmail = document.getElementById("partnerEmail");
const partnerEmailResult = document.getElementById("partnerEmailResult");
const partnerAccount = document.getElementById("partnerAccount");
const partnerAccountResult = document.getElementById("partnerAccountResult");

const partnerBtn = document.getElementById("partnerBtn");

const partnerForm = document.getElementById("partnerForm");

let checkResult = [false, false, false, false];

//------CompanyName CHECK---------
companyName.addEventListener("blur", function(){
    let check = emptyCheck(companyName);
    companyNameResult.innerHTML = "상호명을 입력해주세요.";
    companyNameResult.className = "f";
    checkResult[0] = false;
    if (!check) {
        companyNameResult.innerHTML = "정상적으로 입력되었습니다.";
        companyNameResult.className = "s";
        checkResult[0] = true;
    }
});

//------PARTNERPHONE CHECK---------
partnerPhone.addEventListener("blur", function(){
    let check = emptyCheck(partnerPhone);
    partnerPhoneResult.innerHTML = " 전화번호를 입력해주세요.";
    partnerPhoneResult.className = "f";
    checkResult[1] = false;
    if(!check) {
        partnerPhoneResult.innerHTML = "정상적으로 전화번호가 입력되었습니다.";
        partnerPhoneResult.className = "s";
        checkResult[1] = true;
    }
});

//------PARTNEREMAIL CHECK---------
partnerEmail.addEventListener("blur", function(){
    let check = emptyCheck(partnerEmail);
    partnerEmailResult.innerHTML = "E-mail을 입력해주세요.";
    partnerEmailResult.className = "f";
    checkResult[2] = false;
    if(!check) {
        partnerEmailResult.innerHTML = "정상적으로 E-mail이 입력되었습니다.";
        partnerEmailResult.className = "s";
        checkResult[2] = true;
    }
});

//------PARTNERACCOUNT CHECK---------
partnerAccount.addEventListener("blur", function(){
    let check = emptyCheck(partnerAccount);
    partnerAccountResult.innerHTML = "계좌번호를 입력해주세요.";
    partnerAccountResult.className = "f";
    checkResult[3] = false;
    if(!check) {
        partnerAccountResult.innerHTML = "정상적으로 계좌번호가 입력되었습니다.";
        partnerAccountResult.className = "s";
        checkResult[3] = true;
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

partnerBtn.addEventListener("click", function(){
    if(!checkResult.includes(false)){
        alert('정상적으로 수정되었습니다.');
        partnerForm.submit();
    }else {
        alert("필수 사항을 입력해주세요.");
    }
})