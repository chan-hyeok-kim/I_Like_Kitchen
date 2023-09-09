const id = document.getElementById("id");
const idResult = document.getElementById("idResult");
const partnerNameResult = document.getElementById("partnerNameResult");
const companyName = document.getElementById("companyName");
const companyNameResult = document.getElementById("companyNameResult");
//const date = document.getElementById("partnerDate");
const partnerPhone = document.getElementById("partnerPhone");
const partnerPhoneResult = document.getElementById("partnerPhoneResult");
const partnerEmail = document.getElementById("partnerEmail");
const partnerEmailDomain = document.getElementById("partnerEmailDomain");
const partnerEmailResult = document.getElementById("partnerEmailResult");
const partnerAccount = document.getElementById("partnerAccount");
const partnerAccountResult = document.getElementById("partnerAccountResult");

const partnerForm = document.getElementById("partnerForm");

let checkResult = [false, false, false, false, false, false]

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

//------CompanyName CHECK---------
companyName.addEventListener("blur", function(){
    let check = emptyCheck(companyName);
    companyNameResult.innerHTML = "상호명을 입력해주세요.";
    companyNameResult.className = "f";
    checkResult[1] = false;
    if (!check) {
        companyNameResult.innerHTML = "정상적으로 입력되었습니다.";
        companyNameResult.className = "s";
        checkResult[1] = true;
    }
});

//------PARTNERPHONE CHECK---------
partnerPhone.addEventListener("blur", function(){
    let check = emptyCheck(partnerPhone);
    partnerPhoneResult.innerHTML = " 전화번호를 입력해주세요.";
    partnerPhoneResult.className = "f";
    checkResult[2] = false;
    if(!check) {
        partnerPhoneResult.innerHTML = "정상적으로 전화번호가 입력되었습니다.";
        partnerPhoneResult.className = "s";
        checkResult[2] = true;
    }
});

//------PARTNEREMAIL CHECK---------
partnerEmail.addEventListener("blur", function(){
    let check = emptyCheck(partnerEmail);
    partnerEmailResult.innerHTML = "E-mail을 입력해주세요.";
    partnerEmailResult.className = "f";
    checkResult[3] = false;
    if(!check) {
        partnerEmailResult.innerHTML = "정상적으로 E-mail이 입력되었습니다.";
        partnerEmailResult.className = "s";
        checkResult[3] = true;
    }
});

//------PARTNERACCOUNT CHECK---------
partnerAccount.addEventListener("blur", function(){
    let check = emptyCheck(partnerAccount);
    partnerAccountResult.innerHTML = "계좌번호를 입력해주세요.";
    partnerAccountResult.className = "f";
    checkResult[4] = false;
    if(!check) {
        partnerAccountResult.innerHTML = "정상적으로 계좌번호가 입력되었습니다.";
        partnerAccountResult.className = "s";
        checkResult[4] = true;
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

// 사업자등록번호 진위확인
let serviceKey = $('#partnerNum').attr('data-serviceKey');
let bNo="";
let partnerName="";
let partnerDate="";

$('#partnerNum').blur(function(){
    bNo = $('#partnerNum').val();
    let data = {
        "b_no": [bNo], // 사업자번호 "xxxxxxx" 로 조회 시,
    };
       console.log(bNo)
       console.log(serviceKey)
    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey="+serviceKey,  // serviceKey 값을 xxxxxx에 입력
        type: "POST",
        data: JSON.stringify(data), // json 을 string으로 변환하여 전송
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function(result) {
        let resultText="";
            console.log(result.status_code);
            if(result.status_code=="OK"){
            console.log('데이터 전송은 문제 없음')
            }
            console.log(result.data[0].tax_type)
            if(result.data[0].tax_type=="국세청에 등록되지 않은 사업자등록번호입니다."){
            resultText=result.data[0].tax_type;
            $('#resultText').css({
            "color":"red"
                })
            }else{
            resultText=result.data[0].tax_type+"입니다";
            $('#resultText').css({
            "color":"blue"
                })
            }
            $('#resultText').empty();
            $('#resultText').append(resultText);
        },
        error: function(result) {
            console.log(result.responseText); //responseText의 에러메세지 확인
        }
    })
})
$('#partnerBtn').click(function(){
    bNo = $('#partnerNum').val();
    partnerName = $('#partnerName').val();
    partnerDate = $('#partnerDate').val();

    let year = partnerDate.substring(0, 4);
    let month = partnerDate.substring(5, 7);
    let date = partnerDate.substring(8, 10);
    
    let date1 = year + month + date;
    //console.log(date1);

    console.log("클릭됨")
  let data = {
      "businesses":[{
      "b_no":bNo,
      "start_dt":date1,
      "p_nm":partnerName
  }]
}
    $.ajax({
        url:"http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey="+serviceKey,
        type:"POST",
        data:JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success:function(result){
            console.log(result)
            console.log(result.data[0].valid)
            if(checkResult.includes(true) && result.data[0].valid=="01"){
                swal("유효한 사업자입니다. 로그인 페이지에서 로그인해주세요.")
                partnerForm.submit();
            }else if(!checkResult.includes(true)){
                swal("필수사항을 입력해주세요.")
            }else {
                swal("등록되지 않은 사업자입니다.")
            }
        }
        ,error:function(){
            swal("검증 실패")
        }
  })
})
