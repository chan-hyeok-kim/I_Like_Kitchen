<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>로그인</title>
<link href="/resources/css/member/memberLogin.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">
					<h2 class="header-news text-center">Welcome I Like Kitchen</h2>
					<h3 class="my-4 text-center">로그인</h3>
				</div>

				<c:if test="${not empty errorMessage}">
            		<div class="alert alert-danger" role="alert">
               			${errorMessage}
            		</div>
       	 		</c:if>

                <div class="card mb-4">
                	<div class="card-header">
						<form action="./memberLogin" method="post" id="frm">
							<div class="mb-3">
								  <label for="id" class="form-label"></label>
								  <input type="text" name="id" class="form-control" id="id" value="id7" placeholder="ID를 입력해주세요.">
								  <div id="idResult"></div>
							</div>
							<div class="mb-3">
								  <label for="password" class="form-label"></label>
								  <input type="password" name="password" class="form-control" id="password" value="123123" placeholder="PW를 입력해주세요.">
								  <div id="passwordResult"></div>
							</div>
							<div class="mb-3 text-center">
								<button id="btn" class="btn btn-outline-secondary">로그인</button>
							</div>
							<div class="mb-3 text-center">
								<a href="/member/find/findID">아이디찾기</a> | <a href="/member/find/findPW">비밀번호찾기</a> | <a href="/member/memberAgree">회원가입</a>
							</div>
							<div class="text-center">
								<button type ="button" class = "btn" onclick="location.href='${kakaoUrl}'"><img src='/resources/icon/kakao.png '></button> 
								
								<a href="${naverUrl}"><img width="200" alt="Naver Login" src="/resources/img/naverLogin.png"></a> 
							</div>		
						</form>
					</div>
				</div>
			</div>

			
		</form>
		
  	

</body>
<footer>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>