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
      margin-left: 100px;
      width: 200px;
      /* background: #F4F3EA;
      border: 1px solid black;
       */
 }

 

</style>
</head>
<body>

<table class="book-table">
<thead>
<c:forEach items="${list}" var="i"></c:forEach>
   <tr>
      <th rowspan="2">상품사진</th>
      <th>${product.productName}</th>
      
   </tr>
  </thead>
   <tbody>
  <%--  <tr>
   <td>상품명</td>
   <td>${product.productName}</td>
   </tr> --%>
      <tr>
         <td>상품 선택</td> 
         <td>${i.choice}</td> 
      </tr>
      <tr>
       <td>예약자</td>
       <td>${member.name}</td>
      </tr>
       <tr>
       <td>예약번호</td>
       <td>${i.orderNum}</td>
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
       <td>승인 상태</td>
       <td>${i.bookCheck}</td>
      </tr>
   </tbody>

</table>

<button id="btn" class="btn btn-outline-primary" data-orderNum="${kto.orderNum}">결제하기</button>



<script>
let orderNum = $('#btn').attr("data-orderNum");
console.log(orderNum);

$('#btn').click(function(){
	
	    location.href="../pay/add?orderNum="+orderNum;
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