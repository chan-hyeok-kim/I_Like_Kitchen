
count = $('.get-refund-num').length

for (let i = 0; i < count; i++) {

    $('.get-refund-num').eq(i).click(function () {
        count = i + 1
        refundNum = $('#get-refund-num' + count).attr('data-refund-num')

        swal({
            text: '승인하시겠습니까?',
            buttons: ['취소', '승인']
        }).then(function (result) {
            if (result) {

                $.ajax({
                    type: "POST",
                    url: "/pay/setRefundCheck",
                    data: {
                        refundNum: refundNum
                    }, success: function (result) {
                        if (result.trim() > 0) {
                            swal('승인되었습니다')
                            $('#get-refund-num' + count).text('승인 완료')
                            $('#get-refund-num' + count).attr('data-refund-num', 'block')
                        }
                    }
                })
            }
        })



    })

}