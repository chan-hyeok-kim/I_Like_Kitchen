let bookNum = $('.btn-pay').attr("data-bookNum");
console.log(bookNum);

$('.btn-pay').click(function(){
	
	    location.href="../pay/add?bookNum="+bookNum;
	})
   


start = $('.bookTime').attr('data-startTime');
end = $('.bookTime').attr('data-endTime')
console.log(typeof start);
console.log(start);
console.log(end);

start=start.substring(11,16);
end=end.substring(11,16);
console.log(start);

$('.bookTime').append(start)
$('.bookTime').append('~'+end)

let check = $('.check').attr('data-check')
if(check>0){
$('.check').html('승인')
}else{
$('.check').html('미승인')
}