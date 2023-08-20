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
 .room-booking button{
    
    font-size: 14px;
    border: 1px solid #dfa974;
    border-radius: 2px;
    color: #dfa974;
    font-weight: 500;
    background: transparent;

    height: 46px;
    margin-top: 30px;
}
</style>
<!-- 아임포트  -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>


<div class="ri-text">
                           
결제예정금액

  <table>


  </table>

<table >
<thead>
   <tr>
       <th colspan="2">호스트 정보</th>
       <th></th>
   </tr>
</thead>
<tbody>
     <tr>
        <td>상호명</td>
        <td></td>
     </tr>
     <tr>
        <td>대표자명</td>
        <td></td>
     </tr>
     <tr>
        <td>소재지</td>
        <td></td>
     </tr>
     <tr>
        <td>사업자번호</td>
        <td></td>
     </tr>
     <tr>
        <td>연락처</td>
        <td></td>
      </tr>
      <tr>
        <td>EMAIL</td>
        <td></td>
      </tr>
</tbody>


</table>

환불규정 안내



결제수단 선택

<div class="room-booking">
<button data-bs-toggle="modal" data-bs-target="#exampleModal">결제하기</button>


 <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">결제</h1>
        
      </div>
      <div class="modal-body">
          <h4 style="font-weight: bold">결제하시겠습니까?</h4>
    <table>
     <tr>
        <td>예약공간</td>
        <td></td>
     </tr>
     <tr>
        <td>예약날짜</td>
        <td></td>
     </tr>
     <tr>
        <td>예약시간</td>
        <td></td>
     </tr>
     <tr>
        <td>예약인원</td>
        <td></td>
     </tr>
     <tr>
        <td>결제예정금액</td>
        <td></td>
      </tr>
      </div>
      </table>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="btn">결제하기</button>
      </div>
    </div>
  </div>
</div>
 
 
 
 </div>

<script src="/resources/js/pay.js"></script>
</body>
</html>