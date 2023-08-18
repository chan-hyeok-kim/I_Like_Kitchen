<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </style>
</head>
<body>
	<div id="nav01">
        <a href="/notice/list">공지사항</a>
        <a href="oftenQnA/list">자주찾는 질문</a>
    </div>
    <div id="nav02">
        <h2>공지사항</h2>

		<div class="contents">
            <span>필독</span>
            <span>${kto.noticeTitle}</span>
            <span>${kto.noticeDate}</span>
       	</div>
        <div>
        	<p>${kto.noticeContents}</p>
        </div>
    </div>
</body>
</html>