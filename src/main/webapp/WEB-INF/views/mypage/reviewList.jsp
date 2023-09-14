<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
	<style type="text/css">
	 #review-detail-link:hover{
	    color:#0D6EFD;
	 }
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
        
        <section id="myReview-list-section">
        <menu id="listDiv">
        	<div>
                <h3 style="margin: 50px 0 50px 0">후기 내역</h3>
            </div>
            
            <table class="border mx-auto p-2 " style="width: 1300px;">
				<thead>
				 <tr class="grid gap-3 border bg-warning p-2 text-dark bg-opacity-10">
				  <th class="p-2 g-col-6 border">상품명</th>
				  <th class="p-2 g-col-6 border">작성자</th>
				  <th class="p-2 g-col-6 border">평점</th>
				  <th class="p-2 g-col-6 border">후기내용</th>
				  <th class="p-2 g-col-6 border">후기날짜</th>
				 </tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="list" varStatus="review">
				 <tr class="grid gap-3">
				  <td class="p-2 g-col-6 border"><img style="width: 90px; height: 60px" alt="" src="/resources/upload/review/${list.ktos[0].fileName}"> 
				  <a href="/product/detail?productNum=${list.productNum}">${productList[review.index].productName}</a>
				  </td>
				  <td class="p-2 g-col-6 border">
				  		${list.id}
					</td>
				 
				  <td class="p-2 g-col-6 border">${list.reviewRate}</td>
				  <td class="p-2 g-col-6 border" style="width:500px">${list.reviewContents}</td>
				  <td class="p-2 g-col-6 border">${list.reviewDate}</td>
				 </tr>
				</c:forEach>
				</tbody>
			
			</table>
			
			<nav aria-label="Page navigation example" id="question-pager-nav">
			<ul class="pagination">
				<c:if test="${pager.startNum eq 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum}">&laquo;</a></li>
				</c:if>
				<c:if test="${pager.startNum ne 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum-1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${i}">${i}</a></li>
				</c:forEach>


				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link move" href="#" data-num="${pager.lastNum+1}">&raquo;</a></li>

				<div style="width: 700px; display: flex;">
					<li style="margin-left: 250px;"><input type="hidden"
						value="${pager.page}" name="page" id="page">
						
						
					</li>
				</div>
				</ul>
			</nav>
			
        </menu>
        </section>
    </div>
    
    <c:import url="../temp/footer.jsp"></c:import>
    
    <script type="text/javascript">
$('.move').click(function() {
	$('#page').val($(this).attr('data-num'));
	page = $('#page').val();

	$.ajax({
		type : 'GET',
		url : '/mypage/reviewList?page='+page,
		success : function(result) {
			
			$('#myReview-list-section').empty();
			$('#myReview-list-section').append(result);
			
		}
	})
})
</script>
    
</body>
</html>