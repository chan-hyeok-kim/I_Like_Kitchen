count = $('.book-table-list').length
idNum = 0;

console.log(count)



for (let i = 0; i < count; i++) {
	

	$('.book-table-list').eq(i).mouseover(function () {
		idNum = i;
		console.log(idNum)

		check = $('.check').eq(idNum).attr('data-check')
	    console.log(check)
		
	    bookNum = $('.btn-pay').eq(idNum).attr("data-bookNum");
	    console.log(bookNum);
		if (check == "승인") {
             
			
			$('#btn-home' + idNum).click(function () {
				location.href = "../pay/add?bookNum=" + bookNum;
			})
		} else {

			$('.btn-pay').eq(idNum).click(function () {
				swal('아직 예약이 승인되지 않았습니다.')
			})
		}
	}
	)


	
}


for (let i = 0; i < count; i++) {
start = $('#bookTime' + i).attr('data-startTime');
end = $('#bookTime' + i).attr('data-endTime')
console.log(typeof start);
console.log(start);
console.log(typeof end);

start = start.substring(11, 16);
end = end.substring(11, 16);
console.log(start);

$('#bookTime' + i).append(start)
$('#bookTime' + i).append('~' + end)

}











// 페이지 버튼
// id = $('#data-id').attr('data-id')

// $('.move').click(function(){
//   $('#page').val($(this).attr('data-num'));
//  let listPage = $('#page').val();
//  let listSearch = $('#search').val();
//  $.ajax({
// 	type:'GET',
// 	url:'/book/list?id='+id+'&page='+listPage+'&search='+listSearch
//     ,success:function(result){
// 		$('#gridDiv').remove();
// 		console.log(result)
// 		$('#gridDiv').append(result);
// 	}
// })
// })


