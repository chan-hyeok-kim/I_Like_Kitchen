<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="../../temp/bootStrap.jsp"></c:import>
	<style>
        #nav01{
        	height: 60px;
        	line-height: 60px; 
            border: 1px solid #ece6cc;
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
            margin-bottom: 200px;
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
            left: 700px;
            bottom: 6px;
            height: 32px;
            border: none;
            cursor: pointer;
        }
        #deleteBtn{
            position: relative;
            left: 700px;
            bottom: 6px;
            height: 32px;
            border: none;
            cursor: pointer;
        }
        
        #imgDiv img{
        	max-width: 60%;
        	border-radius: 10px;
        }
    </style>
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<div id="nav01">
        <a href="/notice/list">공지사항</a>
    </div>
    <div id="nav02">
    	<div id="title">
        	<h2>공지사항</h2>
        	<c:if test="${size eq 3}">
        	<button id="updateBtn">수정</button>
        	<button id="deleteBtn">삭제</button>
        	</c:if>
        </div>

		<div class="contents">
            <span>필독</span>
            <span>${kto.noticeTitle}</span>
            <span>${kto.noticeDate}</span>
       	</div>
        <div class="contents02">
        	<pre>${kto.noticeContents}</pre>
        </div>
        
        <form id="frm">
        	<input type="hidden" name="noticeNum" value="${kto.noticeNum}">
        </form>
        <div id="imgDiv">
	        <c:forEach items="${kto.ktos}" var="f">
		        <img src="/resources/upload/notice/${f.fileName}">
	        </c:forEach>
        </div>
    </div>
    
    <c:import url="../../temp/footer.jsp"></c:import>
    <script>
    	// update 버튼
    	$("#updateBtn").click(function() {
			$(location).attr("href", "update?noticeNum=${kto.noticeNum}");
		});
    	
    	// delete 버튼
    	$("#deleteBtn").click(function() {
    		let check = confirm("삭제 하시겠습니까");
    		
    		if(!check){
    			return;
    		}
    		
    		$("#frm").attr("method", "post");
    		$("#frm").attr("action", "delete");
    		$("#frm").submit();
		});
    </script>
</body>
</html>