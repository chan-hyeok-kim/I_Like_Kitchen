<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Home</title>
	<c:import url="temp/bootStrap.jsp"></c:import>
	
	
</head>
<body>
<c:import url="temp/header.jsp"></c:import>
<h1>
	Hello world!  
</h1>
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
<div>문의사항</div>
	</button>
   	 </h2>
   	 	
	  <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
				<div class="mb-3">
				<c:if test="questionContents!=null||questionContents.length!==0">
					<c:forEach items="${question}" var="question">
						<li>
							<div>
								<p>${question.id} / ${question.questionDate}</p>
								<p>${question.questionContents}</p>
								<p>
						<a href="question/update">수정</a> / <a href="question/delete">삭제</a>
					</p>
							</div>
						</li>	
					</c:forEach>
					</c:if>
					<c:if test="questionContents=null||questionContents.length==0">
						<p>등록된 질문이 없습니다</p>
					</c:if>
				<hr />							
						<a class="btn --bs-warning-bg-subtle" href="question/add">문의등록</a>	
				</div>
			</div>
	  
			<div>
				<table id="questionList">
					
				</table>
		
				<div id="more">
					<button>더보기</button>
				</div>

			</div>
		</div>
	</div>
	<br><br><br>

	<div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
<div>후기작성</div>	
    </button>
    	</h2>
    		
		   <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<div class="mb-3">	
		<c:if test="reviewContents!=null||reviewContents.length!==0">
		<c:forEach items="${review}" var="review">
			<li>
				<div>
					<p>${review.id} / ${review.reviewDate}</p>
					<p>${review.reviewContents}</p>
					
					<p>
						<a href="review/update">수정</a> / <a href="review/delete">삭제</a>
					</p>
				</div>	
				</li>
			</c:forEach>						
				</c:if>	
				<c:if test="reviewContents=null||reviewContents.length==0">등록된 후기가 없습니다</c:if>
				<hr />
					<a class="btn --bs-warning-bg-subtle" href="review/add">후기등록</a>
				</div>
			<div>
		</div>
  	</div>
		
			<table id="reviewList">
			
			</table>
	
			<div id="more">
				<button>더보기</button>
			</div>
		</div>
	</div>
</div>

<P>  The time on the server is ${serverTime}. </P>

<script type="text/javascript">
	let data-add-num="${kto.productNum}";
let pn=$("#add").attr("data-add-num");
	let pageNum=1;
	let tp=0;


		$("#questionAdd").click(function(){
			let contents=$("#question").val();
			$.ajax({
				type:'POST',
				url:'questionAdd',
				data:{
					productNum:pn,
					questionContents:contents
				},
				success:function(reslut){
					if(result.trim()>0){
						alert('문의등록');
						$("questionList").empty();
						$("#question").val("");
						pageNum=1;
						getQuestionList(pn, 1);
					}
				}
			});



		})

		$("#more").on("click","#moreButton",function(){
			
		if(pageNum>=tp){
			alert('마지막 페이지');
			return;
		}

			pageNum++;
			getQuestionList(pn, pageNum);

		})

	getComentList(productNum,pageNum);

	function getQuestionList(pn, page){
		$.ajax({
			type:"get",
			url:"./questionList",
			data:{
				productNum:productNum,
				page:page
			},
			success:function(result){
				$("#questionList").append(result);
				tp=$("#totalPage").attr("data-totalPage");
				let button='<button id="moreButton">더보기('+pageNum+'/'+tp+')</button>'
				console.log(result)
				$("#more").html(button);
			},
			error:function(){
				alert("관리자에게 문의")
			}
		})
	}
</script>
<c:import url="temp/Footer.jsp"></c:import>
</body>
</html>
