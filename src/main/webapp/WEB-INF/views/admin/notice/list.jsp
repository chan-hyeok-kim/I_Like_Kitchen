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
        #nav01{
        	height: 60px;
        	line-height: 60px; 
            border-top: 1px solid black;
    		border-bottom: 1px solid black;
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
            border-bottom: 1px solid black;
            padding-left: 30px;
            position: relative;
        }
        .contents span:nth-child(3){
            position: absolute;
            left: 220px;
        }
        .contents span:nth-child(4){
            position: absolute;
            right: 70px;
        }
        #title{
        	margin-bottom: 30px;
        }
        #title h2{
            display: inline-block;
        }
        #addBtn{
            position: relative;
            left: 600px;
            bottom: 6px;
            height: 32px;
            border: none;
            cursor: pointer;
        }
        #deleteBtn{
            position: relative;
            left: 600px;
            bottom: 6px;
            height: 32px;
            border: none;
            cursor: pointer;
        }
        
        #nav03{
        	text-align: center;
		    margin-top: 50px;
		    font-size: 17px;
        }
    </style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<div id="nav01">
        <a href="/notice/list">공지사항</a>
        <a href="https://www.notion.so/d87dd9eefdde460f90a773b47fa833f3?pvs=4" target="_blank">자주찾는 질문</a>
    </div>
    <div id="nav02">
        <div id="title">
            <h2>공지사항 관리</h2>
            <button id="addBtn">공지사항 작성</button>
            <button id="deleteBtn">삭제</button>
        </div>

		<div class="contents">
			<input type="checkbox" id="allCheck">
            <span></span>
            <span>제목</span>
            <span>작성날짜</span>
       	</div>
		<c:forEach items="${list}" var="kto">
			<div class="contents">
				<input type="checkbox" class="check01" value="${kto.noticeNum}">
				<c:choose>
					<c:when test="${kto.vitalCheck == '1'}">					
			            <span>필독</span>
					</c:when>
					<c:otherwise>
						<span></span>
					</c:otherwise>
				</c:choose>
	            <span><a href="detail?noticeNum=${kto.noticeNum}">${kto.noticeTitle}</a></span>
	            <span>${kto.noticeDate}</span>
        	</div>
		</c:forEach>
    </div>
    <div id="nav03">
    	<c:forEach var="i" begin="1" end="5">
    		<a href="">${i}</a>
    	</c:forEach>
    </div>

    <script>
        // 공지사항 전체 체크/해제
        $("#allCheck").click(function(){
            
            if($("#allCheck").is(":checked")){
                for(i of $(".check01")){
                    i.checked = true;
                }
            } else{
                for(i of $(".check01")){
                    i.checked = false;
                }
            }
        });

        // 공지사항 단일글 체크해제 시 전체체크 해제
        $(".check01").each(function(i, e){
        
            $(e).click(function(){
                if($(e).is(":checked") == false){
                    $("#allCheck").prop("checked", false);
                } 
            });
        });

        // 공지사항 작성 button 클릭시
        $("#addBtn").click(function(){
            $(location).attr("href", "add");
        });
        
        // 체크 클릭시 각 체크박스의 값 넘기기
        $(".check01").click(function() {
        	
        	let noticeNum = [];

        	if($(this).is(":checked") == true){
        		noticeNum.push($(this).val());
        	} else{ 
        		noticeNum.pop();
        	}            
        	
        	console.log(noticeNum);
        });
        // delete 버튼
        $("#deleteBtn").click(function() {
        	delete2();
        	
		});
        
        
        function delete2(){
        	if(noticeNum != null){
	        	$.ajax({
	        		type:"post",
	        		url:"delete",
	        		data:{
	        			noticeNum:noticeNum
	        		},
	        		success:function(){
	        			$(location).attr("href", "list");
	        		}
	        	});	        		
        	} else{
        		alert("게시물을 선택하세요.");
        	}
        }
    </script>
</body>
</html>