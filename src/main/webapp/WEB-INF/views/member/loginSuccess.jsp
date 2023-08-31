<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="bg-light">
        <div class="container py-4">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center" href="index.do">
                    <span class="text-dark h4">아이라이크</span> <span class="text-primary h4">키친</span>                 
                </a>
            </div>
            <div>
            	<h1 class ="text-dark text-center">환영합니다!</h1>
            	<p class="text-center"> 
            		<span>${name}</span>님의 로그인 성공<br> 이메일 주소는 <strong>${email}</strong>입니다.
            	</p>
            </div>
            <div class="d-grid gap-2">
           		<a href="https://kauth.kakao.com/oauth/logout?client_id=${YOUR_REST_API_KEY}&logout_redirect_uri=${YOUR_LOGOUT_REDIRECT_URI}"></a>
            </div>
        </div>
    </section>
</body>
</html>