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
                <h3>지난 내역</h3>
            </div>

            <c:if test="${empty payList}">
            현재 ${member.name}님께서 결제하신 완료 내역이 없습니다
            </c:if>
            <c:if test="${not empty payList}">
            <div id="gridDiv">
                
                
            </div>
            </c:if>    
        </menu>
    </div>
    <script>
    let id = '${member.id}'

        $.ajax({
            type:'GET',
             url:'/pay/list?id='+id
        ,success:function(result){
        	$('#gridDiv').html(result);
        }
        })
    
    </script>
</body>
</html>