<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="q" %>
<!Doctype html>
<html>
  <head>
  <c:import url="../temp/bootStrap.jsp" ></c:import>
  <link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">
  <script src="/resources/js/color-modes.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.115.4">
    <title>ILikeKitChen</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
            
     </style>
      

<body>	
	<c:import url="../temp/header.jsp"></c:import>
	
 		<section class="py-5 text-center container">
		    <div class="row py-lg-5">
		      <div class="col-lg-6 col-md-8 mx-auto">
		        <h1 class="fw-light">Kitchen List</h1>
		        <p class="lead text-body-secondary">공유 주방 목록입니다. 확인후에 예약해주세요~</p>
		      </div>
		    </div>
			  <div class="album py-5 bg-body-tertiary">
    		<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<c:forEach items="${list}" var="d" varStatus="i">
					    <div class="container" width="100%" height="100%" fill="#55595c">
					        <div class="col">
					          <div class="card shadow-sm">
					            <a href="./detail?productNum=${d.productNum}"><img src="/resources/upload/product/${d.productFileDTOs[0].fileName}" width="100%" height="225"></a>
					              <div class="card-body">
					              <p class="card-text"><a class="link-underline link-underline-opacity-0 text-black" href="./detail?productNum=${d.productNum}">${d.productName}</a></p>
					              <p class="card-text"><a class="link-underline link-underline-opacity-0 text-black" href="./detail?productNum=${d.productNum}">${d.address}</a></p>
					              <div class="d-flex justify-content-between align-items-center">
					                <div class="btn-group">
					                  <button type="button" src="./detail?productNum=${d.productNum}" class="btn btn-sm btn-outline-secondary">View</button>
					                </div>
					                <small class="text-primary" href="./detail?productNum=${d.productNum}">${d.price}원</small>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
				</c:forEach>
					    </div>
					   </div>
					  </div>
					  <br>
		<nav aria-label="Page navigation example" >
		  <ul class="pagination" >
		  	
		    <li class="page-item ${pager.pre?'':'disabled'}" >
		      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
		    </c:forEach>
		    <c:if test="${pager.next}">
		    <li class="page-item" >
		      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    </c:if>
		  </ul>
		</nav>
		</section>

<br><br><br>
		<div class="input-group mb-3">
		 <form action="./list" method="get">
			  <select name="kind" class="form-select" aria-label="Default select example">
				  <option class="text-dark" value="name">Name</option>
				  <option class="text-dark" value="contents">Contents</option>
			  </select>
		  
			  <br><br><br>
			
			  <input type="text" name="search" class="form-control" aria-label="Amount (to the nearest dollar)">
			  <button type="submit" class="btn btn-primary">검색</button>
		  </form>
		</div>
<br><br><br>		
<a class="btn btn-info" href="./add">상품등록</a>
<br>
</body>
<footer>
<script type="text/javascript"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>