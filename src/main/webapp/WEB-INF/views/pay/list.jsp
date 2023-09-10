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
    border-bottom: 1px solid gainsboro;
    height: 10px;
 }
 
 .book-table-div div{
     display: flex;
     
 }
 .book-table-div{
     margin-left: 30px;
     vertical-align: top;
     
 }
 .book-table-div div p{
     width: 103px;
 }
 #book-list-unorder{
    list-style: none;
 }
 #book-img{
    
 }
 .book-table-list{
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

<section id="entire">


<c:forEach items="${payList}" var="p" varStatus="fi">
<div>
<div class="book-table-list">
<div id="book-img">
<img style="width: 250px; height: 200px;" src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
<div id="detail-link" style="display: flex; padding-top: 10px;"><p><a href="../product/detail?productNum=${productList[fi.index].productNum}"> ${productList[fi.index].productName} > </a></p></div>
 
</div>

<div class="book-table-div">
   <div><p>예약자</p><p>${member.name}</p></div>
   <div><p>예약번호</p><p>${list[fi.index].bookNum}</p></div>
   <div><p>연락처</p><p>${productList[fi.index].phone}</p></div>
   <div><p>결제 날짜</p><p>${p.payDate}</p></div>
   <div><p>결제 금액</p><p>${p.payAmount}</p></div>
   
   <div><p></p><p></p></div>
   </div>
    
<!-- Button trigger modal -->
<c:if test="${empty refundList[fi.index]}">
<button id="btn-home${fi.count}" type="button" class="btn btn-outline-primary btn-home" data-bs-toggle="modal" data-bs-target="#exampleModal${fi.count}">
환불
</button>
</c:if>
<c:if test="${not empty refundList[fi.index]}">
<button style="font-size: 16px" type="button" class="btn btn-outline-primary">
환불완료
</button>
</c:if>
  </div>
 
</div>

   <!-- Modal -->
<div class="modal fade" id="exampleModal${fi.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" data-count="${fi.count}">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">환불 요청</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="data-refund${fi.count}" data-refund-payNum="${p.payNum}" data-refund-amount="${p.payAmount}" data-refund-orderNum="${p.bookNum}">
        환불 사유를 입력해주세요
      <input class="form-control" name="reason" id="reason${fi.count}" class="reason">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" class="btn">닫기</button>
        <button id="btn-refund${fi.count}" type="button" class="btn btn-primary" class="btn-refund">환불하기</button>
      </div>
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
<script type="text/javascript">
 id = '${member.id}'
	//$('#data-id').attr('data-id')
page = '${pager.page}'

$('.move').click(function(){
  $('#page').val($(this).attr('data-num'));
 let listPage = $('#page').val(); 
 let listSearch = $('#search').val(); 
 $.ajax({
	type:'GET',
	url:'/pay/list?id='+id+'&page='+listPage+'&search='+listSearch
    ,success:function(result){
		$('#entire').empty();
		console.log(result)
		$('#entire').append(result);
	}  
})
}) 

$('#search-btn').click(function(){
	  $('#page').val($(this).attr('data-num'));
	  
	  let listSearch = $('#search').val(); 
	  $.ajax({
	 	type:'GET',
	 	url:'/pay/list?id='+id+'&page='+page+'&search='+listSearch
	     ,success:function(result){
	 		$('#entire').empty();
	 		console.log(result)
	 		$('#entire').append(result);
	 	}  
	 })
	 }) 
</script>
<script src="/resources/js/pay/refund.js"></script>
</body>
</html>