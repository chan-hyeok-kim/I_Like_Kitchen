<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<style>
  #admin-partner-table{
       width: 70%;
       margin-left: 40px;
       margin-top: 40px;
  }
  #permit-list-page{
       padding-left:40px;
  }
   
</style>

<section id="entire">
<table class="table" id="admin-partner-table">
  <thead class="table-dark">
    <tr>
      <th scope="col">사업자 등록번호</th>
      <th scope="col">대표명</th>
      <th scope="col">상호명</th>
      <th scope="col">이메일</th>
      <th>해제</th>
    </tr>
  </thead>
  <tbody>
  
  <c:forEach items="${list}" var="i">
    <tr>
      <th class="align-middle" scope="row">${i.partnerNum}</th>
      <td class="align-middle">${i.partnerName}</td>
      <td class="align-middle">${i.companyName}</td>
      <td class="align-middle">${i.partnerEmail}</td>
      <td><button class="btn btn-dark partner-delete" data-delete="${i.id}" data-delete-num="${i.partnerNum}">파트너 해제</button></td>
    </tr>
    </c:forEach>
    
    </tbody>
</table>

<div>
<nav aria-label="Page navigation example" id="permit-list-page">
			<ul class="pagination">
				<c:if test="${pager.startNum eq 1}">
					<li class="page-item"><a class="page-link move"
						href="#" data-num="${pager.startNum}">Previous</a></li>
				</c:if>
				<c:if test="${pager.startNum ne 1}">
					<li class="page-item"><a class="page-link move"
						href="#" data-num="${pager.startNum-1}">Previous</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link move"
						href="#" data-num="${i}">${i}</a></li>
				</c:forEach>


				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link move" href="#" data-num="${pager.lastNum+1}">Next</a></li>

           <div style="display: flex; width: 700px;">
		  <li style="margin-left:250px;"><input type="hidden" value="${pager.page}" name="page" id="page">
			<div class="" style="display: flex;">
				<input class="form-control" type="search" name="search"
					placeholder="예약 번호를 입력해주세요" aria-label="Search" id="search" style="width:300px;">
			
				<button class="btn btn-dark" type="submit" id="search-btn" data-member-id="${member.id}">검색</button>
				</div>
				
				</li>
				</div>
			</ul>
		
		</nav>
</div>		
		
		
</section>


   </div>
   
<script type="text/javascript">

page = '${pager.page}'

$('.move').click(function(){
  $('#page').val($(this).attr('data-num'));
 let listPage = $('#page').val(); 
 let listSearch = $('#search').val(); 
 $.ajax({
	type:'GET',
	url:'/admin/partnerPermitList?page='+listPage+'&search='+listSearch
    ,success:function(result){
		$('#entire').empty();
		
		$('#entire').append(result);
	}  
})
}) 

$('#search-btn').click(function(){
	  $('#page').val($(this).attr('data-num'));
	  
	  let listSearch = $('#search').val(); 
	  $.ajax({
	 	type:'GET',
	 	url:'/admin/partnerPermitList?page='+page+'&search='+listSearch
	     ,success:function(result){
	 		$('#entire').empty();
	 		
	 		$('#entire').append(result);
	 	}  
	 })
	 }) 
</script>
   <script src="/resources/js/admin/partnerList.js">
  
   </script>

