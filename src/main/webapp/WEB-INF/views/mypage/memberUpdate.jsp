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
		.contents{
			width: 750px;
			padding: 25px 0 25px 0;
		}
		.contents:nth-child(n+1):nth-child(-n+4) {	
		    border-bottom: 1px solid black;
		}
		
		.contents span:nth-child(2){
			position: absolute;
    		left: 600px;
		}
		
		#updateBtn{
			height: 32px;
            border: none;
            cursor: pointer;
            background-color: beige;
            border-radius: 3px;
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
                <h3 style="margin: 50px 0 50px 0">내 정보 수정</h3>
            </div>
            
            <form id="frm" method="post">
            	<div class="contents">
            		<span>이름</span>
            		<span>
            			<input type="text" id="name" name="name" value="${kto.name}">
	            		<input type="hidden" id="id" name="id" value="${kto.id}"> 
            		</span>
            	</div>
            	<div class="contents">
            		<span>새 비밀번호</span>
            		<span>
            			<input type="password" id="password" name="password" value="${kto.password}">
            		</span>
            	</div>
            	<div class="contents">
            		<span>새 비밀번호 확인</span>
            		<span>
            			<input type="password" id="passwordCheck" value="${kto.password}">
            		</span>
            	</div>
            	<div class="contents">
            		<span>이메일</span>
            		<span>
            			<input type="email" id="email" name="email" value="${kto.email}">
            		</span>
            	</div>
            	<div class="contents">
            		<span>전화번호</span>
            		<span>
            			<input type="tel" id="phone" name="phone" value="${kto.phone}">
            		</span>
            	</div>
	            
	            <button type="submit" id="updateBtn">등록하기</button>
            </form>
        </menu>
    </div>
    
    <script>
    	// 등록하기 버튼을 눌렀을때
    	$("#updateBtn").click(function() {
			
    		if($("#name").val() == ""){
    			alert("이름을 입력하세요.");
    			$("#name").focus();
    			
    		} else if($("#password").val() == ""){
    			alert("비밀번호를 입력하세요.");
    			$("#password").focus();
    			
    		} else if($("#passwordCheck").val() == ""){
    			alert("비밀번호를 입력하세요.");
    			$("#passwordCheck").focus();
    			
    		} else if($("#password").val() != $("#passwordCheck").val()){
    			alert("비밀번호를 다시 확인해주세요.");
    			$("#password").focus();
    			
    		} else if($("#email").val() == ""){
    			alert("이메일을 입력하세요.");
    			$("#email").focus();
    			
    		} else if($("#phone").val() == ""){
    			alert("전화번호를 입력하세요.");
    			$("#phone").focus();
    			
    		} else{
    			$.ajax({
    				type:"post",
    				url:"memberUpdate",
    				data:{
    					id:$("#id").val(),
    					name:$("#name").val(),
    					password:$("#password").val(),
    					email:$("#email").val(),
    					phone:$("#phone").val()
    				},
    				success:function(result){
    					$(location).attr("href", "info");
    				}
    				
    			});
    		}
    		
		});
    </script>
</body>
</html>