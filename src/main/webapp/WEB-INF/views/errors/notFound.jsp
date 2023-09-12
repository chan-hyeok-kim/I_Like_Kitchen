<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>Error</title>
<style>
    .img {
     text-align: center;
     padding-top: 30px;
    }
    
    #error-section{
        padding-bottom: 120px;
        padding-top: 60px;
    }
</style>
</head>
<body>
    <c:import url="../temp/header.jsp"></c:import>
    <section id="error-section">
    <div class="img">
        <img src="/resources/img/error/not-found-1.jpg" style="width: 400px; height: 300px;">
    </div>

    <div class="div1">
	    <h2 class="text-center">요청하신 페이지는 존재하지 않습니다.</h2>
        <p class="text-center">존재하지 않는 주소를 입력하셨거나, <br>
            요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.<br>
            입력하신 주소가 정확한지 다시 한 번 확인해 주시기 바랍니다.
        </p>
    </div>
    </section>
</body>
<footer>
    <c:import url="../temp/footer.jsp"></c:import>
    </footer>
</html>