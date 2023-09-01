<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">

	<title>Home</title>
	<c:import url="temp/bootStrap.jsp"></c:import>

</head>
<body>
<c:import url="temp/header.jsp"></c:import>
<h1>
	Hello world!  
</h1>
<div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button bg-warning p-2 text-dark bg-opacity-10" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
<div>문의사항</div>
	</button>
   	 </h2>
   	 	
	  <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" >
      <div class="accordion-body">
				<div class="mb-3">
				
				<hr />							
						<a class="btn" style="background-color:rgb(251,255,182)" href="question/add">문의등록</a>	
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
      <button class="accordion-button collapsed bg-warning p-2 text-dark bg-opacity-10" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
<div>후기작성</div>	
    </button>
    	</h2>
    		
		   <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
      <div class="accordion-body">
		<div class="mb-3">	
	
				
				<hr />
					<a class="btn" style="background-color:rgb(251,255,182)" href="review/add">후기등록</a>
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


		$("#add").click(function(){
			let contents=$("#question").val();
			$.ajax({
				type:'POST',
				url:'add',
				data:{
					productNum:pn,
					questionContents:contents
				},
				success:function(reslut){
					if(result.trim()>0){
						alert('문의등록');
						$("list").empty();
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

	function getList(pn, page){
		$.ajax({
			type:"get",
			url:"./list",
			data:{
				productNum:productNum,
				page:page
			},
			success:function(result){
				$("#list").append(result);
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
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
