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
<h1>Detail</h1>

<label class="border">작성자</label>
${view.id}<br />

<label class="border">문의작성날짜</label>
${view.questionDate}<br />

<label class="border">문의내용</label>
${view.questionContents}<br />



<div>
<a href="/question/update?questionNum=${view.questionNum}" type="button" class="btn btn-warning p-2 g-col-6">게시물 수정</a><a href="/question/delete?questionNum=${view.questionNum}" type="button" class="btn btn-warning p-2 g-col-6">게시물 삭제</a>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>