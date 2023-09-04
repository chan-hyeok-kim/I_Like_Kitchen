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
 #btn{
      margin-top: 10px;
      margin-left: 140px;
      width: 100px;
      height: 40px;
      /* background: #F4F3EA;
      border: 1px solid black;
       */
 }
 #list-border{
      width: 1000px;
 }
 #book-table-div{
      margin-left:200px;
      margin-bottom: 200px;
 }

</style>
</head>
<body>

<section>
<c:if test="${empty list}">
진행 중인 예약 내역이 없습니다 
</c:if>

<c:if test="${not empty list}">



<c:forEach items="${list}" var="i" varStatus="fi">
<div>
<img src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
</div>
<div id="book-table-div">
<table class="book-table">
<thead>
   <tr>


      <th rowspan="2">
      </th>
      <th></th>
      
      
   </tr>
  </thead>
   <tbody>
  <%--  <tr>
   <td>상품명</td>
   <td>${product.productName}</td>
   </tr> --%>
    
      <tr>
       <td>예약자</td>
       <td>${member.name}</td>
      </tr>
       <tr>
       <td>예약번호</td>
       <td>${i.bookNum}</td>
      </tr>
      <tr>
       <td>예약 날짜</td>
       <td>${i.bookDate}</td>
      </tr>
      <tr>
       <td>사용시간</td>
       <td id="bookTime" data-startTime="${i.startTime}" data-endTime="${i.endTime}"></td>
      </tr>
        <tr>
         <td>인원</td> 
         <td>${i.headCount}</td> 
      </tr>
      <tr>
       <td>승인 상태</td>
       <td>${i.bookCheck}</td>
      </tr>
   </tbody>

</table>
           
<button id="btn" class="btn btn-outline-primary" data-bookNum="${i.bookNum}">결제하기</button>

<div id="list-border"></div>
</div>        
            
</c:forEach>
</c:if>
</section>

<script>
let bookNum = $('#btn').attr("data-bookNum");
console.log(bookNum);

$('#btn').click(function(){
	
	    location.href="../pay/add?bookNum="+bookNum;
	})
   


start = $('#bookTime').attr('data-startTime');
end = $('#bookTime').attr('data-endTime')
console.log(typeof start);
console.log(start);
console.log(end);

start=start.substring(11,16);
end=end.substring(11,16);
console.log(start);

$('#bookTime').append(start)
$('#bookTime').append('~'+end)



</script>
</body>
</html>