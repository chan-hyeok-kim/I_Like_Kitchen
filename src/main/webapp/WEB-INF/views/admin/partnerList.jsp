<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<style>
   ul{
     list-style: none;
   }
   .li-table{
     width: 900px; border:1px solid gainsboro;
   }
   .li-table ul{
     clear: left;
   }
   .li-table .subject{
     font-weight: bold; text-align: center;
   }
   .li-table ul li{
     text-align: center; float: left;
     border-bottom: 1px solid gainsboro; 
     border-left: 1px solid gainsboro;
     border-right:1px solid gainsboro;
     width: 200px;
   }
   .li-table ul .col{
     width: 197px;
   }
   ul li:last-child{
     width: 100px;
   }
  
   
</style>


<div class="li-table">
  <ul>
     <li class="col">사업자 등록번호</li>
     <li>대표자명</li>
     <li>상호명</li>
     <li>사업자 이메일</li>
     <li style="width: 100px;">허가</li>
  </ul>
  <c:forEach items="${list}" var="i">
  <ul>
     <li class="col">${i.partnerNum}</li>
     <li>${i.partnerName}</li>
     <li><button id="company-name" data-company="${i.companyName}">${i.companyName}</button></li>
     <li>${i.partnerEmail}</li>
     <li><button id="permit" data-permit="${i.partnerNum}">승인</button></li>
  </ul>
  </c:forEach>
   </div>
   <script src="/resources/js/partnerDetail.js">
  
   </script>

