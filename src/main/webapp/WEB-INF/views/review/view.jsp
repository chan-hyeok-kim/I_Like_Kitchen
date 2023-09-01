<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<input type="hidden" name="reviewNum" value="${view.reviewNum}">
<label class="border">작성자</label>
${view.id}<br />


<label class="border">작성날짜</label>
${view.reviewDate}<br />

<label class="border">후기내용</label>
${view.reviewContents}<br />

<label class="border">평점</label>
${view.reviewRate}<br />
		<%-- <div>
			<c:forEach items="${view.ktos}" var="f">
				<a href="./fileDown?fileNum=${f.fileNum}">${f.originalName}</a>
			</c:forEach>
		</div>  --%>
<c:forEach items="${dto.fileDTOs}" var="f">
		<img alt="" src="/resources/upload/review/${f.fileName}">
	</c:forEach>
<div>
<a href="/review/update?reviewNum=${view.reviewNum}" class="btn btn-warning">게시물 수정</a><a href="/review/delete?reviewNum=${view.reviewNum}" class="btn btn-warning">게시물 삭제</a>
</div>
<c:import url="../temp/Footer.jsp"></c:import>
</body>
</html>