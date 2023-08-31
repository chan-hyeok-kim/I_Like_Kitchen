<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<style>
   li-table-2 ul{
     list-style: none;
     
   }
   .li-table{
     width: 900px; border:1px solid gainsboro;
     background: #F8F9FA;
     height: 400px;
   }
   .li-table ul{
     clear: left;
   }
   .li-table .subject{
     font-weight: bold; text-align: center;
   }
   .li-table-2 ul li{
     text-align: center; float: left;
     border-bottom: 1px solid gainsboro; 
     border-left: 1px solid gainsboro;
     width: 300px;
     height: 50px;
     padding-top: 10px;
   }
   .li-table ul .col{
     width: 297px;
   }
  
   
</style>


<div class="li-table-2">
  <ul>
     <li class="col">사업자 등록번호</li>
     <li>${kto.partnerNum}</li>
  </ul>
 
  <ul>
     <li class="col">대표자명</li>
     <li>${kto.partnerName}</li>
  </ul>
  <ul>
     <li class="col">상호명</li>
     <li>${kto.companyName}</li>
    
  </ul>
  <ul>
     <li class="col">사업자 이메일</li>
     <li>${kto.partnerEmail}</li>
  </ul>
  <ul>
     <li class="col">사업장 소재지</li>
     <li>${kto.partnerAddress}</li>
  </ul>
  <ul>
     <li class="col">계좌번호</li>
     <li>${kto.partnerAccount}</li>
  </ul>
  
  
  <ul>
     <li class="col">허가</li>
     <li><button id="permit" data-permitNum="${i.partnerNum}">승인</li>
  </ul>
  <ul>
     <li class="col">거절</li>
     <li><button>삭제</li>
  </ul>
     
   </div>
     
