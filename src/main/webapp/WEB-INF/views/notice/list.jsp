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
            border-top: 1px solid #ece6cc;
    		border-bottom: 1px solid #ece6cc;
            padding-right: 700px;
            text-align: center;
            margin-bottom: 150px;
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
            border-bottom: 1px solid black;
            padding-left: 53px;
            position: relative;
        }
        .conTitle{
        	font-weight: bold;
        }
        .conList{
        	cursor: pointer;
        }
        .contents span:nth-child(1){
            padding-right: 100px;
            font-weight: bold;
            color: red;
        }
        .contents span:nth-child(2){
            position: absolute;
            left: 200px;
        }
        .contents span:nth-child(3){
            position: absolute;
            right: 70px;
        }
        #title{
        	margin-bottom: 30px;
        }
        
        #nav03{
        	text-align: center;
		    margin: 50px 0 200px 0;
		    font-size: 20px;
		    font-weight: bold;
        }
        #nav03 a{
        	margin-right: 5px;
        }
    </style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div id="nav01">
        <a href="/notice/list">공지사항</a>
        
    </div>
    <div id="nav02">
        <div id="title">
        	<h2>공지사항</h2>
        </div>

		<div class="contents conTitle">
            <span style="color:black">공지</span>
            <span>제목</span>
            <span>작성날짜</span>
       	</div>
		<c:forEach items="${list}" var="kto">
			<div class="contents conList">
	            <c:choose>
					<c:when test="${kto.vitalCheck == '1'}">					
			            <span>필독</span>
					</c:when>
					<c:otherwise>
						<span></span>
					</c:otherwise>
				</c:choose>
	            <span>${kto.noticeTitle}</span>
	            <span>${kto.noticeDate}</span>
	            <input type="hidden" id="noticeNumVal" value="${kto.noticeNum}">
        	</div>
		</c:forEach>
    </div>
    
    <div id="nav03">
    	<c:if test="${pager.page > 1}">
	    	<a href="list?page=${pager.page - 1}">
		    	<span>◁</span>
	    	</a>
	    </c:if>
    
    	<c:forEach var="i" begin="${pager.startNum}" end="${pager.lastNum}">
    		<a href="list?page=${i}" class="pageColor">${i}</a>
    	</c:forEach>
    	
    	<c:if test="${pager.page < pager.totalPage}">
	    	<a href="list?page=${pager.page + 1}">
	    		<span>▷</span>
	    	</a>
    	</c:if>
    </div>
    
    <c:import url="../../temp/footer.jsp"></c:import>
    <script>
	 	// 현재 페이지의 a태그 색깔 변화
		$(".pageColor").each(function(i, e) {
			if($(this).text() == ${pager.page}){
				$(this).css("color", "red");
			} 
		});
	 	
	 	// contents div 클릭시
	 	$(".conList").click(function() {
			$(location).attr("href", "detail?noticeNum=" + $(this).find("#noticeNumVal").val());
		});
    </script>
</body>
</html>