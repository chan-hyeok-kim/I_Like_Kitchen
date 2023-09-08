<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">
	<c:import url="temp/bootStrap.jsp"></c:import>
	
	<style type="text/css">
	 #carouselExampleCaptions{
	            height: 500px;
	            width: 80%;
	            padding-left: 15%;
	            margin-right: 0;
	            /* 패딩마진 나중에 다시줘야함  */
	 }
	 .carousel-indicators{
	            height: 500px;
	 }
	 #carouselExampleCaptions img{
	            height: 500px;
	 }
	 .footer-section{
	            height: 200px;
	 }
	 .col-lg-3 offset-lg-1{
	            margin-top: 100px;
	 }
	 #home-contents{
	      border-bottom: 1px solid gainsboro;     
	 }
	 
	 
	 .album{
           padding-left: 200px;
           padding-right: 200px;
           
     }
     #product-list-title{
	      margin-left: 100px;
     }
     .product-img-list{
          width: 1400px; 
          margin-top: 20px;
          margin-left: -170px;
     }
     #detail-icon{
          color: red;
     }
     #container{
          margin-left: 40px;
          margin-right: 0px;
     }
      #shadow-sm{
          margin-top: 25px;
     }
     #main-home-section{
          border-top: 1px solid gainsboro; 
     }
     
    /* .product-img-list img{
          width: 270px;
          height: 200px;
     }
      #shadow-sm a{
          width: 270px;
          height: 200px;
     }
     #shadow-sm div{
          width: 270px;
          height: 130px;
     }
     #shadow-sm{
          width: 270px;
          height: 320px;
          margin-right: 0px;
     }
     .product-background{
          width: 270px;
          height: 320px;
     } */
     #home-title{
          margin-left: 300px;
     }
     #home-title-div{
          margin-top: 20px;
          margin-left: 340px;
     }
    
     
     
	</style>
</head>


<body>
	<c:import url="temp/header.jsp"></c:import>
	<section id="main-home-section">
	<div id="home-title-div">
	<p><h4 class="home-title">인기장소 피드&nbsp;&nbsp;<img alt="" src="/resources/img/home/thumbs-up_295489.png"></h4></p>
	<p class="home-title">최근 예약이 가장 많은 장소에요!</p>
	</div>
 
 <div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-indicators" id="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  
  
  <div class="carousel-inner">
   
     <div class="carousel-item active">
  <img src="/resources/upload/product/${list[0].productFileDTOs[0].fileName}" class="d-block w-100" alt="...">
     <div class="carousel-caption d-none d-md-block">
        <h5>${list[0].productName}</h5>
        <p></p>
      </div>
    </div>
     
     <c:forEach items="${list}" var="d" varStatus="i">
     <c:if test="${i.count le 2}">
    <div class="carousel-item">
      <img src="/resources/upload/product/${d.productFileDTOs[0].fileName}" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>${d.productName}</h5>
        <p></p>
      </div>
    </div>
    </c:if>
    </c:forEach> 
    
   
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" style="color: black;" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>



<div id="home-contents"> 
 <div class="album py-5 bg-body-tertiary">
  <p><h4 id="product-list-title">오늘 업데이트 되었어요 <img alt="" src="/resources/img/home/free-icon-new-61886.png"> </h4></p>
    		<div class="container" id="container">
				<div class="row product-img-list row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<c:forEach items="${list}" var="d" varStatus="i">
		<c:if test="${i.index lt 6}">
					    <div class="container" width="100%" height="100%" fill="#55595c">
					        <div class="col product-background">
					          <div class="card shadow-sm" id="shadow-sm">
					            <a href="/product/detail?productNum=${d.productNum}"><img src="/resources/upload/product/${d.productFileDTOs[0].fileName}" width="100%" height="225"></a>
					              <div class="card-body">
					              <p class="card-text"><a class="link-underline link-underline-opacity-0 text-black" href="/product/detail?productNum=${d.productNum}">${d.productName}&nbsp;<span id="detail-icon">New!</span></a></p>
					              <p class="card-text"><a class="link-underline link-underline-opacity-0 text-black" href="/product/detail?productNum=${d.productNum}">${d.address}</a></p>
					              <div class="d-flex justify-content-between align-items-center">
					                <div class="btn-group">
					                  
					                </div>
					                <small class="text-primary" href="/product/detail?productNum=${d.productNum}">${d.price}원/&nbsp;&nbsp;1시간 당</small>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					      </c:if>
				</c:forEach>
					    </div>
					   </div>
					  </div>
 <div class="row justify-content-center" style="background-color: rgba(248,249,250,1); padding-bottom: 20px;">
					<div class="col-md-4">
						<a href="/product/list" class="btn btn-primary d-block">신규공간 전체 보기 <span class="fa fa-long-arrow-right"></span></a>
					</div>
				</div>

</div>


				
		


</section>
</body>


<footer>
<c:import url="./temp/footer.jsp"></c:import>
</footer>

<script type="text/javascript">
 /*  $.ajax({
	  type:'GET',
	   url:'/product/homeList',
	   success:function(result){
		   $('#home-contents').html(result)
	   }
	  
  }) */

</script>

</html>
