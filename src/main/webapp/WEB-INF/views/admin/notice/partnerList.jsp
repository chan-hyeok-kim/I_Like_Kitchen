<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<style>
  #admin-partner-table{
       width: 70%;
       margin-left: 40px;
       margin-top: 40px;
  }
  
   
</style>

<section>
<table class="table" id="admin-partner-table">
  <thead class="table-dark">
    <tr>
      <th scope="col">사업자 등록번호</th>
      <th scope="col">대표명</th>
      <th scope="col">상호명</th>
      <th scope="col">이메일</th>
      <th>허가</th>
    </tr>
  </thead>
  <tbody>
  
  <c:forEach items="${list}" var="i">
    <tr>
      <th scope="row">${i.partnerNum}</th>
      <td>${i.partnerName}</td>
      <td>${i.companyName}</td>
      <td>${i.partnerEmail}</td>
      <td>승인</td>
    </tr>
    </c:forEach>
    
    </tbody>
</table>
</section>


   </div>
   <script src="/resources/js/partnerDetail.js">
  
   </script>

