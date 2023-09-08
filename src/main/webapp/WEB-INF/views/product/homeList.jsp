<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
          margin-left: -130px;
   }
   
</style>
</head>
<body>


 <div class="album py-5 bg-body-tertiary">
  <p><h4 id="product-list-title">오늘 업데이트 되었어요 <img alt="" src="/resources/img/home/free-icon-new-61886.png"> </h4></p>
    		<div class="container">
				<div class="row product-img-list row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<c:forEach items="${list}" var="d" varStatus="i">
					    <div class="container" width="100%" height="100%" fill="#55595c">
					        <div class="col">
					          <div class="card shadow-sm">
					            <a href="/product/detail?productNum=${d.productNum}"><img src="/resources/upload/product/${d.productFileDTOs[0].fileName}" width="100%" height="225"></a>
					              <div class="card-bo">
					              <p class="card-text"><a class="link-underline link-underline-opacity-0 text-black" href="/product/detail?productNum=${d.productNum}">${d.productName}</a></p>
					              <p class="card-text"><a class="link-underline link-underline-opacity-0 text-black" href="/product/detail?productNum=${d.productNum}">${d.address}</a></p>
					              <div class="d-flex justify-content-between align-items-center">
					                <div class="btn-group">
					                  <button type="button" src="/product/detail?productNum=${d.productNum}" class="btn btn-sm btn-outline-secondary">View</button>
					                </div>
					                <small class="text-primary" href="/product/detail?productNum=${d.productNum}">${d.price}원</small>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
				</c:forEach>
					    </div>
					   </div>
					  </div>

</body>
</html>