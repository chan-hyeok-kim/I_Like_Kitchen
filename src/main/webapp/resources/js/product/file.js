
const fileList = document.getElementById("fileList");
const deletes = document.getElementsByClassName("deletes");
const fileAdd = document.getElementById("fileAdd");



for(del of deletes){
    del.addEventListener("click", function(){
        let num = this.getAttribute("data-delete-num");
        let check = confirm("삭제시 복구가 불가능합니다.");
        if(check){
            fetch("./fileDelete?fileNum="+num, {method:"GET"})
                .then((result)=>{return result.text()})
                .then((r)=>{
                    if(r.trim() == '1'){
                        this.previousSibling.previousSibling.remove();
                        this.remove();
                        count--;
                    }
                })
        }
    });
}

let max = 5;
let count = 0;

if(deletes != null) {
    count = deletes.length;
    
}

let idx = 0;

$("#fileList").on("click", ".df", function(){
    // let deleteId=$(this).attr("data-id")
    // $("#"+deleteId).remove();
    $(this).parent().remove();
    count--;
})

let r = '<div class="input-group" id="file'+idx+'">'
r = r+'<input type="file" aria-lable="upload" name="files" id="file" class="form-control">';
r = r+'<button class="df btn btn-danger" data-id="file'+idx+'">삭제</button>'
r = r+'</div>'

$("#fileAdd").click(function(){

    if(count>=5){
        swal("5개까지입니다");
        return;
    }
    count++;
    $('#fileList').append(r); 
    idx++;

  })