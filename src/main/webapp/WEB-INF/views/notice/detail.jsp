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
            width: 1000px;
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
        .contents span:nth-child(1){
            padding-right: 100px;
        }
        .contents span:nth-child(3){
            position: absolute;
            right: 70px;
        }
        
        .contents02{
        	margin-bottom: 50px;
        	margin-top: 50px;
        }
        
        #title{
        	margin-bottom: 30px;
        }
        #title h2{
            display: inline-block;
        }
        #updateBtn{
            position: relative;
            left: 680px;
            bottom: 6px;
            height: 32px;
            border: none;
            cursor: pointer;
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
    	<div id="title">
        	<h2>공지사항</h2>
        	<button id="updateBtn">공지사항 수정</button>
        </div>

		<div class="contents">
            <span>필독</span>
            <span>${kto.noticeTitle}</span>
            <span>${kto.noticeDate}</span>
       	</div>
        <div class="contents02">
        	<p>${kto.noticeContents}</p>
        </div>
        
        <div>
	        <c:forEach items="${kto.ktos}" var="f">
		        <img src="/resources/upload/notice/${f.fileName}">
	        </c:forEach>
        </div>
    </div>
    
    <script>
    	$("#updateBtn").click(function() {
			$(location).attr("href", "update?noticeNum=${kto.noticeNum}");
		});
    </script>
</body>
</html>