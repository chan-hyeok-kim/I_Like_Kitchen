<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>회원정보</title>
<style>
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
    .single-btn {
        display: flex;
        justify-content: center;
    }
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="container-fluid page-content">
        <div class="row justify-content-center">
            <h1 class="col-md-7 my-5">회원정보</h1>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-3 info-label">이름</div>
                            <div class="col-md-9 info-text">${kto.name}</div>
                        </div>
                        <div class="info-divider"></div>
                        <div class="row mb-3">
                            <div class="col-md-3 info-label">전화번호</div>
                            <div class="col-md-9 info-text">${kto.phone}</div>
                        </div>  
                        <div class="info-divider"></div>
                        <div class="row mb-3">
                            <div class="col-md-3 info-label">이메일</div>
                            <div class="col-md-9 info-text">${kto.email}${kto.emailDomain}</div>
                        </div>
                        <div class="d-flex single-btn mb-3">
                        	<a href="./memberUpdate" class="btn btn-outline-secondary">회원정보 수정</a>
                        </div>
                    </div>
                </div>	
            </div>
        </div>

</body>
</html>