let orderNum = $('#btn').attr("data-orderNum");
console.log(orderNum);

$('#btn').click(function(){
	
	    location.href="../pay/add?orderNum="+orderNum;
	})
		


    