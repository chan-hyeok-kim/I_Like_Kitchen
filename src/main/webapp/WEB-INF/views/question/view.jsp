<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기조회</title>
<c:import url="../temp/bootStrap.jsp"></c:import>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>


<label>작성자</label>
${view.id}<br />

<label>문의작성날짜</label>
${view.questionDate}<br />

<label>문의내용</label>
${view.questionContents}<br />

<div>
<a href="/question/update?questionNum=${view.questionNum}">게시물 수정</a><a href="/question/delete?questionNum=${view.questionNum}">게시물 삭제</a>
</div>
</body>
</html>