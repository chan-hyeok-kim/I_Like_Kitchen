<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	#list{
	padding: 5px;
	border-bottom: 1px solid gainsboro;
	
	}
	#questionKind{
	color:rgb(0, 0, 102);
	font-weight:bold;
	margin-top:0px;
	}
	#questionDate{
	color:grey;
	}
	#questionContents{
	width:700px;
	height:80px;
	margin: 20px;
	padding:0px;
	font-size:20px;
	margin:10px;
	font-weight:bold;
	}
	#id{
	color:grey;
	font-weight:bold;
	}
	#btn{
	color:white;
	background-color: skyblue;
	border-radius:40px;
	width: 230px;
	}
	
	#btn1{

	font-weight:bold;
	
	border-radius: 20px;
	}
	#btn2{

	font-weight:bold;
	
	padding:5px;
	border-radius: 20px;
	}
	#list a:hover{
	      background-color: black;
	      color:white;
	}
	#list a{
	     height: 40px;
	     padding: 3px;
	     margin:5px;
	     width:100;
		 padding:8px;
		 
	}
	#question-list a{
	     text-decoration: none;
 	}
 	#admin-btn a:hover{
 	     background-color: black;
 	  
 	}
 	#qustion-add-btn{
 	     text-align: right;
 	}
 	
</style>
</head>
<body>
<section id="question-list">
	
	
	<div id="qustion-add-btn">
	 <a href="/question/add" id="btn">	
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>문의&nbsp;작성하기
</a>
	</div>
		<div id="btnon">
		
		
	 <tbody>
		  	<c:forEach items="${list}" var="list">
		<div id="list">
	 	  <div style="width: 930px">
		 <tr class="grid gap-3" href="/question/view?questionNum=${list.questionNum}">
		  <td type="hidden" ${list.questionNum}></td>
		  <td type="hidden" ${list.productNum}></td>
		   <span class="p-2 g-col-6" id="questionKind">[${list.questionKind}]</span>
		  <td class="p-2 g-col-6 ">
    		<span  id="id">${list.id}</span>
			</td>
		  <span>|</span>
		  <span class="p-2 g-col-6" id="questionDate">${list.questionDate}</span>
		  </div>
		  
		  <div class="p-2 g-col-6 overflow-auto" id="questionContents">${list.questionContents}</div>
		 
		 <c:forEach items="${sessionScope.member.roles}" var="r">
					<c:if test="${r.getRoleName() eq 'ADMIN'}">
		 <div id="admin-btn">
		 
		<a href="/question/update?questionNum=${list.questionNum}" id="btn1">게시물 수정</a> 
		<a href="/question/delete?questionNum=${list.questionNum}" id="btn2">게시물 삭제</a>
		</div>
		</c:if>
				</c:forEach>
		</div>	
		 </tr>
			

		</c:forEach>
	 </tbody>
	</div>
	 <div id="nav03" class="container text-center fs-3">
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
	</section>	
			
</body>
</html>