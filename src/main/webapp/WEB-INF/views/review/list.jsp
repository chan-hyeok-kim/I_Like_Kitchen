<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
#review-list{
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
#product-review{
    padding-bottom: 85px;   
}
#review-add-btn{
 	     text-align: right;
 	}
</style>
</head>
<body>

<section>

<div id="review-add-btn">
		<a href="/review/add" id="btn"><svg
				xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path
					d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
					d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>리뷰&nbsp;작성하기</a>
</div>

	<div id="btnon">
	
	</div>
	<tbody>
		<c:forEach items="${list}" var="list">
			<div id="review-list">
				<tr class="grid gap-3">
					<td type="hidden" ${list.reviewNum}></td>
					
					<td><img src="/resources/upload/review/${list.ktos[0].fileName}"></td>

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
				<c:forEach items="${sessionScope.member.roles}" var="r">
					<c:if test="${r.getRoleName() eq 'ADMIN'}">
						<a href="/review/update?reviewNum=${list.reviewNum}" id="btn1">게시물
							수정</a>
						<a href="/review/delete?reviewNum=${list.reviewNum}" id="btn2">게시물
							삭제</a>
					</c:if>
				</c:forEach>

			</div>
			<div>
				<c:forEach items="${kto.ktos}" var="f">
					<img src="/resources/upload/review/${f.fileName}">
				</c:forEach>
			</div>
		</c:forEach>


	</tbody>
	<div id="nav03" class="container text-center fs-3">
		<c:if test="${pager.page > 1}">
			<a href="list?page=${pager.page - 1}"> <span>◁</span>
			</a>
		</c:if>

		<c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
			<a href="list?page=${i}" class="pageColor">${i}</a>
		</c:forEach>

		<c:if test="${pager.page < pager.totalPage}">
			<a href="list?page=${pager.page + 1}"> <span>▷</span>
			</a>
		</c:if>
	</div>

</section>
</body>
</html>