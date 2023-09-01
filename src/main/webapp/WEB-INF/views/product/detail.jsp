<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
  
  <button id="close">X</button>
  
  <script type="text/javascript">
    $('#close').click(function(){
    	window.open( "/book/add", "예약", windowFeatures );
    })
   
  </script>
</body>
</html>