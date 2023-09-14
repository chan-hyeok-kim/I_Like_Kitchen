<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section id="product-lowlist-section">

<div class="row" id="product-list-div">
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
		
			</div>
		
		<br>

		<!-- 					  <div class="room-pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div> -->
		<%-- <nav class="room-pagination" aria-label="Page navigation example">
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
		</nav> --%>
		
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
				url : '/product/low?page=' + page,
				success : function(result) {
					$('#product-lowlist-section').empty();
					$('#product-lowlist-section').append(result);
				}
			})
		})
	</script>
		
</body>
</html>