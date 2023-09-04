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
                <h3>취소/환불 내역</h3>
            </div>

            <div id="gridDiv">
                
                    <button class="detailBtn">상세 내역</button>
                </div>
            </div>
            <div id="gridDiv">
                <div id="imgDiv">
                    <img src="../../img/kitchen01.jpg">
                </div>            
                <div id="contentsDiv">
                
                    <button class="detailBtn">상세 내역</button>
                </div>
            </div>
        </menu>
    </div>
</body>
</html>