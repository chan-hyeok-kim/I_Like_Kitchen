<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">
	<c:import url="../temp/bootStrap.jsp" ></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
		<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Detail</h1>
      </div>
    </div>
    		<c:forEach items="${dto.productFileDTOs}" var="f">
	  			<img alt="" src="/resources/upload/product/${f.fileName}" height="500" width="500">
	    	</c:forEach>
	    			
	    	<h3>${requestScope.dto.productName}<h3>
	    	<p>${dto.contents}</p>
	    	<p>${dto.price} 원</p>
	    			
    
		<%-- <h1>${requestScope.dto.address}</h1>
		<div>
			${dto.contents}
		</div>
		<h1>${dto.price}</h1> --%>
		
		<a class="btn btn-danger" href="./delete?productNum=${dto.productNum}">삭제</a>
	</section>
	<script src="/resources/js/delete.js"></script>
</body>
<footer>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>