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
<div id="book-table-list">
<div id="book-img">
<img style="width: 250px; height: 200px;" src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
</div>

<div id="book-table-div">
   <div><p>예약자</p><p>예약번호</p></div>
   <div><p>${member.name}</p><p>${i.bookNum}</p></div>
   <div><p>예약 날짜</p><p>사용시간</p></div>
   <div><p>${i.bookDate}</p><p class="bookTime" data-startTime="${i.startTime}" data-endTime="${i.endTime}"></p></div>
   <div><p>인원</p><p>승인 상태</p></div>
   <div><p>${i.headCount}</p><p class="check" data-check="${i.bookCheck}">${i.bookCheck}</p></div>
   
   <div><p></p><p></p></div>
   </div>
    <button id="btn" class="btn btn-outline-primary btn-pay" data-bookNum="${i.bookNum}">결제하기</button>
  
  </div>
 
</div>

   
   
 

<div id="list-border"></div>
         
</c:forEach>
</c:if>
</section>
<script src="/resources/js/book/list.js"/>

</body>
</html>