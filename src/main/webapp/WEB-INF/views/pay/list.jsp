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
 #btnHome{
      margin-top: 10px;
      margin-left: 140px;
      width: 100px;
      height: 40px;
 }
 #list-border{
      width: 1000px;
      margin-top:20px;
      margin-bottom: 20px;
      border-bottom: 1px solid #ece6cc;
      height: 10px;
}
</style>
</head>
<body>

<section>
<c:if test="${empty payList}">
<h3>완료하신 결제 내역이 없습니다</h3>
</c:if>


<c:if test="${not empty payList}">
<c:forEach items="${payList}" var="p">
<div id="pay-table-div">
<table class="pay-table">
<thead>
   <tr>
      <th rowspan="2">사진</th>
      <th>상품명</th>
      
   </tr>
    
  </thead>
   <tbody>
  
      <tr>
       <td>예약자</td>
       <td>${member.name}</td>
      </tr>
      <tr>
        <td>결제 날짜</td>
        <td>${p.payDate}</td>
       </tr>
      <tr>
       <td>사용시간</td>
       <td id="bookTime" data-startTime="${list.startTime}" data-endTime="${list.endTime}"></td>
      </tr>
      <tr>
       <td>결제 금액</td>
       <td>${p.payAmount}</td>
      </tr>
   </tbody>
</table>


<!-- Button trigger modal -->
<button id="btnHome" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  환불하기
</button>

<div id="list-border"></div>
</div>

</c:forEach>

</c:if>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="btn">환불하기</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">

 let start = $('#bookTime').attr('data-startTime');
 let end = $('#bookTime').attr('data-endTime')
  console.log(typeof start);
  console.log(start);
  console.log(end);
  
  start=start.substring(11,16);
  end=end.substring(11,16);
  console.log(start);
  
  $('#bookTime').append(start)
  $('#bookTime').append('~'+end)
  
  </script>
<script src="/resources/js/pay/refund.js"></script>
</body>
</html>