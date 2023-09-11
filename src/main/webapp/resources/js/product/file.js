const fileList = document.getElementById("fileList");
const deletes = document.getElementsByClassName("deletes");
const fileAdd = document.getElementById("fileAdd");

// document.addEventListener("DOMContentLoaded", function () {
// 	        const fileUploadContainer = document.getElementById("fileUploadContainer");
// 	        const addFileFieldButton = document.getElementById("addFileField");
// 	        const maxFileFields = 5;
// 	        let fileFieldCount = 0;

// 	        // 파일 필드를 동적으로 추가하는 함수
// 	        function addFileField() {
// 	          if (fileFieldCount < maxFileFields) {
// 	            const fileField = document.createElement("input");
// 	            fileField.type = "file";
// 	            fileField.name = "pic[]"; // 필요한 이름을 지정하세요.
// 	            fileField.className = "form-control mb-2";

// 	            const deleteButton = document.createElement("button");
// 	            deleteButton.innerHTML = "삭제";
// 	            deleteButton.className = "btn btn-danger mb-2";
// 	            deleteButton.addEventListener("click", function () {
// 	              // 파일 필드 삭제 버튼을 눌렀을 때 해당 필드를 제거합니다.
// 	              fileUploadContainer.removeChild(fileField);
// 	              fileUploadContainer.removeChild(deleteButton);
// 	              fileFieldCount--;
// 	            });

// 	            fileUploadContainer.appendChild(fileField);
// 	            fileUploadContainer.appendChild(deleteButton);
// 	            fileFieldCount++;
// 	          } else {
// 	            // 최대 파일 개수에 도달한 경우 알림을 표시합니다.
// 	            alert("더 이상 파일을 추가할 수 없습니다 (최대 5개).");
// 	          }
// 	        }

// 	        // "파일 추가" 버튼 클릭 시 파일 필드를 추가합니다.
// 	        addFileFieldButton.addEventListener("click", addFileField);
// });
		  
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
    alert(count);
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
        alert("5개까지입니다");
        return;
    }
    count++;
    $('#fileList').append(r); 
    idx++;
    
  })