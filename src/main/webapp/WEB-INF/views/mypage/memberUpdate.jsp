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
                <h3 style="margin: 50px 0 50px 0">내 정보 수정</h3>
            </div>
            
            <form>
	            <table>
	            	<tr>
	            		<th>이름</th>
	            		<td><input type="text" id="name" name="name" value="${kto.name}"></td>
	            	</tr>
	            	<tr>
	            		<th>새 비밀번호</th>
	            		<td><input type="password" id="password" name="password"></td>
	            	</tr>
	            	<tr>
	            		<th>새 비밀번호 확인</th>
	            		<td><input type="password" id="passwordCheck" name="passwordCheck"></td>
	            	</tr>
	            	<tr>
	            		<th>이메일</th>
	            		<td><input type="email" id="email" name="email" value="${kto.email}"></td>
	            	</tr>
	            	<tr>
	            		<th>전화번호</th>
	            		<td><input type="text" id="phone" name="phone" value="${kto.phone}"></td>
	            	</tr>
	            </table>
            </form>
        </menu>
    </div>
</body>
</html>