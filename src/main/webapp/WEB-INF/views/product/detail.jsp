<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Detail Template">
<meta name="keywords" content="HTML, detail, product">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/resources/img/window.png" type="image/x-icon"
	sizes="16x16">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>Detail</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/album/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=367c3993888d805f9a675197a5be6e56&libraries=services&autoload=false"></script>
</head>

<style>
#product-wrapper-section {
	width: 1200px;
	margin-top: 40px;
	padding-bottom: 85px;
}

#product-contents-ul {
	display: flex;
	list-style: none;
	border: 1px solid gainsboro;
	padding-left: 0px;
	margion-top: 20px;
}

#product-question {
	padding-bottom: 85px;
}

#product-contents-ul li {
	width: 130px;
	border-right: 1px solid gainsboro;
	cursor: pointer;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	padding-right: 10px;
	text-align: center;
}

#product-contents-ul a {
	text-decoration: none;
}

#product-contents-ul a:hover {
	color: black;
}

:visited {
	
}

.text-warn {
	text-align: center;
}

#card-body a {
	text-decoration: none;
}

#card-body a:hover {
	color: black
}

#card-body a:active {
	color: black
}

#contents-p1 {
	padding-top: 30px;
	font-weight: bolder;
}

#contents-notice {
	padding-bottom: 50px;
}

#product-contents-div1 {
	padding-bottom: 65px;
}

#contents {
	padding-top: 85px;
	padding-bottom: 85px;
}

#product-map {
	border-bottom: 1px solid gainsboro;
	margin-bottom: 20px;
}

#product-map>p {
	font-weight: bold;
}

#question-title {
	font-weight: bold;
	border-bottom: 1px solid gainsboro;
}

#review-title {
	font-weight: bold;
	border-bottom: 1px solid gainsboro;
	margin-bottom: 30px;
}
#align-btn{
    text-align: right;
}
</style>


<body>
	<c:import url="../temp/header.jsp"></c:import>

	<section id="product-wrapper-section" class="container">
		<div class="row" id="product-contents-div1">
			<!-- 왼쪽 영역 (이미지 캐러셀) -->
			<div class="col-md-6">
				<div id="carouselExampleAutoplaying" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${kto.productFileDTOs}" var="f" varStatus="loop">
							<div class="carousel-item ${loop.first ? 'active' : ''}">
								<img src="/resources/upload/product/${f.fileName}"
									class="d-block" alt="..." width="600px" height="500px">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				
			</div>

			<!-- 오른쪽 영역 (상품 정보) -->
			<div class="col-md-6">
				<div class="wrapper">
					<div class="card mb-4 rounded-3 shadow-sm border-primary">
						<div class="card-header py-3 text-bg-primary border-primary">
							<h4 class="my-0 fw-normal">${requestScope.kto.productName}</h4>
						</div>
						<div class="card-body" id="card-body">
							<ul class="list-unstyled mt-3 mb-4">
								<li id="address">${kto.address}</li>
								<li><a href="#map"><img alt=""
										src="/resources/icon/free-icon-location-5.png">위치</a></li>
							</ul>
							<h3 class="card-title pricing-card-title">${kto.price}
								<small class="text-body-secondary fw-light">원/~시간당</small>
							</h3>
							<button type="button" id="book-btn"
								class="w-100 btn btn-lg btn-primary"
								data-productNum="${kto.productNum}">예약하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
   <div id="align-btn">
        <c:if test="${size eq 3 || size eq 2}">
	<button id="update-btn" class="btn btn-outline-primary">수정</button>
	<button id="del" class="btn btn-outline-primary" data-delete-num="${kto.productNum}">삭제</button>
</c:if>
     </div>  

		<ul id="product-contents-ul">
			<li><a href="#contents">상세설명</a></li>
			<li><a href="#product-review">후기</a></li>
			<li><a href="#product-question">문의</a></li>
			<li><a href="#contents">주의/환불</a></li>
		</ul>

		<div style="font-weight: bold" class="text-warn">
			<span>
				<p style="font-weight: bold">
					<img src="/resources/icon/free-icon-warning-6.png">직거래 유도 주의
					안내 <img src="/resources/icon/free-icon-warning-6.png">
				</p>
			</span>
		</div>
		<p class="text-warn">호스트 현금 결제 유도 시, 신고바랍니다. 아이라이크키친은 현금 직거래로 발생하는
			사고를 책임 지지 않습니다.</p>

		<div id="contents">
			<div style="font-weight: bold">소개</div>


			<p id="contents-p1">
			<div>*예약 전 아래 설명들을 필독 해주시기 바랍니다.*</div>
			<div id="contents-notice">(고객 미숙지로 인한 불이익 시 아이라이크키친이 책임지지
				않습니다.)</div>

			${kto.contents}
			</p>
		</div>






		<div id="product-question">
			<div id="question-title">
				문의
				<c:if test="${not empty member}">
					<div id="qustion-add-btn">
						<button class="btn btn-primary" id="btn-question-add"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-pencil-square"
								viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>문의&nbsp;작성하기
						</button>
					</div>
				</c:if>

			</div>
		</div>








		<div id="product-review">
			<div id="review-title">
				후기
				<c:if test="${not empty member}">
					<div id="review-add-btn">
						<button class="btn btn-primary" id="btn-review-add">

							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-pencil-square"
								viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>리뷰&nbsp;작성하기
						</button>
					</div>
				</c:if>
			</div>

		</div>




		<div id="product-map">
			<p>위치</p>
		</div>

		<div id="map" style="width: 1000px; height: 700px;"></div>

		<div id="clickLatlng"></div>

		<div id="address"></div>




	</section>


</body>
<script src="/resources/js/delete.js"></script>
<script src="/resources/js/product/productBook.js"></script>
<script src="/resources/js/product/kakaoMap.js"></script>


<script type="text/javascript">
	$.ajax({
		type : 'GET',
		url : '/question/list',
		success : function(result) {
			$('#product-question').append(result);
		}
	})

	$.ajax({
		type : 'GET',
		url : '/review/list',
		success : function(result) {
			$('#product-review').append(result);
		}
	})

	$('#btn-review-add').click(function() {
		let productNum = '${kto.productNum}'
		location.href = '/review/add?productNum=' + productNum
	})
	
	$('#btn-question-add').click(function() {
		let productNum = '${kto.productNum}'
		console.log(typeof productNum)
		location.href = '/question/add?productNum=' + productNum
	})
	
	
	
	
	
</script>

<footer>


	<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>