<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="../temp/bootStrap.jsp"></c:import>
	<style>
        #nav01{
        	height: 60px;
        	line-height: 60px; 
            border: 1px solid black;
            padding-right: 700px;
            text-align: center;
            margin-bottom: 100px;
            font-size: 18px;
        }
        #nav01 a{
            display: inline-block;
            width: 120px;
            text-decoration: none;
        }
        #nav02{
            width: 900px;
            margin: auto;
        }
        .contents{
        	height: 30px;
        	line-height: 30px; 
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            padding-left: 30px;
            position: relative;
        }
        .contents span:nth-child(2){
            padding-right: 100px;
        }
        .contents span:nth-child(4){
            position: absolute;
            right: 70px;
        }
    </style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div id="nav01">
        <a href="/notice/list">공지사항</a>
        <a href="oftenQnA/list">자주찾는 질문</a>
    </div>
    <div id="nav02">
        <h2>공지사항 관리</h2>

		<c:forEach items="${list}" var="kto">
			<div class="contents">
				<input type="checkbox">
	            <span>필독</span>
	            <span><a href="detail?noticeNum=${kto.noticeNum}">${kto.noticeTitle}</a></span>
	            <span>${kto.noticeDate}</span>
        	</div>
		</c:forEach>
    </div>
</body>
</html>