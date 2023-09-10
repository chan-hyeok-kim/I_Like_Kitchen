<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<section id="entire">


<c:forEach items="${refundList}" var="r" varStatus="fi">

<div>
<div id="book-table-list">
<div id="book-img">
<img style="width: 250px; height: 200px;" src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
<div id="detail-link" style="display: flex; padding-top: 10px;"><p><a href="../product/detail?productNum=${productList[fi.index].productNum}"> ${productList[fi.index].productName} > </a></p></div>
   
</div>
<div id="book-table-div">
   <div><p>예약자</p><p>${memberList[fi.index].name}</p></div>
   <div><p>예약번호</p><p>${list[fi.index].bookNum}</p></div>
   <div><p>환불 사유</p><p>${r.refundReason}</p></div>
   <div><p>환불 날짜</p><p>${r.refundDate}</p></div>
   <div><p>환불 금액</p><p>${r.refundAmount}</p></div>
  
  
   </div>
    
  </div>
 
</div>



<div id="list-border"></div>
         
</c:forEach>

<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pager.startNum eq 1}">
					<li class="page-item"><a class="page-link move"
						href="#" data-num="${pager.startNum}">Previous</a></li>
				</c:if>
				<c:if test="${pager.startNum ne 1}">
					<li class="page-item"><a class="page-link move"
						href="#" data-num="${pager.startNum-1}">Previous</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link move"
						href="#" data-num="${i}">${i}</a></li>
				</c:forEach>


				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link move" href="#" data-num="${pager.lastNum+1}">Next</a></li>

            <li style="margin-left:250px;"> <input type="hidden" value="${pager.page}" name="page" id="page">
			<div class="col-sm-3">
				<input class="form-control me-2" type="search" name="search"
					placeholder="예약 번호를 입력해주세요" aria-label="Search" id="search" style="width:300px;">
			</div>
			</li><li>
			<div class="col" style="padding-left: 0px">
				<button style="margin-left: 0px" class="btn btn-dark" type="submit" id="search-btn" data-member-id="${member.id}">검색</button>
				</li>
			</ul>

		</nav>

</section>

</body>
<footer>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>