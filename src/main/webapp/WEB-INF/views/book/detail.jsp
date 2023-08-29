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
      width: 600px;
 }
</style>
</head>
<body>

<table class="book-table">
<thead>
   <tr>
      <th rowspan="2" width="20%"></th>
      <th width="80%"></th>
      
   </tr>
    <tr>
      
      <th>kto.productName</th>
   </tr>
  </thead>
   <tbody>
      <tr>
         <td>상품 선택</td> 
         <td></td> 
      </tr>
      <tr>
       <td>예약자</td>
       <td>${kto.memberDTO.name}</td>
      </tr>
       <tr>
       <td>결제 수단</td>
       <td></td>
      </tr>
      <tr>
       <td rowspan="2">사용시간</td>
       <td>${kto.bookDTO.startTime}</td>
      </tr>
      <tr>
       <td>${kto.bookDTO.endTime}</td>
      </tr>
       <tr>
       <td>예약 날짜</td>
       <td>${kto.bookDate}</td>
      </tr>
      <tr>
       <td>예약 금액</td>
       <td>${kto.payAmount}</td>
      </tr>
   </tbody>

</table>

<button id="btn" data-productNum="${kto. productNum}">결제하기</button>



<script src="/resources/js/refund.js"></script>
</body>
</html>