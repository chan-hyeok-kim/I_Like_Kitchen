<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <!DOCTYPE html>
          <html>

          <head>
               <meta charset="UTF-8">
               <title>Insert title here</title>

               <c:import url="../temp/bootStrap.jsp"></c:import>

               <style type="text/css">
                    table {
                         width: 400px;
                         background: ;
                         text-align: center;
                    }

                    #btn {
                         margin-top: 10px;
                         margin-left: 140px;
                         width: 100px;
                         height: 40px;
                         /* background: #F4F3EA;
      border: 1px solid black;
       */
                    }

                    .list-border {
                         width: 1000px;
                         margin-top: 20px;
                         margin-bottom: 20px;
                         border-bottom: 1px solid #ece6cc;
                         height: 10px;
                    }

                    .book-table-div div {
                         display: flex;

                    }


                    .book-table-div {
                         margin-left: 30px;

                    }

                    .book-table-div div p {
                         width: 103px;
                    }

                    #book-list-unorder {
                         list-style: none;
                    }

                    #book-img {}

                    .book-table-list {
                         display: flex;
                         width: 800px;
                         margin-right: 0px;
                    }

                    #btn-home {
                         width: 90px;
                         height: 40px;
                         margin-top: 100px;

                    }

                    #detail-link a {
                         text-decoration: none;
                    }

                    a:hover {
                         color: black;

                    }

                    a:active {
                         color: black;
                    }

                    a:visited {
                         color: (52, 111, 238, 0.699);
                    }

                    .checklist {
                         width: 600px;
                    }

                    .btn-pay {
                         background-color: #dfa974;
                         color: white;
                         border-color: white;
                         border: none;
                         outline: none;
                         border-radius: 10px;
                    }
               </style>
          </head>

          <body>

               <section class="checklist">
                    <c:if test="${empty bookList}">
                         해당 날짜에 예약 내역이 없습니다 </c:if>
                    <c:if test="${not empty bookList}"></c:if>

                    <c:forEach items="${bookList}" var="i" varStatus="fi">


                         <div style="width: 700px">
                              <div class="book-table-list" data-list="${fi.count}">
                                   <div id="book-img">
                                        <img style="width: 250px; height: 200px;"
                                             src="/resources/upload/product/${productList[fi.index].productFileDTOs[0].fileName}">
                                        <div id="detail-link" style="display: flex; padding-top: 10px;">
                                             <p><a href="../product/detail?productNum=${productList[fi.index].productNum}">
                                                       ${productList[fi.index].productName} > </a></p>
                                        </div>

                                   </div>

                                   <div class="book-table-div">
                                        <div>
                                             <p>예약자</p>
                                             <p>${member.name}</p>
                                        </div>
                                        <div>
                                             <p>예약번호</p>
                                             <p id="book-num" class="book-num">${i.bookNum}</p>
                                        </div>
                                        <div>
                                             <p>예약 날짜</p>
                                             <p>${i.bookDate}</p>
                                        </div>
                                        <div>
                                             <p>사용시간</p>
                                             <p class="bookTime" data-startTime="${i.startTime}"
                                                  data-endTime="${i.endTime}"></p>
                                        </div>
                                        <div>
                                             <p>인원</p>
                                             <p>${i.headCount}</p>
                                        </div>
                                        <div>
                                             <p>승인 상태</p>
                                             <p class="check" data-check="${i.bookCheck}">${i.bookCheck}</p>
                                        </div>


                                   </div>
                                   <div class="book-table-div">
                                        <div>
                                             <p>목적</p>
                                             <p>${i.purpose}</p>
                                        </div>
                                        <div>
                                             <p>
                                                  <button type="button" id="btn-contents" data-contents="${i.contents}"
                                                       class="btn btn-outline-dark" data-bs-toggle="modal"
                                                       data-bs-target="#exampleModal${fi.index}">
                                                       전달사항
                                                  </button>
                                             </p>
                                             <p style="width: 200px"></p>
                                        </div>
                                        <c:if test="${i.bookCheck eq '미승인'}">
                                        <button id="btn-home" class="btn-pay" data-bookNum="${i.bookNum}">승인</button>
                                        </c:if>



                                   </div>

                              </div>

                         </div>



                         <div class="list-border"></div>

                         <div class="modal fade" id="exampleModal${fi.index}" tabindex="-1"
                              aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                                   <div class="modal-content">
                                        <div class="modal-header">
                                             <h1 class="modal-title fs-5" id="exampleModalLabel">전달사항</h1>
                                             <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                  aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                             ${i.contents}
                                        </div>
                                        <div class="modal-footer">
                                             <button type="button" class="btn btn-secondary"
                                                  data-bs-dismiss="modal">닫기</button>
                                             <button type="button" class="btn btn-primary">확인</button>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </c:forEach>
                    <!-- Modal -->


                    <nav aria-label="Page navigation example">
                         <ul class="pagination">
                              <c:if test="${pager.startNum eq 1}">
                                   <li class="page-item"><a class="page-link move" href="#"
                                             data-num="${pager.startNum}">Previous</a></li>
                              </c:if>
                              <c:if test="${pager.startNum ne 1}">
                                   <li class="page-item"><a class="page-link move" href="#"
                                             data-num="${pager.startNum-1}">Previous</a></li>
                              </c:if>

                              <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                   <li class="page-item"><a class="page-link move" href="#" data-num="${i}">${i}</a>
                                   </li>
                              </c:forEach>


                              <li class="page-item ${pager.next?'':'disabled'}"><a class="page-link move" href="#"
                                        data-num="${pager.lastNum+1}">Next</a></li>

                         </ul>
                    </nav>

               </section>
               <script type="text/javascript">

                    count = $('.book-table-list').length


                    console.log(count)

                    for (let i = 0; i < count; i++) {


                         $('.btn-pay').eq(i).click(function () {
                              bookNum = $('.book-num').eq(i).text()
                              console.log(bookNum)
                              swal({
                                   text: '승인하시겠습니까?',
                                   buttons: ['취소', '승인']
                              }).then(function(result){
                                   if (result) {

                                        $.ajax({
                                             type: 'POST',
                                             url: 'bookCheck',
                                             data: {
                                                  bookNum: bookNum
                                             },success:function(result) {
                                                  if(result>0){
                                                     swal('승인되었습니다')
                                                     location.replace('manage')
                                                  }
                                             },error:function(){
                                                  swal('승인이 거부되었습니다')
                                             }
                                        })
                                   }
                              })


                    })

                    }

                    for (let i = 0; i < count; i++) {
                         start = $('.bookTime').eq(i).attr('data-startTime');
                         end = $('.bookTime').eq(i).attr('data-endTime')
                         console.log(typeof start);
                         console.log(start);
                         console.log(end);

                         start = start.substring(11, 16);
                         end = end.substring(11, 16);
                         console.log(start);

                         $('.bookTime').eq(i).append(start)
                         $('.bookTime').eq(i).append('~' + end)
                    }
               </script>

          </body>

          </html>