<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../temp/bootStrap.jsp"></c:import>

<style type="text/css">
table{
      width: 400px;
      background: #F8F9FA;
      text-align: center;
 }
 .btn{
      margin-top: 0px;
      margin-left: 10px;
      width: 100px;
      height: 40px;
      /* background: #F4F3EA;
      border: 1px solid black;
       */
 }
 #btn-home{
      width: 100px;
      height:40px;
      margin-top:150px;
      margin-left:20px;
 }
 #list-border{
      width: 1000px;
      margin-top:20px;
    margin-bottom: 20px;
    border-bottom: 1px solid #ece6cc;
    height: 10px;
 }
 
 #book-table-div div{
     display: flex;
     
 }
 #book-table-div{
     margin-left: 30px;
     vertical-align: top;
     
 }
 #book-table-div div p{
     width: 103px;
 }
 #book-list-unorder{
    list-style: none;
 }
 #book-img{
    
 }
 #book-table-list{
    display: flex;
    width: 800px;
 }
 a:hover{
      color: black;
 }
 a:active{
      color: black;
 }
 a:visited{
      color: (52, 111, 238, 0.699);
 }
 #detail-link a{
      text-decoration: none;
 }
</style>
</head>
<body>

<section>


<c:forEach items="${payList}" var="p" varStatus="fi">
<div>
<div id="book-table-list">
<div id="book-img">
<img style="width: 250px; height: 200px;" src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
<div id="detail-link" style="display: flex; padding-top: 10px;"><p><a href="../product/detail?productNum=${productList[fi.index].productNum}"> ${productList[fi.index].productName} > </a></p></div>
 
</div>

<div id="book-table-div">
   <div id="detail-link"><p>예약 장소</p><p>${productList[fi.index].productName}</p></div>
   <div><p>예약자</p><p>${member.name}</p></div>
   <div><p>연락처</p><p>${productList[fi.index].phone}</p></div>
   <div><p>결제 날짜</p><p>${p.payDate}</p></div>
   <div><p>결제 금액</p><p>${p.payAmount}</p></div>
   
   <div><p></p><p></p></div>
   </div>
    
<!-- Button trigger modal -->
<c:if test="${empty refundList}">
<button id="btn-home" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  환불하기
</button>
</c:if>
<c:if test="${not empty refundList}">
<button type="button" class="btn btn-outline-primary">
환불 완료
</button>
</c:if>
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

			</ul>
		</nav>


</section>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">환불 요청</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="data-refund" data-refund-payNum="${kto.payNum}" data-refund-amount="${kto.payAmount}" data-refund-orderNum="${kto.orderNum}">
        환불 사유를 입력해주세요
      <input class="form-control" name="reason" id="reason">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" class="btn">닫기</button>
        <button type="button" class="btn btn-primary" class="btn-refund">환불하기</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">


  
  </script>
<script src="/resources/js/pay/refund.js"></script>
</body>
</html>