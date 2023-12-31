<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#bigDiv{
	    display: grid;
	    grid-template-columns: 370px 1fr;
	}
	#menuDiv{
	    padding-left: 200px;
	    border-right: 1px solid gainsboro;
	}
	#menuDiv a{
	    text-decoration: none;
	}
	#menuDiv h3{
		margin: 18px 0;
		font-size: 25px;
	}
	.menuP{
		margin-bottom: 30px;
	}
	
	#listDiv{
		padding-left: 55px;
		padding-bottom: 300px;
	}
	#listDiv h3{
	    border-bottom: 1px solid gainsboro;
	    margin: 50px 0 40px 0;
	    padding-bottom: 10px;
	}
	
	#gridDiv{
	    display: grid;
	    grid-template-columns: 280px 2fr;
	    width: 800px;
	    margin-top: 35px;
	    border-bottom: 3px solid gainsboro;
	    padding-bottom: 35px;
	}
	#imgDiv img{
	    width: 250px;
	    height: 166px;
	    overflow: hidden;
	    border-radius: 5px;
	}
	
	#contentsDiv{
		position: relative;
	    max-width: 520px;
	    max-height: 166px;
	    padding: 20px;
	    border-radius: 5px;
	    background-color: rgba(245, 245, 220, 0.74);
	    font-size: 14px;
	}
	th{
	    text-align: left;
	    padding-right: 30px;
	}
	.detailBtn{
	    position: absolute;
	    bottom: 18px;
	    right: 35px;
	    border: solid white;
	    cursor: pointer;
	    border-radius: 5px;
	    height: 30px;
	    background-color: aliceblue;
	}
	#menuDiv a:hover{
	    color:#0D6EFD;
	}
	

</style>
<nav id="menuDiv">
    <div>
        <h3>예약 정보</h3>
        <p><a href="/mypage/onGoing">진행 내역</a></p>
        <p><a href="/mypage/complete">지난 내역</a></p>
        <p class="menuP"><a href="/mypage/cancle">취소/환불 내역</a></p>
        
        <h3>My 정보</h3>
        <p class="menuP"><a href="/mypage/info">내 정보 관리</a></p>
        
        <h3>My 활동</h3>
        <p><a href="/mypage/reviewList">후기 내역</a></p>
        <p><a href="/mypage/questionList">문의 내역</a></p>
    </div>
</nav>
