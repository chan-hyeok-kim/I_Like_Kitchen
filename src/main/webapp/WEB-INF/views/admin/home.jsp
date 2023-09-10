<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #admin-list{
      list-style: none;
  }
  .content nav{
      width: 20%;
      background: #030008c7;
  }
  .content main{
      width: 80%;
      border-left:solid gainsboro 1px;
      overflow: auto;
  }
 
  .content nav,main{
      float: left;
      border-top: solid gainsboro 1px;
      border-bottom: solid gainsboro 1px;
      height: 700px;
      
  }
 /*  nav li{
    
  } */
  
  #admin-list button{
      all:unset;
      color: white;
  }
  
  section{
      padding-top: 30px;
      border-top: solid #030008c7 4px;
      padding-bottom: 120px;

  }
  
  body{
      height: 100%
  }
  footer {
    width: 100%;
    height: 120px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
    background: #030008c7;
}

  nav div:hover{
    background: rgb(52, 111, 238);
  }
  .div-enroll{
    font-size: 20px;
    font-weight: bold;
  }
  .div-enroll li:hover{
    cursor: pointer;
  }
  
  main img{
    margin-left:20%;
    margin-top:70px;
  }
  
  #admin-hometext{
    margin-left: 20px;
    padding-top: 20px
  }
  #admin-home li{
    padding-left: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
  }
</style>


<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>


<section class="content">

<nav id="admin-home">
<ol id="admin-list">
<div class="div-enroll">
<li><button class="enroll">파트너 미승인 목록</button></li>
</div>
<div class="div-enroll">
<li><button class="enroll">파트너 승인 목록</button></li>
</div>

<div class="div-enroll">
<li><button class="enroll-admin">관리자 권한</button></li>
</div>

<div class="div-enroll">
<li><button class="enroll">댓글 알림</button></li>
</div>
<div class="div-enroll">
<li><button class="enroll">설정</button></li>
</div>
<div class="div-enroll">
<li><button class="enroll">이동</button></li>
</div>
</nav>
<main>

<div id="admin-hometext">
<p id="admin-home"><h3>관리자 페이지에 오신 걸 환영합니다</h3><br>
이곳에서는 관리자와 파트너 관리를 하실 수 있습니다.
</p>
</div>

<img src="/resources/img/management.png"/>

</main>

</ol>


<a href="/admin/management" style="margin-left:50%; margin-top:20px;">홈으로</a>

</section>


<script src="/resources/js/admin/manage.js"></script>
</body>

</html>