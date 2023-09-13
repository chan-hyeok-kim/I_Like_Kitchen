<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#list {
	padding: 5px;
	border-bottom: 1px solid gainsboro;
}

#questionKind {
	color: rgb(0, 0, 102);
	font-weight: bold;
	margin-top: 0px;
}

#questionDate {
	color: grey;
}

#questionContents {
	width: 700px;
	height: 80px;
	margin: 20px;
	padding: 0px;
	font-size: 20px;
	margin: 10px;
	font-weight: bold;
}

#id {
	color: grey;
	font-weight: bold;
}

#btn {
	color: white;
	background-color: skyblue;
	border-radius: 40px;
	width: 230px;
}

#btn1 {
	font-weight: bold;
	border-radius: 20px;
}

#btn2 {
	font-weight: bold;
	padding: 5px;
	border-radius: 20px;
}

#list a:hover {
	background-color: black;
	color: white;
}

#list a {
	height: 40px;
	padding: 3px;
	margin: 5px;
	width: 100;
	padding: 8px;
}

#question-list a {
	text-decoration: none;
}

#admin-btn a:hover {
	background-color: black;
}

#qustion-add-btn {
	text-align: right;
}
</style>
</head>
<body>
	<section id="question-list">


		<div id="btnon">


			<tbody>
				<c:forEach items="${list}" var="list">
					<div id="list">
						<div style="width: 930px">
							<tr class="grid gap-3"
								href="/question/view?questionNum=${list.questionNum}">
								<td type="hidden" ${list.questionNum}></td>
								<td type="hidden" ${list.productNum}></td>
								<span class="p-2 g-col-6" id="questionKind">[${list.questionKind}]</span>
								<td class="p-2 g-col-6 "><span id="id">${list.id}</span></td>
								<span>|</span>
								<span class="p-2 g-col-6" id="questionDate">${list.questionDate}</span>
						</div>

						<div class="p-2 g-col-6 overflow-auto" id="questionContents">${list.questionContents}</div>

                        <c:if test="${member.id eq list.id}">
							<div id="admin-btn">
                              
								<a href="/question/update?questionNum=${list.questionNum}"
									id="btn1">게시물 수정</a> 
								<a href="/question/delete?questionNum=${list.questionNum}"
									id="btn2">게시물 삭제</a>
							</div>
						</c:if>
						<c:if test="${size eq 3}">
							<div id="admin-btn">

								<a href="/question/update?questionNum=${list.questionNum}"
									id="btn1">게시물 수정</a> <a
									href="/question/delete?questionNum=${list.questionNum}"
									id="btn2">게시물 삭제</a>
							</div>
						</c:if>

					</div>
					</tr>


				</c:forEach>
			</tbody>
		</div>


		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pager.startNum eq 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum}">&#60</a></li>
				</c:if>
				<c:if test="${pager.startNum ne 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum-1}">&#60</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${i}">${i}</a></li>
				</c:forEach>


				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link move" href="#" data-num="${pager.lastNum+1}">&#62</a></li>
			</ul>
			<input type="hidden" value="${pager.page}" name="page" id="page">
		</nav>
		<a id="move-question" href="#question-title"></a>
	</section>

	<script type="text/javascript">
		page = '${pager.page}'
        
		console.log(page)
		$('.move').click(function() {
			console.log(page)
			$('#page').val($(this).attr('data-num'));
			page = $('#page').val();
			console.log(page)
			$.ajax({
				type : 'GET',
				url : '/question/list?page=' + page,
				success : function(result) {
					$('#question-list').empty();
					$('#question-list').append(result);
					$('#move-question').get(0).click();
				}
			})
		})
	</script>
</body>
</html>