<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">
	<c:import url="temp/bootStrap.jsp"></c:import>

  <style>
    .div1 {
      margin: 100px;
      display: block;
      padding: 50px 10px;
      background: none rgb(249, 247, 235);
      border: 0px solid transparent;
      border-radius: 0px;
    }
    #carouselExampleInterval img {
      margin: auto;
      max-width: 700px;
      max-height: 700px;
    }
  </style>
	
</head>


<body>
	<c:import url="temp/header.jsp"></c:import>
	
<div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/images/img1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>서울시 구디구 구디동 12-34</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/images/img2.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>서울시 여기구 여기동 1-2</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/images/img3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>서울시 저기구 저기동 1002-305호</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- 추가 -->
  <div class="div1" style="text-align: center;">
    <div class="div2" style="text-align: center;">
      <h2>쾌적한 주방환경만을 제공합니다.</h2>
    </div>
    <div class="div3" style="text-align: center;">
      <p>공유주방에 오신것을 환영합니다.</p>
    </div>
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
          <img src="/resources/images/inside1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="2000">
          <img src="/resources/images/inside2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/resources/images/inside3.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/resources/images/inside4.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="/resources/images/inside5.jpg" class="d-block w-100" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>


</body>
<footer>
<c:import url="./temp/footer.jsp"></c:import>
</footer>
</html>
