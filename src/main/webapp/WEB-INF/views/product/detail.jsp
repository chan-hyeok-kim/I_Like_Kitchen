<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Detail Template">
<meta name="keywords" content="HTML, detail, product">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">
<c:import url="../temp/bootStrap.jsp" ></c:import>
<title>Detail</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>

#wrapper{
	width:1000px;
	height:500px;
	margin:auto;
}
</style>


<body>
    <c:import url="../temp/header.jsp"></c:import>
    
    <section id="wrapper" class="container">
        <div class="row">
            <!-- 왼쪽 영역 (이미지 캐러셀) -->
            <div class="col-md-6">
                <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${kto.productFileDTOs}" var="f" varStatus="loop">
                            <div class="carousel-item ${loop.first ? 'active' : ''}">
                                <img src="/resources/upload/product/${f.fileName}" class="d-block" alt="..."
                                    width="500px" height="500px">
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
                        <div class="card-body">
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>${kto.contents}</li>
                            </ul>
                            <h3 class="card-title pricing-card-title">${kto.price}
                            <small class="text-body-secondary fw-light">원/~시간당</small></h3>
                            <button type="button" id="book-btn" class="w-100 btn btn-lg btn-primary"
                                data-productNum="${kto.productNum}">예약하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<%-- <body>
	<c:import url="../temp/header.jsp"></c:import>
<section id="wrapper">
<div whdth="500px">
	<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
		<c:forEach items="${kto.productFileDTOs}" var="f">
	    <div class="carousel-item active">
	      <img src="/resources/upload/product/${f.fileName}" class="d-block" alt="..." width="500px" height="500px">
	    </div>
		</c:forEach>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>

      <div class="wrapper">
        <div class="card mb-4 rounded-3 shadow-sm border-primary" whdth="200px">
          <div class="card-header py-3 text-bg-primary border-primary">
            <h4 class="my-0 fw-normal">${requestScope.kto.productName}</h4>
          </div>
          <div class="card-body ">
            <h3 class="card-title pricing-card-title">${kto.price}<small class="text-body-secondary fw-light">원/~시간당</small></h3>
            <ul class="list-unstyled mt-3 mb-4">
              <li>${kto.contents}</li>
            </ul>
            <button type="button" id="book-btn" class="w-100 btn btn-lg btn-primary" data-productNum="${kto.productNum}" >예약하기</button>
          </div>
        </div>
      </div>
    </section> --%>
<%--  <section class="py-5 text-center container">
  <div class="row py-lg-5">
    <div class="col-lg-6 col-md-6">
      <!-- 왼쪽 컬럼: 제품 사진과 제목 -->
      <h1 class="fw-light">Detail</h1>
      <img alt="" src="/resources/upload/product/${kto.productFileDTOs[0].fileName}" class="img-fluid" style="max-height: 100%; max-width: 90%;">
    </div>
    <div class="col-lg-6 col-md-6" style="width: 540px;">
      <!-- 오른쪽 컬럼: 예약 양식 또는 정보 -->
      <div class="room-details-item">
        <div class="mb-3">
<div class="card border-info mb-3" style="width: 320px; height: auto;">
  <div class="card-body">
    <h3 class="card-title">${requestScope.kto.productName}</h3>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">${kto.contents}</li>
    <li class="list-group-item">${kto.price} 원/~시간당
 </ul>
        <!-- 예약 양식을 추가하세요 -->
      <div>
        <button type="button" id="book-btn" class="btn btn-primary" data-productNum="${kto.productNum}">예약하기</button> 
		<a class="btn btn-danger" href="./delete?productNum=${kto.productNum}">삭제</a>
      </div>
    </div>
    </div>
    </div>
    </div>
    </div>
</section> --%>

    
<%--  <section class="py-5 text-center container">
  <div class="row py-lg-5">
    <div class="col-lg-6 col-md-8 mx-auto">
      <h1 class="fw-light">Detail</h1>

      <div class="text-center mb-4">
        <c:forEach items="${kto.productFileDTOs}" var="f">
          <img alt="" src="/resources/upload/product/${f.fileName}" class="img-fluid" style="max-height: 500px; max-width: 500px;">
        </c:forEach>
      </div>
      
      <h3 class="mb-3">${requestScope.kto.productName}</h3>
      <p class="mb-3">${kto.contents}</p>
      <p class="mb-4">${kto.price} 원</p>
    </div>
  </div>
	    			
		<button type="button" id="book-btn" class="btn btn-primary" data-productNum="${kto.productNum}">예약하기</button> 
		<a class="btn btn-danger" href="./delete?productNum=${kto.productNum}">삭제</a>

	</section> --%>



	<script src="/resources/js/delete.js"></script>
    <script src="/resources/js/product/productBook.js"></script>	
</body>
<footer>

<script src="/resources/js/bootstrap.bundle.min.js"></script>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>