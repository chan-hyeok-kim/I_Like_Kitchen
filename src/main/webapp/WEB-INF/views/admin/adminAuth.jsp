<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <form action="adminAdd" method="post">
   <div>
     관리자 권한을 부여할 사용자의 ID를 입력하세요<input type="text" class="form-control" name="id">
   </div>
   <button>권한 부여</button>
   </form>
   
   <form action="adminRemove" method="post">
   <div>
     관리자 권한을 삭제할 사용자의 ID를 입력하세요<input type="text" class="form-control" name="id"> 
   </div>
   <button>권한 수거</button>
    </form>
</body>
</html>