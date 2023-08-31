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
		#contents{
			text-align: center;
			padding-right: 275px;
		}
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
        
        <menu id="listDiv">
            <div>
                <h3>내 정보 관리</h3>
            </div>

            <div id="contents">
            	<p>개인정보 확인을 위해 비밀번호를 입력해주세요.</p>
            	
            	<div>
            		<input type="text" id="checkPW" name="password">
            		<button id="checkBtn">회원 확인</button>
            	</div>
            </div>
        </menu>
    </div>
    
    <script>
    	$("#checkBtn").click(function() {
    		
    		if(${kto.password} == $("#checkPW").val()){
    			$(location).attr("href", "memberUpdate");
    			
    		} else{
	    		alert("비밀번호가 같지 않습니다.");
    		}
		});
    </script>
</body>
</html>