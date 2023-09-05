let count = $('.book-table-list').length


console.log(count)

for(let i=0; i<count; i++){

   
	let check = $('.check').eq(i).attr('data-check')
	if(check=="승인"){
		
	let bookNum = $('.btn-pay').eq(i).attr("data-bookNum");
	console.log(bookNum);
	
	$('.btn-pay').eq(i).click(function(){
		
			location.href="../pay/add?bookNum="+bookNum;
		})
	}else{
	
	$('.btn-pay').eq(i).click(function(){
	 swal('아직 예약이 승인되지 않았습니다.')
	})
	}
}




   


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



