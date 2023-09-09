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
<div>
<form method="post" action="/reply/modify">

    <p>
        <label>댓글 작성자</label> <input type="text" name="id" readonly="readonly" value="${reply.writer}">
    </p>
    <p>
        <textarea rows="5" cols="50" name="replyContent">${reply.replyContent}</textarea>
    </p>
    <p>
        <input type="hidden" name="replyNum" value="${reply.replyNum}">
        <input type="hidden" name="reviewNum" value="${reply.reivewNum}">

        <button type="submit">댓글 수정</button>
    </p>
</form>

    </div>
 

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>