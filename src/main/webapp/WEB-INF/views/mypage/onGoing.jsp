<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<style>
#book-detail-title{
	margin-bottom: 40px;
}

#list-border{
    margin-top:20px;
    margin-bottom: 20px;
    border-bottom: 1px solid #ece6cc;
    height: 10px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
    
        <menu id="listDiv">
            <div id="book-detail-title">
                <h3>진행 내역</h3>
            </div>
            
            <c:if test="${empty list}">
            진행 중인 예약 내역이 없습니다
            </c:if>
            <c:if test="${not empty list}">
            <div id="gridDiv">
                           
                
            </div>

            </c:if>    
        </menu>
    
    <script src="/resources/js/book/list.js"/>
    <script>
    	$(".detailBtn").click(function() {
			
    		$(location).attr("href", "productDetail");
		});
    	
    	let id = '${member.id}'

        $.ajax({
            type:'GET',
             url:'/book/list?id='+id
        ,success:function(result){
        	$('#gridDiv').append(result);
        	console.log(result);
        }
        })
    </script>
</body>
</html>