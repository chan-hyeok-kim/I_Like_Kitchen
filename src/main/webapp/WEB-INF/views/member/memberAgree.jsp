<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>약관확인서</title>
<link href="/resources/css/member/memberAgree.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<!-- <div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">약관 확인서</div>
                <div class="form-check">
                    <input class="form-check-input checks" type="checkbox" value="" id="checkAll">
                    <label class="form-check-label" for="checkAll">
                        전체동의
                    </label>
                </div>

                <div class="card mb-4">
                	<div class="card-header">
                		 <input class="form-check-input check checks ml-1" type="checkbox" value="" id="check1">
				         <label class="form-check-label ml-2" for="check1">
				            만 14세이상 입니다(필수)
				         </label>
                	</div>
                </div>

                이용약관
                <div class="card mb-4">
                	<div class="card-header">
                		 <input class="form-check-input check checks ml-1" type="checkbox" value="" id="check2">
				         <label class="form-check-label ml-2" for="check2">
				            이용약관 동의(필수)
				         </label>
                	</div>
                	<div class="card-body">
				        <div class="terms-content">
					        내용
				        </div>
				    </div>
				</div>

				개인정보 수집이용 동의
				<div class="card mb-4">
				    <div class="card-header">
				        <input class="form-check-input check checks ml-1" type="checkbox" value="" id="check3">
				        <label class="form-check-label ml-2" for="check3">
				            개인정보 수집이용 동의(필수)
				        </label>
				    </div>
				    <div class="card-body">
				        <div class="terms-content">
					        내용
				        </div>
				    </div>
				</div>

				마케팅 알림수신 동의
				<div class="card mb-4">
                	<div class="card-header">
                		 <input class="form-check-input check ml-1" type="checkbox" value="" id="check4">
				         <label class="form-check-label ml-2" for="check4">
				            마케팅 알림수신 동의(선택)
				         </label>
                	</div>
                </div>

                <div class="agree-btn">
                    <button id="agreeBtn" class="btn btn-outline-secondary">회원가입</button>
                </div>
                </div>
          	</div>
		</div>
	</div> -->
	
	<form action="" id="joinForm">
		<ul class="join_box">
			<li class="checkBox check01">
				<ul class="clearfix">
					<li>전체동의</li>
					<li class="checkAllBtn">
						<input type="checkbox" name="chkAll" id="chk" class="chkAll">
					</li>
				</ul>
			</li>
			<li class="checkBox check02">
				<ul class="clearfix">
					<li>만 14세이상 입니다(필수)</li>
					<li class="checkBtn">
						<input type="checkbox" name="chk"> 
					</li>
				</ul>
				<textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li>이용약관(필수)</li>
					<li class="checkBtn">
						<input type="checkbox" name="chk">
					</li>
				</ul>

				<textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li>개인정보수집 이용 동의(선택)</li>
					<li class="checkBtn">
						<input type="checkbox" name="chk">
					</li>
				</ul>

				<textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
			</li>
			<li class="checkBox check04">
				<ul class="clearfix">
					<li>이메일알림 수신동의(선택</li>
					<li class="checkBtn">
						<input type="checkbox" name="chk">
					</li>
				</ul>
			</li>
		</ul>
		<ul class="footBtwrap clearfix">
			<li><button class="fpmgBt1">비동의</button></li>
			<li><button class="fpmgBt2">동의</button></li>
		</ul>
	</form>

	<script src="/resources/js/member/memberAgree.js"></script> 
</body>
</html>