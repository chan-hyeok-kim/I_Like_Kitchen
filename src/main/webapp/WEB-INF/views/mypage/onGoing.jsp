<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<style>
#book-detail-title{
	margin-bottom: 40px;
}

#list-border{
    margin-top:20px;
    margin-bottom: 20px;
    border-bottom: 1px solid #ece6cc;
    height: 10px;
    width: 1000px;
}
 table{
      width: 400px;
      background: #F8F9FA;
      text-align: center;
 }
 #btn{
      margin-top: 10px;
      margin-left: 140px;
      width: 100px;
      height: 40px;
      /* background: #F4F3EA;
      border: 1px solid black;
       */
 }

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
    
        <menu id="listDiv">
            <div id="book-detail-title">
                <h3>진행 내역</h3>
            </div>
            
            <c:if test="${empty list}">
            진행 중인 예약 내역이 없습니다
            </c:if>
            <c:if test="${not empty list}">
            <div id="gridDiv">
             <c:if test="${empty list}">
진행 중인 예약 내역이 없습니다 
</c:if>

<c:if test="${not empty list}">
<c:forEach items="${list}" var="i">
<div id="book-table-div">
<table class="book-table">
<thead>
   <tr>
      <th rowspan="2">상품사진</th>
      <th></th>
      
   </tr>
  </thead>
   <tbody>
  <%--  <tr>
   <td>상품명</td>
   <td>${product.productName}</td>
   </tr> --%>
    
      <tr>
       <td>예약자</td>
       <td>${member.name}</td>
      </tr>
       <tr>
       <td>예약번호</td>
       <td>${i.bookNum}</td>
      </tr>
      <tr>
       <td>예약 날짜</td>
       <td>${i.bookDate}</td>
      </tr>
      <tr>
       <td>사용시간</td>
       <td id="bookTime" data-startTime="${i.startTime}" data-endTime="${i.endTime}"></td>
      </tr>
        <tr>
         <td>인원</td> 
         <td>${i.headCount}</td> 
      </tr>
      <tr>
       <td>승인 상태</td>
       <td>${i.bookCheck}</td>
      </tr>
   </tbody>

</table>
           
<button id="btn" class="btn btn-outline-primary" data-bookNum="${i.bookNum}">결제하기</button>

<div id="list-border"></div>
</div>        
            
</c:forEach>
</c:if>
                           
                
            </div>

            </c:if>    
        </menu>
    
    
    <script>
    	$(".detailBtn").click(function() {
			
    		$(location).attr("href", "productDetail");
		});
    	
    /* 	let id = '${member.id}'

        $.ajax({
            type:'GET',
             url:'/book/list?id='+id
        ,success:function(result){
        	$('#gridDiv').append(result);
        	console.log(result);
        }
       })*/ 
        
        
        let bookNum = $('#btn').attr("data-bookNum");
console.log(bookNum);

$('#btn').click(function(){
	
	    location.href="../pay/add?bookNum="+bookNum;
	})
   


start = $('#bookTime').attr('data-startTime');
end = $('#bookTime').attr('data-endTime')
console.log(typeof start);
console.log(start);
console.log(end);

start=start.substring(11,16);
end=end.substring(11,16);
console.log(start);

$('#bookTime').append(start)
$('#bookTime').append('~'+end)

    </script>
</body>
</html>