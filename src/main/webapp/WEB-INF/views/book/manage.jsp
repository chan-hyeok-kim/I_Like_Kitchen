<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">

      <title>Insert title here</title>


      <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
      <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
      <c:import url="../temp/bootStrap.jsp"></c:import>

      <style>
        #calendar {
          width: 800px;
          margin-right: 0px;
          color: #F9A6A8;
          background-color: white;
        }

        #calendar button {
          background-color: #F9A6A8;
          border-color: #F9A6A8;
        }

        #move {
          margin-left: 100px;
          margin-top: 20px;
        }

        #calendar-manage {
          border-top: 1px solid #ece6cc;
          width: 100%;
          margin-right: 0px;
          padding-top: 30px;
        }

        #move:nth-child(2) {
          width: 300px;
        }

        #space {
          margin-left: 5%;
        }

        #book-table-list {
          width: 800px;
        }
      </style>


    </head>

    <body>
      <c:import url="../temp/header.jsp"></c:import>

      <section id="calendar-manage">


        <div style="display: flex">
          <div id="move">
            <div id='calendar'></div>
          </div>
          <div id="space"></div>
          <div id="book-table-list">
            <c:if test="${empty list}">
              진행 중인 예약 내역이 없습니다
            </c:if>

            <c:if test="${not empty list}">
              <div style="display: flex" id="book-date-info"> </div>
            </c:if>
          </div>
        </div>
        </div>

      </section>
    </body>

    <script type="text/javascript">




      document.addEventListener('DOMContentLoaded', function () {
        let calendarEl = document.getElementById('calendar');

        $.ajax({
          url: 'getAjaxEvent',
          type: 'post',
          dataType: 'json',
          success: function (res) {
            let arr = [];
            console.log(res)
            arr = res;
            console.log(arr)
            console.log(typeof arr)


            // let eventArr = getCalendarDataInDB();
            // console.log(eventArr)
            let calendar = new FullCalendar.Calendar(calendarEl, {
              //  plugins: [ 'listPlugin' ],
              buttonText: {
                today: '오늘 날짜',
                month: '월간',
                week: '주간',
                day: '일간',
              },
              headerToolbar: {
                start: 'today prevYear,prev,next,nextYear',
                center: 'title',
                end: 'dayGridMonth,timeGridWeek,timeGridDay'
              },
              initialView: 'dayGridMonth',
              selectable: true,
              locale: 'ko',
              //          navLinks: true,
              editable: true,
               dayMaxEventRows: true, // for all non-TimeGrid views
               views: {
                 dayGridMonth: {
                   dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
                 }
               },
              events: arr,
              eventColor: 'rgb(255,0,0)',
              eventBackgroundColor: '#FBF4AD',
              eventTimeFormat: { // like '14:30:00'
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
              },
              eventClick: function (info) {
                console.log('Event: ' + info.event.title);
                // info.el.style.backgroundColor = 'yellowgreen'
                info.el.style.backgroundColor = '#FBF4AD';
              },
              dateClick: function (info) {
                $.ajax({
                  type: 'POST',
                  url: 'checklist',
                  data: {
                    clickDay: info.dateStr
                  },
                  success: function (result) {
                    $('#book-date-info').html(result)
                  }
                })

              },
              customButtons: {
                myCustomButton: {
                  text: 'custom!',
                  click: function () {
                    alert('clicked the custom button!');
                  }
                }
              }

            })

            calendar.render();
          },
          error: function () {
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
          }
        });


      });






    </script>

    </html>