<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
        
        <menu id="listDiv">
        	<div>
                <h3 style="margin: 50px 0 50px 0">후기 내역</h3>
            </div>
            
            <table class="border mx-auto p-2 " style="width: 1600px;">
				<thead>
				 <tr class="grid gap-3 border bg-warning p-2 text-dark bg-opacity-10">
				  <th class="p-2 g-col-6 border">후기번호</th>
				  <th class="p-2 g-col-6 border">작성자</th>
				  <th class="p-2 g-col-6 border">평점</th>
				  <th class="p-2 g-col-6 border">후기내용</th>
				  <th class="p-2 g-col-6 border">후기날짜</th>
				 </tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="list">
				 <tr class="grid gap-3">
				  <td class="p-2 g-col-6 border">${list.reviewNum}</td>
				  <td class="p-2 g-col-6 border">
				  		<a href="/review/view?reviewNum=${list.reviewNum}">${list.id}</a>
					</td>
				 
				  <td class="p-2 g-col-6 border">${list.reviewRate}</td>
				  <td class="p-2 g-col-6 border" style="width:1000px">${list.reviewContents}</td>
				  <td class="p-2 g-col-6 border">${list.reviewDate}</td>
				 </tr>
				</c:forEach>
				</tbody>
			
			</table>
        </menu>
    </div>
    
    <c:import url="../temp/footer.jsp"></c:import>
</body>
</html>