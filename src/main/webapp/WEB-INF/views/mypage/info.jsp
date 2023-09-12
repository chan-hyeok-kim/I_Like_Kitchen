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
			width: 120px;
		}
		.contents{
			width: 750px;
			padding: 25px 0 25px 0;
		}
		
		#listDiv div:nth-child(2){
			padding-bottom: 50px;
			font-size: 18px;
		}
		.contents:nth-child(n+3):nth-child(-n+4) {	
		    border-bottom: 1px solid black;
		}
		#updateBtn{
			margin-top: 50px;
			height: 32px;
            border: none;
            cursor: pointer;
            background-color: beige;
            border-radius: 3px;
		}
		#deleteBtn{
			height: 32px;
            border: none;
            cursor: pointer;
            background-color: beige;
            border-radius: 3px;
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
            	<img src="/resources/css/images/chef.png">
            	<span id="nameSpan">${member.name} </span>님
            </div>
            <div class="contents">
            	<p>이메일</p>
            	<span>${member.email}</span>
            </div>
            <div class="contents">
            	<p>전화번호</p>
            	<span>${member.phone}</span>
            </div>
           
            
            <form id="frm">
	            <input type="hidden" name="id" value="${member.id}">
            </form>
            
            <button id="updateBtn">계정 수정</button>
            <button id="deleteBtn">계정 탈퇴</button>
        </menu>
    </div>
    
    <c:import url="../temp/footer.jsp"></c:import>
    <script>
    	// 수정 버튼 클릭
    	$("#updateBtn").click(function() {
			
    		$.ajax({
    			type:"get",
    			url:"checkInfo",
    			data:{
    				id:"${member.id}",
    				password:"${member.password}"
    			},
    			success:function(){
    				$(location).attr("href", "checkInfo");
    			}
    		});			
		});
    	
    	// 탈퇴 버튼 클릭
		$("#deleteBtn").click(function() {
			let result = confirm("정말 계정을 탈퇴하시겠습니까?\n(복구불가)");
			
			if(!result){
				return;
			}
			
			$("#frm").attr("method", "post");
			$("#frm").attr("action", "delete");
			$("#frm").submit();
		});
    </script>
</body>
</html>