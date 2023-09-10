<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 권한 페이지</title>
<style type="text/css">
.form-control{
     width: 400px;
}
#auth-section{
    padding-left: 30px;
}
#auth-section div:first-child:not{
    display: flex;
}
#auth-section div{
    margin-bottom: 20px;
}
</style>
</head>
<body>
   <section id="auth-section">
   <form action="adminAdd" method="post">
   <div>
     <div>관리자 권한을 부여할 사용자의 ID를 입력하세요</div>
     <input type="text" class="form-control" name="id">
   <button class="btn btn-primary">권한 부여</button>
   
   </div>
   
   </form>
   
   <form action="adminRemove" method="post">
   <div>
     <div>관리자 권한을 삭제할 사용자의 ID를 입력하세요</div>
     <input type="text" class="form-control" name="id"> 
     <button class="btn btn-primary">권한 수거</button>
   </div>
   
    </form>
    </section>
</body>
</html>