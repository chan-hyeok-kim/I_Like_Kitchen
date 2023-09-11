<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="q"%>
<!Doctype html>
<html>
<head>
<c:import url="../temp/bootStrap.jsp"></c:import>
<link rel="icon" href="/resources/img/window.png" type="image/x-icon"
	sizes="16x16">
<script src="/resources/js/color-modes.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.115.4">
<title>ILikeKitChen</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/album/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

</head>
<style>
.container_product {
	cursor: pointer;
	
}

#product-title {
	border-bottom: 1px solid #ece6cc;
	margin-left: 0px;
	margin-right: 0px;
	display: flex;
	padding-bottom: 10px;
}

#product-title div {
	display: flex;
}

#product-title-text {
	text-align: left;
	font-weight: bold;
	width: 990px;
}

#product-ul-list2 {
	border-top: 1px solid #ece6cc;
	padding-top: 20px;
}

#product-search-div {
	margin-left: 500px;
}

#product-search-div input, button, select {
	
}

#product-select-list {
	text-align: right;
	width: 150px;
	margin-right: 0px;
}

.rooms-section img {
	height: 232.5px;
	width: 350px;
}
.rooms-section .ri-text{
    height: 204.39px; 
}
</style>

<body>
	<c:import url="../temp/header.jsp"></c:import>

	<section class="py-5 text-center container">
		<div class="row py-lg-5">
			<div class="" id="product-title">
				<div class="lead text-body-secondary" id="product-title-text">공간
					검색 결과</div>
				<div id="product-select-list">
					<select>
						<option selected>인기순</option>
						<option value="1">최신등록순</option>
						<option value="2">낮은가격순</option>
						<option value="3">높은가격순</option>
					</select>
				</div>



			</div>
		</div>
		<!-- Rooms Section Begin -->
		<section class="rooms-section spad">
			<div class="row">
				<c:forEach items="${list}" var="d" varStatus="i">
					<div class="col-lg-4 col-md-6">
						<div class="container_product"
							onclick="window.location.href='./detail?productNum=${d.productNum}'">
							<div class="room-item">
								<img
									src="/resources/upload/product/${d.productFileDTOs[0].fileName}">
								<div class="ri-text">
									<h4 src="./detail?productNum=${d.productNum}">${d.productName}</h4>
									<h5 src="./detail?productNum=${d.productNum}">${d.address}</h5>
									<br>
									<h3 src="./detail?productNum=${d.productNum}">${d.price}<span>원/~시간당</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 한 행에 3개의 제품을 배치하려면 여기까지 3번 반복 -->
				<!-- 예를 들어, i.index % 3 === 2 조건을 사용하여 한 행을 마감할 수 있습니다. -->
				<c:if test="${i.index % 3 == 2}">
			</div>
			</div>
			</div>
			<div class="row">
				</c:if>
			</div>
		</section>
		<br>

		<!-- 					  <div class="room-pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div> -->
		<nav class="room-pagination" aria-label="Page navigation example">
			<ul class="pagination" id="product-ul-list2">

				<li class="page-item ${pager.pre?'':'disabled'}"><a
					class="page-link"
					href="./list?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}"
					aria-label="Previous fa-long-arrow-left"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
				</c:forEach>
				<c:if test="${pager.next}">
					<li class="page-item"><a class="page-link"
						href="./list?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}"
						aria-label="Next fa-long-arrow-right"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>



			</ul>
		</nav>


		<div class="input-group mb-3" id="product-search-div">
			<form action="./list" method="get" class="d-flex align-items-center">
				<!-- 선택 옵션과 레이블 -->
				<div class="input-group" style="width: 150px;">
					<select style="width: 50px;" name="kind"
						class="form-select bg-dark text-white"
						aria-label="Default select example">
						<option class="text-white" value="name">Name</option>
						<option class="text-white" value="contents">Contents</option>
					</select>
				</div>

				<!-- 검색 입력 필드 -->
				<input style="width: 300px;" type="text" name="search"
					class="form-control" aria-label="Amount (to the nearest dollar)">

				<!-- 검색 버튼 -->
				<button style="width: 130px;" type="submit"
					class="btn btn-primary btn-sm btn-block">검 색</button>
			</form>
		</div>

	</section>






</body>
<footer>
	<script type="text/javascript"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>