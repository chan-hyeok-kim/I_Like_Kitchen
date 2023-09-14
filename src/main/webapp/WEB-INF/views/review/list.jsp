<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
#review-list {
	padding: 45px;
	border-bottom: 1px solid gainsboro;
}

#reviewRate {
	font-weight: bold;
	font-size: 20px;
}

#id {
	color: grey;
	font-weight: bold;
}

#reviewDate {
	color: grey;
}

#reviewContents {
	width: 1600px;
	height: 80px;
	margin: 20px;
	padding: 0px;
	font-size: 20px;
	margin: 10px;
	font-weight: bold;
}

#btn {
	font-weight: bold;
	border-radius: 20px;
	background-color: skyblue;
	color: black;
}

#btn1 {
	margin-left: 10px;
	left: 1380px;
	border-radius: 20px;
	width: 100px;
	height: 40px;
	padding: 7px;
	color: black;
	font-weight: bold;
}

#btn2 {
	margin-left: 10px;
	left: 1500px;
	border-radius: 20px;
	width: 100px;
	height: 40px;
	padding: 7px;
	color: black;
	font-weight: bold;
}

#list a:hover {
	background-color: black;
	color: white;
}

#product-review {
	padding-bottom: 85px;
}

#review-add-btn {
	text-align: right;
}
</style>
</head>
<body>

	<section id="review-list-section">



		<div id="btnon"></div>
		<tbody>
			<c:forEach items="${list}" var="list">
				<div id="review-list">
					<tr class="grid gap-3">
						<td type="hidden" ${list.reviewNum}></td>
						<td><img
							src="/resources/upload/review/${list.ktos[0].fileName}"
							width="200px" height="200px"></td>
						<br>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
						<span id="reviewRate" class="align-middle">${list.reviewRate}</span>|
						<td class="p-2 g-col-6"><span id="id">${list.id}</span></td>|
						<span class="p-2 g-col-6" id="reviewDate">${list.reviewDate}</span>
						<br>
						<span class="p-2 g-col-6" id="reviewContents">${list.reviewContents}</span>
					</tr>
					<br>

					<c:if test="${member.id eq list.id}">
						<a href="/review/update?reviewNum=${list.reviewNum}" id="btn1">게시물
							수정</a>
						<a href="/review/delete?reviewNum=${list.reviewNum}" id="btn2">게시물
							삭제</a>
					</c:if>
					<c:if test="${size eq 3}">
						<a href="/review/update?reviewNum=${list.reviewNum}" id="btn1">게시물
							수정</a>
						<a href="/review/delete?reviewNum=${list.reviewNum}" id="btn2">게시물
							삭제</a>
					</c:if>

				</div>
				<div>
					<c:forEach items="${kto.ktos}" var="f">
						<img src="/resources/upload/review/${f.fileName}">
					</c:forEach>
				</div>
			</c:forEach>

			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${rPager.startNum eq 1}">
						<li class="page-item"><a class="page-link move-review"
							href="#" data-num="${rPager.startNum}">&#60</a></li>
					</c:if>
					<c:if test="${rPager.startNum ne 1}">
						<li class="page-item"><a class="page-link move-review"
							href="#" data-num="${rPager.startNum-1}">&#60</a></li>
					</c:if>

					<c:forEach begin="${rPager.startNum}" end="${rPager.lastNum}" var="i">
						<li class="page-item"><a class="page-link move-review"
							href="#" data-num="${i}">${i}</a></li>
					</c:forEach>


					<li class="page-item ${rPager.next?'':'disabled'}"><a
						class="page-link move-review" href="#"
						data-num="${rPager.lastNum+1}">&#62</a></li>

					<li style="margin-left: 250px;"><input type="hidden"
						value="${rPager.page}" name="page" id="page-review" data-review-productNum="${list[0].productNum}"></li>
				</ul>

			</nav>


		</tbody>

		<a id="move-review" href="#review-title"></a>
	</section>

	<script type="text/javascript">
	
		$('.move-review').click(function() {
			$('#page-review').val($(this).attr('data-num'));
			page = $('#page-review').val();
            productNum = $('#page-review').attr('data-review-productNum') 
			$.ajax({
				type : 'GET',
				url : '/review/list?page=' + page +'&productNum='+ productNum,
				success : function(result) {
					$('#review-list-section').empty();
					$('#review-list-section').append(result);
					$('#move-reivew').click();
				}
			})
		})
	</script>

</body>
</html>