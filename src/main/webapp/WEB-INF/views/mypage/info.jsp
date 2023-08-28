<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
	<style>
		#nameSpan{
			margin-left: 15px;
			font-weight: bold;
		}
		.contents p{
			font-weight: bold;
		}
		.contents img{
			width: 200px;
		}
		.contents{
			width: 750px;
			padding: 25px 0 25px 0;
		}
		
		#listDiv div:nth-child(2){
			padding-bottom: 50px;
		}
		#listDiv div:nth-child(3) {
		    border-bottom: 1px solid black;
		}
		#updateBtn{
			margin-top: 50px;
		}
		
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
        
        <menu id="listDiv">
        	<div>
                <h3 style="margin: 50px 0 50px 0">내 정보 관리</h3>
            </div>
            
            <div class="contents">
            	<img src="/resources/img/gallery/gallery-1.jpg">
            	<span id="nameSpan">${kto.name}</span>님
            </div>
            <div class="contents">
            	<p>이메일</p>
            	<span>${kto.email}</span>
            </div>
            <div class="contents">
            	<p>전화번호</p>
            	<span>${kto.phone}</span>
            </div>
            
            <button id="updateBtn">계정 수정</button>
            <button id="deleteBtn">계정 탈퇴</button>
        </menu>
    </div>
    
    <script>
    	$("#updateBtn").click(function() {
			
    		$(location).attr("href", "memberUpdate?id=${kto.id}");
		});
    </script>
</body>
</html>