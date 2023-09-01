<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>회원정보수정</title>
<style>
    .single-btn {
        display: flex;
        justify-content: center;
    }
    .info-label {
        font-weight: bold;
    }
    .info-text {
        padding-bottom: 1em;
    }
    .info-divider {
        border-bottom: 1px solid #e0e0e0;
        margin-bottom: 1em;
    }
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="container-fluid page-content">
        <div class="row justify-content-center">
            <h1 class="col-md-7 my-5">회원정보 수정</h1>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <form action="./memberUpdate" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label fw-bold">이름</label> 
                                <input type="text" name="name" class="form-control" id="name" value="${kto.name}">
                            </div>
                        
                            <div class="mb-3">
                                <label for="phone" class="form-label fw-bold">전화번호</label> 
                                <input type="tel" name="phone" class="form-control" id="phone" value="${kto.phone}" maxlength="11">
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label fw-bold">비밀번호</label> 
                                <input type="password" name="password" class="form-control" id="password" value="${kto.password}">
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label fw-bold">이메일</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="email" id="email" value="${kto.email}">
                                    <select class="form-control" name="emailDomain" id="emailDomain">
                                    	<option value="" selected="selected">선택</option>
                                        <option value="@naver.com" ${kto.emailDomain == '@naver.com' ? 'selected' : ''}>@naver.com</option>
                                        <option value="@daum.net" ${kto.emailDomain == '@daum.net' ? 'selected' : ''}>@daum.net</option>
                                        <option value="@gmail.com" ${kto.emailDomain == '@gmail.com' ? 'selected' : ''}>@gmail.com</option>
                                        <option value="@nate.com" ${kto.emailDomain == '@nate.com' ? 'selected' : ''}>@nate.com</option>
                                    </select>
                                </div>
                            </div>
                            
						    <div class="mb-3 single-btn">
						        <button class="btn btn-outline-secondary" type="submit">확인</button> 
						    </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>