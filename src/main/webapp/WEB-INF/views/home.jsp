<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<c:import url="./temp/bootStrap.jsp"></c:import>
	<style type="text/css">
	   .title{
	   margin-left: 200px;
	}
	
	</style>
</head>
<body>
<c:import url="temp/header.jsp"></c:import>


<section class="ms-5">
<h1 class="title">
	아이라이크키친!  
</h1>

<P class="title">  The time on the server is ${serverTime}. </P>

<button id="close" class="btn btn-outline-primary title">X</button>
  
<div></div>
<br>
<input type="text" id="phone">
<button id="identify" class="btn btn-info">휴대폰 본인인증하기</button>

<div></div>


<br>
<div id="businessCheck" style="border: solid gainsboro 1px;">
대표자명 <input type="text" id="businessName" value="이승엽"><br>
사업자 등록번호 입력<input type="text" id="businessNum" data-serviceKey="${serviceKey}" value="4578500300"><br>
개업연월일 <input type="text" id="businessDate" value="20160202">  
</div>
<div id="resultText"></div>
<button id="businessInfo">제출하기</button>

<br>
<div id="naver_id_login">
	
</div>

  <script type="text/javascript">
    $('#close').click(function(){
    	window.open( "/book/add", "예약", "width=600, height=1000, top=50, left=1000" );
    })
    </script>
	<script src="/resources/js/naverLogin.js"></script>
	<script src="/resources/js/identify.js"></script>
</section>

</body>
</html>

