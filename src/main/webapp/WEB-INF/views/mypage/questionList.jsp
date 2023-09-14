<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
	<style type="text/css">
	#myQuestion-list-section{
	       width:700px;
	}
	#question-pager-nav{
	       margin-top:40px;
	}
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
        
        <section id="myQuestion-list-section">
        <menu id="listDiv">
        	<div>
                <h3>문의 내역</h3>
            </div>
            
            <table class="border mx-auto p-2" style="width: 1300px;">
				<thead>
				 
				 <tr class="grid gap-3 border bg-warning p-2 text-dark bg-opacity-10">
				  <th class="p-2 g-col-6 border">상품</th>
				  <th class="p-2 g-col-6 border">작성자</th>
				  <th class="p-2 g-col-6 border" style="width:500px">작성내용</th>
				  <th class="p-2 g-col-6 border">질문날짜</th>
				  <th class="p-2 g-col-6 border">질문종류</th>
				 </tr>
				</thead>
				
				<tbody>
					  	<c:forEach items="${list}" var="list" varStatus="quest">
				
				 <tr class="grid gap-3">
				  <td class="p-2 g-col-6 border"><img style="width: 90px; height: 60px" alt="" src="/resources/upload/product/${productList[quest.index].productFileDTOs[0].fileName}"> 
				  ${productList[quest.index].productName}
				  </td>
				  <td class="p-2 g-col-6 border">
				  		<a href="/question/view?questionNum=${list.questionNum}">${list.id}</a>
					</td>
				  <td class="p-2 g-col-6 overflow-auto border">${list.questionContents}</td>
				  <td class="p-2 g-col-6 border">${list.questionDate}</td>
				   <td class="p-2 g-col-6 border">${list.questionKind}</td>
				 </tr>
					
				
				</c:forEach>
				 </tbody>
				
			</table>
			    
        <nav aria-label="Page navigation example" id="question-pager-nav">
			<ul class="pagination">
				<c:if test="${pager.startNum eq 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum}">&laquo;</a></li>
				</c:if>
				<c:if test="${pager.startNum ne 1}">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${pager.startNum-1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link move" href="#"
						data-num="${i}">${i}</a></li>
				</c:forEach>


				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link move" href="#" data-num="${pager.lastNum+1}">&raquo;</a></li>

				<div style="width: 700px; display: flex;">
					<li style="margin-left: 250px;"><input type="hidden"
						value="${pager.page}" name="page" id="page">
						
						
						</li>
						</div>
						</ul>
						</nav>
			
        </menu>
        
        
        
    
						
        </section>
    </div>
    
    <c:import url="../temp/footer.jsp"></c:import>
</body>

<script type="text/javascript">
   
</script>
</html>