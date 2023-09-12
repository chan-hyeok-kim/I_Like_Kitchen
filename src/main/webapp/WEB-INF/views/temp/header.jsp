<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
      .header-section{
       border-bottom: 1px solid gainsboro;
      }  
</style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="top-nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="tn-left">
                            <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                            <li><i class="fa fa-envelope"></i> info.ILikeKitchen@gmail.com</li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <div class="tn-right">
                            <div class="top-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                            <a href="#" class="bk-btn">Booking Now</a>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="menu-item">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="logo">
                            <a href="/">
                                <img src="/resources/img/2.png" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul>
                                    <li class="active"><a href="/">Home</a></li>
                                    <li><a href="/product/list">전체 공간 목록</a></li>

                                            <c:if test="${size eq 1}">
                                                <li><a href="/partner/partnerRegister">사업자등록</a></li>
                                            </c:if>
                                        
                                        <c:forEach items="${sessionScope.member.roles}" var="r">
                                            <c:if test="${r.getRoleName() eq 'MEMBER'}">
                                                <li><a href="/mypage/onGoing">마이페이지</a></li>
                                                
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${sessionScope.member.roles}" var="r">
                                            <c:if test="${r.getRoleName() eq 'PARTNER'}">
                                                <li><a href="/product/add">공간등록</a></li>
                                                <li><a href="/partner/partnerPage">파트너페이지</a></li>
                                            </c:if> 
                                        </c:forEach>
                                        <c:forEach items="${sessionScope.member.roles}" var="r">
                                            <c:if test="${r.getRoleName() eq 'ADMIN'}">
                                                <li><a href="/admin/home">관리자 페이지</a></li>
                                            </c:if> 
                                        </c:forEach>

                                    
                                    </li>
                                    <li>
                                        <c:if test="${empty member}">
                                            <li><a href="/member/memberLogin">로그인/회원가입</a></li>
                                        </c:if>
                                        <c:if test="${not empty member}">
                                            <c:forEach items="${sessionScope.member.roles}" var="r">
                                                    <c:if test="${r.getRoleName() eq 'PARTNER'}">
                                                        <li id="login_log" style="border-bottom: 1px solid white;">${member.id} 파트너님, 환영합니다.</li>&nbsp;&nbsp;&nbsp;
                                                    </c:if>
                                            </c:forEach>
                                            <!-- <c:forEach items="${sessionScope.member.roles}" var="r">
                                                    <c:if test="${r.getRoleName() eq 'MEMBER'}">
                                                        <li id="login_log" style="border-bottom: 1px solid white;">${member.id} 회원님, 환영합니다.</li>&nbsp;&nbsp;&nbsp;
                                                    </c:if>
                                            </c:forEach> -->

                                            <c:if test="${size eq 1}">
                                                <li id="login_log" style="border-bottom: 1px solid white;">${member.id} 회원님, 환영합니다.</li>&nbsp;&nbsp;&nbsp;
                                            </c:if>

                                            <c:forEach items="${sessionScope.member.roles}" var="r">
                                                    <c:if test="${r.getRoleName() eq 'ADMIN'}">
                                                        <li id="login_log" style="border-bottom: 1px solid white;">관리자님, 환영합니다.</li>&nbsp;&nbsp;&nbsp;
                                                    </c:if> 
                                            </c:forEach>
                                            <li class="nav-item text-white me-3"><a href="/member/memberLogout">로그아웃</a></li>
                                        </c:if>
                                    </li>
                                </ul>


                                


                            </nav>
                            <!-- <div class="nav-right search-switch">
                                <i class="icon_search"></i>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </header>
    <!-- Header End -->

   

    <!-- Search model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

      
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/jquery.nice-select.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>
   
</body>

</html>


