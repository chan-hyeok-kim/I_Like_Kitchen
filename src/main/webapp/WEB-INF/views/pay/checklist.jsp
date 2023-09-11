<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 승인 페이지</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
<style type="text/css">
   #entire{
        width: 1400px;
        margin: auto;
        padding-top: 100px;
   }
   #refund-checklist{
        text-align: justify;
       
   }
   #refund-checklist td{
        vertical-align: center;
   }
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<section id="entire">



<table class="table table-hover" id="refund-checklist">
  <thead>
    <tr>
    <th></th>
      <th>장소명</th>
      <th scope="col">예약자</th>
      <th scope="col">예약번호</th>
      <th scope="col">환불 사유</th>
      <th scope="col">환불 날짜</th>
      <th>환불 금액</th>
      <th>승인</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${refundList}" var="r" varStatus="fi">
  
    <tr>
    <td><img style="width: 100px; height: 80px;" src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}"></td>
      <td class="align-middle">${productList[fi.index].productName}</td>
      <td scope="row" class="align-middle">${memberList[fi.index].name}</td>
      <td class="align-middle">${list[fi.index].bookNum}</td>
      <td class="align-middle">${r.refundReason}</td>
      <td class="align-middle">${r.refundDate}</td>
      <td class="align-middle">${r.refundAmount}</td>
      <td class="align-middle"><button id="get-refund-num${fi.count}" data-refund-num="${r.refundNum}" class="btn btn-primary get-refund-num">승인</button></td>
    </tr>
    </c:forEach>
  </tbody>
</table>




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
<script src="/resources/js/pay/refundCheck.js"></script>
<footer>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>