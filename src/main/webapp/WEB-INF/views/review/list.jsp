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



	<div id="btnon">
	
	</div>
	<tbody>
		<c:forEach items="${list}" var="list">
			<div id="review-list">
				<tr class="grid gap-3">
					<td type="hidden" ${list.reviewNum}></td>

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
					<img src="/resources/upload/notice/${f.fileName}">
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