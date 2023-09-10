<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <c:import url="../temp/bootStrap.jsp"></c:import>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파트너페이지</title>
    <link href="/resources/css/partner/partnerPage.css" rel="stylesheet">
</head>
<body>
    <c:import url="../temp/header.jsp"></c:import>

    <main class="wrapper">
        <header class="content text-center">
            <p>파트너 페이지</p>
        </header>

        <div class="part1">
            <button type="button" class="btns" style="background-color: white;">
                <div class="part1_1">
                    <img src="/resources/icon/homes.png" class="img1">
                    <div class="part1_2">내용</div>
                </div>
            </button>
            <div class="part2">
                <div class="part2_1">
                    <button type="button" class="btn1" id="btn1">
                        <img src="/resources/icon/writing1.png">
                        <div>
                            <p class="part2_2">파트너 관리</p>
                            <p class="part2_2">사업자 정보/수정</p>
                        </div>
                    </button>
                    <button type="button" class="btn1" id="btn2">
                        <img src="/resources/icon/schedule.png">
                        <div>
                            <p class="part2_2">예약 관리</a></p>
                            <p class="part2_2">예약 요청 건 처리</p>
                        </div>
                    </button>
                </div>
                <div class="part2_1">
                    <button type="button" class="btn1" id="btn3">
                        <img src="/resources/icon/reservation.png">
                        <div>
                            <p class="part2_2">공간 정보 수정</p>
                            <p class="part2_2"></p>
                        </div>
                    </button>
                    <button type="button" class="btn1" id="btn4">
                        <img src="/resources/icon/question.png">
                        <div>
                            <p class="part2_2">문의/후기 관리</p>
                            <p class="part2_2"></p>
                        </div>
                    </button>
                    <button type="button" class="btn1" id="btn5">
                        <img src="/resources/icon/free-icon-calculating-3.png">
                        <div>
                            <p class="part2_2">환불 승인</p>
                            <p class="part2_2"></p>
                        </div>
                    </button>
                </div>
            </div>
                   
             
            <div class="part3">
                <div class="swiper swiper-pointer-events swiper-backface-hidden">
                    <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                        <div class="swiper-slide swiper-slide-active" style="width: 464px; margin-right: 18px;">
                            <button type="button" class="btnss">
                                <div class="part3_1">
                                    <p class="part3_2 text-center">사업자 정보를 등록해주세요!</p>
                                    <p class="part3_2 text-center">등록 후 파트너 가입승인이 완료됩니다.</p>
                                </div>
                            </button>
                        </div>
                        <div class="swiper-slide swiper-slide-active" style="width: 464px; margin-right: 18px;">
                            <button type="button" class="btnss">
                                <div>
                                    <p>사업자 정보를 등록해주세요!</p>
                                    <p>등록 후 파트너 가입승인이 완료됩니다.</p>
                                </div>
                            </button>
                        </div>
                        <div class="swiper-slide swiper-slide-active" style="width: 464px; margin-right: 18px;">
                            <button type="button" class="btnss">
                                <div>
                                    <p>사업자 정보를 등록해주세요!</p>
                                    <p>등록 후 파트너 가입승인이 완료됩니다.</p>
                                </div>
                            </button>
                        </div>
                        <div class="swiper-slide swiper-slide-active" style="width: 464px; margin-right: 18px;">
                            <button type="button" class="btnss">
                                <div>
                                    <p>사업자 정보를 등록해주세요!</p>
                                    <p>등록 후 파트너 가입승인이 완료됩니다.</p>
                                </div>
                            </button>
                        </div>
                    </div>
                    <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
                        <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
                        <span class="swiper-pagination-bullet "></span>
                        <span class="swiper-pagination-bullet "></span>
                        <span class="swiper-pagination-bullet "></span>
                    </div>
                </div>
            </div>

            <footer class="part4">
                <div class="part4_1">
                    <p class="part4_2">I like Kitchen</p>
                </div>
            </footer>
        </div>
    </main>

    <script>
        const btn1 = document.getElementById("btn1");
        const btn2 = document.getElementById("btn2");
        const btn3 = document.getElementById("btn3");
        const btn4 = document.getElementById("btn4");

        btn1.addEventListener("click", function(){
            location.href="/partner/update"
        })

        btn2.addEventListener("click", function(){
            location.href="/book/manage"
        })

        btn3.addEventListener("click", function(){
            location.href="/product/update"
        })

        btn4.addEventListener("click", function(){
            location.href="./manage"
        })
        
        $('#btn5').click(function(){
        	location.href="/pay/checklist"	
        })
    </script>
    
</body>
<footer>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>