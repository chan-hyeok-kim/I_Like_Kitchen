<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기조회</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<input type="hidden" name="reviewNum" value="${view.reviewNum}">
<label>작성자</label>
${view.id}<br />

		<div>
			<c:forEach items="${dto.dtos}" var="f">
				<img src="../resources/upload/${board}/${f.fileName}">
			</c:forEach>
		</div>
<label>작성날짜</label>
${view.reviewDate}<br />

<label>후기내용</label>
${view.reviewContents}<br />

<label>평점</label>
${view.reviewRate}<br />
<div>
<a href="/review/update?reviewNum=${view.reviewNum}">게시물 수정</a><a href="/review/delete?reviewNum=${view.reviewNum}">게시물 삭제</a>
</div>
</body>
</html>