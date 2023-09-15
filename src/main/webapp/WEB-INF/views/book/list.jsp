<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../temp/bootStrap.jsp"></c:import>

<style type="text/css">
#btn {
	margin-top: 10px;
	margin-left: 140px;
	width: 100px;
	height: 40px;
	/* background: #F4F3EA;
      border: 1px solid black;
       */
}

#list-border {
	width: 1000px;
	margin-top: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid gainsboro;
	height: 10px;
}

#book-table-div div {
	display: flex;
}

#book-table-div {
	margin-left: 30px;
}

#book-table-div div p {
	width: 103px;
}

#book-list-unorder {
	list-style: none;
}

#book-img {
	
}

.book-table-list {
	display: flex;
	width: 800px;
}

.btn-pay {
	width: 100px;
	height: 40px;
	margin-top: 150px;
	margin-left: 20px;
}

#detail-link a {
	text-decoration: none;
}

a:hover {
	color: black;
}

a:active {
	color: black;
}

a:visited {
	color: (52, 111, 238, 0.699);
}
</style>
</head>
<body>

	<section id="entire">

		<c:forEach items="${list}" var="i" varStatus="fi">

			<div>
				<div class="book-table-list" data-list="${fi.count}">
					<div id="book-img">
						<img style="width: 250px; height: 200px;"
							src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
						<div id="detail-link" style="display: flex; padding-top: 10px;">
							<p>
								<a
									href="../product/detail?productNum=${productList[fi.index].productNum}">
									${productList[fi.index].productName} > </a>
							</p>
						</div>

					</div>

					<div id="book-table-div">
						<div>
							<p>예약자</p>
							<p>${member.name}</p>
						</div>
						<div>
							<p>예약번호</p>
							<p>${i.bookNum}</p>
						</div>
						<div>
							<p>예약 날짜</p>
							<p>${i.bookDate}</p>
						</div>
						<div>
							<p>사용시간</p>
							<p id="bookTime${fi.index}" class="bookTime"
								data-startTime="${i.startTime}" data-endTime="${i.endTime}"></p>
						</div>
						<div>
							<p>인원</p>
							<p>${i.headCount}</p>
						</div>
						<div>
							<p>승인 상태</p>
							<p id="check${fi.index}" class="check"
								data-check="${i.bookCheck}">${i.bookCheck}</p>
						</div>


					</div>
					<button id="btn-home${fi.index}"
						class="btn btn-outline-primary btn-pay"
						data-bookNum="${i.bookNum}">결제</button>

				</div>
			</div>




			<div id="list-border"></div>

		</c:forEach>



		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pager.startNum eq 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum}">&laquo;</a></li>
				</c:if>
				<c:if test="${pager.startNum ne 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum-1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${i}">${i}</a></li>
				</c:forEach>


				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link move" href="#" data-num="${pager.lastNum+1}">&raquo;</a></li>

				<div style="width: 700px; display: flex;">
					<li style="margin-left: 250px;"><input type="hidden"
						value="${pager.page}" name="page" id="page">

						<div class="" style="display: flex;">
							<input class="form-control me-2" type="search" name="search"
								placeholder="예약 번호를 입력해주세요" aria-label="Search" id="search"
								style="width: 300px;">

							<button style="width: 80px;" class="btn btn-dark" type="submit"
								id="search-btn" data-member-id="${member.id}">검색</button>
						</div></li>
				</div>
			</ul>

		</nav>







	</section>
	<script type="text/javascript">
		id = '${member.id}'
		//$('#data-id').attr('data-id')
		page = '${pager.page}'

		$('.move').click(
				function() {
					$('#page').val($(this).attr('data-num'));
					let listPage = $('#page').val();
					let listSearch = $('#search').val();
					$.ajax({
						type : 'GET',
						url : '/book/list?id=' + id + '&page=' + listPage
								+ '&search=' + listSearch,
						success : function(result) {
							$('#entire').empty();

							$('#entire').append(result);
						}
					})
				})

		$('#search-btn').click(
				function() {
					$('#page').val($(this).attr('data-num'));

					let listSearch = $('#search').val();
					$.ajax({
						type : 'GET',
						url : '/book/list?id=' + id + '&page=' + page
								+ '&search=' + listSearch,
						success : function(result) {
							$('#entire').empty();

							$('#entire').append(result);
						}
					})
				})
				
				
				
	</script>
	<script src="/resources/js/book/list.js"></script>

</body>
</html>