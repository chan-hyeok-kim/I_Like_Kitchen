let productNum = $('#book-btn').attr('data-productNum')

function popup(){
  let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=800, height=1000, top=0,left=550";

  window.open('/book/add?productNum='+productNum,"book", options);
}

$('#book-btn').click(function(){
  popup()


})