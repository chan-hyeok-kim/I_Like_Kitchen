<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

	
	 
	<div>
		<a href="/review/add" class="btn btn-warning">리뷰등록</a>
	</div>
	 <tbody>
			  	<c:forEach items="${list}" var="list">
		 <div class="border">
		 <tr class="grid gap-3">
		  <td type="hidden" ${list.reviewNum}></td>
		  <h4>${list.reviewRate}</h4>	  <td class="p-2 g-col-6 ">
    		<a href="/review/view?reviewNum=${list.reviewNum}">${list.id}</a>
			</td>|
		  <td class="p-2 g-col-6 border">${list.reviewDate}</td>
		 <br>
		  <td class="p-2 g-col-6 border" style="width:1000px">${list.reviewContents}</td>
		 </tr>
		 </div>
		 <div>
	        <c:forEach items="${kto.ktos}" var="f">
		        <img src="/resources/upload/notice/${f.fileName}">
	        </c:forEach>
        </div>
		</c:forEach>
		
	 </tbody>
	 <div id="nav03">
    	<c:if test="${pager.page > 1}">
	    	<a href="list?page=${pager.page - 1}">
		    	<span>◁</span>
	    	</a>
	    </c:if>
    
    	<c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
    		<a href="list?page=${i}" class="pageColor">${i}</a>
    	</c:forEach>
    	
    	<c:if test="${pager.page < pager.totalPage}">
	    	<a href="list?page=${pager.page + 1}">
	    		<span>▷</span>
	    	</a>
    	</c:if>
    </div>
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>