<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./temp/bootStrap.jsp"></c:import>
</head>
<body>
<c:import url="temp/header.jsp"></c:import>


<c:forEach items="${list}" var="i">
${i.id}

</c:forEach>


</body>
</html>