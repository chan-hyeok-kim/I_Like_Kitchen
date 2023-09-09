<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
<style type="text/css">

#book-detail-title{
	margin-bottom: 40px;
}

</style>
</head>

<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
    
        <menu id="listDiv">
            <div>
                <h3>취소 내역</h3>
            </div>

            <c:if test="${empty refundList}">
            현재 ${member.name}님께서 취소하신 환불 내역이 없습니다
            </c:if>
            <c:if test="${not empty refundList}">
            <div id="gridDiv">
                
                
            </div>
            </c:if>    
        </menu>
    </div>
    <script>
    let id = '${member.id}'

        $.ajax({
            type:'GET',
             url:'/pay/refundList?id='+id
        ,success:function(result){
        	$('#gridDiv').html(result);
        }
        })
    
    </script>
</body>
</html>