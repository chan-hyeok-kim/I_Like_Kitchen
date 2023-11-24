


let cho = document.getElementsByClassName("cho");
let resultCheck = [false, false, false, false, false, false];


let today = new Date();
let year = today.getFullYear();
let month = today.getMonth() + 1;
let date = today.getDate();

if (month < 10) {
	month = '0' + month;
}
if (date < 10) {
	date = '0' + date;
}
today = year + '-' + month + '-' + date

console.log(today)


let setDate = new Date();



$('#selectTimeTitle').append(month + '월 ' + date + '일')
//  for(c of cho){


document.addEventListener('DOMContentLoaded', function () {
	// c.addEventListener("click", function() {	


	let calendarEl = document.getElementById('calendar');
	let calendar = new FullCalendar.Calendar(calendarEl, {
		buttonText: {
			today: '오늘',
			month: '월간',
		},
		headerToolbar: {
			start: 'prev',
			center: 'title',
			end: 'next'
		},
		initialView: 'dayGridMonth',
		selectable: true,
		locale: 'ko',
		events: [{
			start: '0000-00-00',
			end: today,
			display: 'background',
			backgroundColor: 'gray',
		}],
		dateClick: function (info) {
			console.log(info.date)
			//    info.dayEl.style.backgroundColor = 'yellow';
			console.log(today)
			if (info.dateStr < today) {

				swal('알림', month + '월' + date + '일' + '부터 예약이 가능합니다')
			} else {
				console.log(typeof info.dateStr)
				let selectYear = info.date.getFullYear();
				let selectMonth = info.date.getMonth() + 1;
				let selectDate = info.date.getDate();
                

				console.log(info.date.getTime())

				swal('알림', '선택하신 날짜는 ' + selectMonth + '월 ' + selectDate + '일' + '입니다')
				if (selectMonth < 10) {
					selectMonth = '0' + selectMonth
				}
				if (selectDate < 10) {
					selectDate = '0' + selectDate
				}
				$.ajax({
					type: 'POST',
					url: 'bookTime',
					dataType: 'json',
					data: {
						infoDate: selectYear + '-' + selectMonth + '-' + selectDate
					}, success: function (result) {
						console.log(result);
						$(result).each(function (i, item) {
							console.log(item.bookDate)

							let useStartTime = msToTime(item.startTime * 1 + 32400000)
							useStartTime = useStartTime.substring(0, useStartTime.lastIndexOf(':'))

							let useEndTime = msToTime(item.endTime * 1 + 32400000)
							useEndTime = useEndTime.substring(0, useEndTime.lastIndexOf(':'))

							for (let i = 0; i < 24; i++) {
								let startOpt = $("#selectStartTime option:eq(" + i + ")").val();
								if (useStartTime < startOpt && startOpt < useEndTime) {
									$("#selectStartTime option:eq(" + i + ")").text(startOpt + '   이미 예약된 시간대입니다')
								}
								let endOpt = $("#selectEndTime option:eq(" + i + ")").val();
								console.log(endOpt)
								if (useStartTime < endOpt && endOpt < useEndTime) {
									$("#selectEndTime option:eq(" + i + ")").text(endOpt + '   이미 예약된 시간대입니다')
								}
							}


						})


					}
				})
				$('#setDate').val(info.dateStr);
				console.log($('#setDate').val());
				setDate = $('#setDate').val();
				console.log(typeof selectDate)
				selectDate = ''+selectDate
			
				selectMonth= ''+selectMonth
				
				if (selectMonth.substring(0, 1) == 0) {
					selectMonth = selectMonth.substring(1, 2)
				}
				if (selectDate.substring(0, 1) == 0) {
					selectDate = selectDate.substring(1, 2)
				}
				$('#selectTimeTitle').empty();
				$('#selectTimeTitle').append(selectMonth + '월 ' + selectDate + '일')

			}
		}

	});
	calendar.render();
});



// 시간 변환

function secToTime(duration) {
	var seconds = Math.floor(duration % 60),
		minutes = Math.floor((duration / 60) % 60),
		hours = Math.floor((duration / (60 * 60)) % 24);

	hours = (hours < 10) ? "0" + hours : hours;
	minutes = (minutes < 10) ? "0" + minutes : minutes;
	seconds = (seconds < 10) ? "0" + seconds : seconds;

	return hours + ":" + minutes + ":" + seconds;
}

function msToTime(duration) {
	var milliseconds = parseInt((duration % 1000) / 100),
		seconds = Math.floor((duration / 1000) % 60),
		minutes = Math.floor((duration / (1000 * 60)) % 60),
		hours = Math.floor((duration / (1000 * 60 * 60)) % 24);

	hours = (hours < 10) ? "0" + hours : hours;
	minutes = (minutes < 10) ? "0" + minutes : minutes;
	seconds = (seconds < 10) ? "0" + seconds : seconds;

	return hours + ":" + minutes + ":" + seconds + "." + milliseconds;
}

let start = "";
let end = "";
let opt1 = document.getElementsByClassName("opt-1");


bookNoticeEnd()
bookNoticeStart()
function bookNoticeStart() {
	$('#selectTime').change(function () {
		start = $('#selectStartTime option:selected').val();
		console.log(start);
		console.log(typeof start);
		start = start.slice(0, 2);
		console.log(start)

		
		let startTimelength = $('#selectStartTime option:selected').text()
		let endTimelength = $('#selectEndTime option:selected').text()
		console.log(startTimelength)
		console.log(startTimelength.length)
		if (startTimelength.length>12 || endTimelength.length>12){
			swal('알림','이미 예약된 시간은 선택하실 수 없습니다')
			resultCheck[1]=false;
			resultCheck[2]=false;
		}else{
			resultCheck[1]=true;
			resultCheck[2]=true;
		}

		if (end - start < 4 && endTimelength.length<7) {
			swal("알림", "최소 4시간 이상만 예약 가능합니다.")
			resultCheck[1]=false;
			resultCheck[2]=false;
 
		}else{
			resultCheck[1]=true;
			resultCheck[2]=true;
		}

	})
}
function bookNoticeEnd() {
	$('#selectTime').change(function () {
		end = $('#selectEndTime option:selected').val();
		console.log(end);
		console.log(typeof end);
		end = end.slice(0, 2);
		console.log(end)
		console.log(end - start)
    
	})

}






$('.input-number-increment').click(function () {
	let $input = $(this).parents('.input-number-group').find('.input-number');
	let val = parseInt($input.val(), 10);
	$input.val(val + 1);
	curCount = $('#headCount').val()
	countAlert(curCount);
});

$('.input-number-decrement').click(function () {
	let $input = $(this).parents('.input-number-group').find('.input-number');
	let val = parseInt($input.val(), 10);
	if (val == 1) {
		val = 1;
	} else {
		$input.val(val - 1);
	}
	curCount = $('#headCount').val()
	countAlert(curCount);
})

let productNum = $('#productNum').val();
console.log(productNum)



// 결과 체크

$('#calendar').blur(function () {
	if ($('#setDate').val() == '') {
		resultCheck[0] = false;
	} else {
		resultCheck[0] = true;
	}

})

$('#selectTime').change(function(){
	if ($('#setDate').val() == '') {
		swal('날짜를 먼저 선택해주세요')
		resultCheck[0] = false;
	}else{
		resultCheck[0] = true;
	}
})

$('#selectStartTime').blur(function () {
	if ($('#selectStartTime option:selected').val() == '') {
		swal('시작 시간을 선택해주세요')
		resultCheck[1] = false;
	} else{
		resultCheck[1] = true;
	}

})

$('#selectEndTime').blur(function () {
	if ($('#selectEndTime option:selected').val() == '') {
		swal('종료 시간을 선택해주세요')
		resultCheck[2] = false;
	} else {
		resultCheck[2] = true;
	}

})


$('#headCount').blur(function () {
	if ($('#headCount').val() > 100) {
		resultCheck[3] = false;
	} else {
		resultCheck[3] = true;
	}

})

$('#headCount-inc').mouseout(function () {
	if ($('#headCount').val() > 100) {
		resultCheck[3] = false;
	} else {
		resultCheck[3] = true;
	}
})

$('#purpose').blur(function () {
	if ($('#purpose').val() == '') {

		resultCheck[4] = false;
	} else {
		resultCheck[4] = true;
	}

})

$('#contents').blur(function () {
	if ($('#contents').val() == '') {
		resultCheck[5] = false;
	} else {
		resultCheck[5] = true;
	}

})



$('#book-close').click(function () {
	let productNum = $('#productNum').val();
	let headCount = $('#headCount').val();
	let purpose = $('#purpose').val();
	let contents = $('#contents').val();
	let startTime = $('#selectStartTime option:selected').val();
	let endTime = $('#selectEndTime option:selected').val();
	console.log(setDate)

	console.log(headCount)
	console.log(purpose)
	console.log(contents)
	console.log(startTime)
	console.log(endTime)

	if (resultCheck.includes(false)) {
		swal('필수 내용들을 입력해주세요')
		console.log(resultCheck)
	} else {


		$.ajax({
			type: 'POST',
			url: 'add',
			data: {
				productNum: productNum,
				headCount: headCount,
				purpose: purpose,
				contents: contents,
				bookDate: setDate,
				start: startTime,
				end: endTime
			}, success: function (result) {
				console.log(result)
				if (result.trim() > 0) {
					swal("예약이 성공적으로 완료되었습니다").then(function () {
						window.close();
					})
				} else {
					swal("예약이 취소되었습니다").then(function () {
						window.close();
					})
				}

			}
		})
	}
})





// 인원선택 숫자 증가
let curCount = $('#headCount').val()


function countAlert(maxCount) {
	if ((maxCount * 1) > 100) {
		swal('인원은 최대 100명까지만 가능합니다')
		$('#headCount').val(100);
	    
	}
}

$('#inc-five').click(function () {
	curCount = curCount * 1 + 5;
	$('#headCount').val(curCount);
	countAlert(curCount);

})
$('#inc-ten').click(function () {
	curCount = curCount * 1 + 10;
	$('#headCount').val(curCount);
	countAlert(curCount);
})
$('#inc-fifty').click(function () {
	curCount = curCount * 1 + 50;
	$('#headCount').val(curCount);
	countAlert(curCount);
})
$('#inc-hundred').click(function () {
	curCount = curCount * 1 + 100;
	$('#headCount').val(curCount);
	countAlert(curCount);
})

