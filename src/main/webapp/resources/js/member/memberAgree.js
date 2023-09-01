const checkAll = document.getElementById("checkAll");
const check = document.getElementsByClassName("check");
const checks = document.getElementsByClassName("checks");
const agreeBtn = document.getElementById("agreeBtn");

agreeBtn.addEventListener("click", function(){
    if(checkAll.checked){
        location.href = "./memberJoin";
    }else {
        alert("모든 약관에 동의해야 합니다.");
    }
})

checkAll.addEventListener("click", function(){
    for(c of check){
        console.log(checkAll.checked)
        c.checked = checkAll.checked;
    }
})

for(c of checks){
    c.addEventListener("click", function(){
        let result = true;
        for(ch of checks){
            if(!ch.checked){
                result = ch.checked;
                break;
            }
        }
        checkAll.checked = result;
    })
}