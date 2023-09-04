<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
		<div>
	 <a href="/question/add" class="btn btn-warning">문의등록</a>
	 	</div>
	 </div>
	 
	 <tbody>
		  	<c:forEach items="${list}" var="list">
		<div>
	 	
		 <tr class="grid gap-3" href="/question/view?questionNum=${list.questionNum}">
		  <td type="hidden" ${list.questionNum}></td>
		  <td type="hidden" ${list.productNum}></td>
		   <span class="p-2 g-col-6 ">[${list.questionKind}]</span>
		  <td class="p-2 g-col-6 ">
    		<a href="/question/view?questionNum=${list.questionNum}">${list.id}</a>
			</td>
		  <span>|</span>
		  <span class="p-2 g-col-6 ">${list.questionDate}</span>
		</div>	
		  <div class="p-2 g-col-6 overflow-auto border">${list.questionContents}</div>
		 </tr>
			

		</c:forEach>
	 </tbody>
	</div>
		
			<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>