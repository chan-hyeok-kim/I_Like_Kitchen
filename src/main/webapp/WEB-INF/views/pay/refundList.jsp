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
 #btn-home{
      width: 100px;
      height:40px;
      margin-top:150px;
      margin-left:20px;
 }
 #detail-link a{
      text-decoration: none;
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
</style>
</head>
<body>

<section>


<c:forEach items="${refundList}" var="r" varStatus="fi">

<div>
<div id="book-table-list">
<div id="book-img">
<img style="width: 250px; height: 200px;" src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
<div id="detail-link" style="display: flex; padding-top: 10px;"><p><a href="../product/detail?productNum=${productList[fi.index].productNum}"> ${productList[fi.index].productName} > </a></p></div>
   
</div>
<div id="book-table-div">
   <div><p>예약 장소</p><p>${productList[fi.index].productName}</p></div>
   <div><p>예약자</p><p>${member.name}</p></div>
   <div><p>환불 사유</p><p>${r.refundReason}</p></div>
   <div><p>환불 날짜</p><p>${r.refundDate}</p></div>
   <div><p>환불 금액</p><p>${r.refundAmount}</p></div>
  
  
   </div>
    
  </div>
 
</div>



<div id="list-border"></div>
         
</c:forEach>

</section>


</body>
</html>