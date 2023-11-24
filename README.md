
## 📚 목차
<ul>
<li> <a href="#project-outline">프로젝트 개요</a></li>
<li> <a href="#my-role">내 담당 기능</a></li>
<li> <a href="#team-role">팀원 소개</a></li>
<li> <a href="#development-configuration">개발 환경 및 도구</a></li>
<li> <a href="#function-implementation">기능 구현</a></li>
</ul>

## 📋 <a id="project-outline">프로젝트 개요</a>

<p>
<img src="https://github.com/Hamelen/GDJ68_Kitchen/assets/132668682/0add8122-35b4-48f3-9cfd-1b4751242619" width="280" height="50" style="max-width: 100%;"/>
</p>
 
><p><strong>프로젝트</strong>: 공유 주방 대여 사이트</p>
><p><strong>기획 및 제작</strong>: 김찬혁, 송윤호, 김민준, 장재혁, 황윤제</p>
><p><strong>분류</strong>: 팀 프로젝트</p>
><p><strong>제작 기간</strong>: 2023.08.16 ~ 09.15</p>
><p><strong>배포일</strong>: 2023</p>
><p><strong>사용 기술</strong>: SPRING LEGACY</p>
><p><strong>문의</strong>: daiolous@gmail.com</p>

## 🏃 <a id="my-role">내 담당 기능</a>
><p><strong>팀장</strong>: 김찬혁(나)</p>
>예약 페이지(Fullcalendar API), 예약 승인 페이지, 결제 및 환불(API), 예약 상세, 결제 및 환불내역 상세, 문자 발송 API(예약 취소), 대여 공간 위치 표시(카카오맵 API), 관리자 페이지, 공공데이터 사업자 인증 API, 네이버 소셜 로그인 API, 메인 페이지


## :speech_balloon: <a id="team-role">팀원 소개</a>
><p><strong>팀원</strong>: 송윤호</p>
>회원가입(이메일 전송 API), 로그인, 카카오 소셜 로그인 API, 회원가입, 회원등급 , 파트너 등록 페이지, 파트너 정보 및 공간 관리 페이지, 메인 페이지, 약관동의

><p><strong>팀원</strong>: 김민준</p>
>마이페이지, 게시판(공지사항,자주찾는 QNA), 문의 후기 내역

><p><strong>팀원</strong>: 장재혁</p>
>공간 등록, 공간 정보 상세, 전체 공간 리스트, 메인 페이지

><p><strong>팀원</strong>: 황윤제</p>
>문의 및 후기 등록, 문의 리스트, 후기 리스트

## :computer: <a id="development-configuration">개발 환경</a>
<img src="https://img.shields.io/badge/Framework-%23121011?style=for-the-badge"> <img alt="Spring" src ="https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white"/> <img src="https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white"/> <img src="https://img.shields.io/badge/mybatis-004088?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMCIgd2lkdGg9IjEwOC4wMDAwMDBwdCIgaGVpZ2h0PSI4OC4wMDAwMDBwdCIgdmlld0JveD0iMCAwIDEwOC4wMDAwMDAgODguMDAwMDAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJ4TWlkWU1pZCBtZWV0Ij4KCjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDAuMDAwMDAwLDg4LjAwMDAwMCkgc2NhbGUoMC4xMDAwMDAsLTAuMTAwMDAwKSIgZmlsbD0id2hpdGUiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik0zNTQgNzk1IGMtOSAtMjMgMTUgLTQ1IDQ3IC00NSAxNSAwIDMxIC01IDM1IC0xMSA1IC05IC0xIC0xMCAtMjEgLTUgLTE3IDQgLTQ5IDAgLTgzIC0xMCBsLTU1IC0xOCAtMjMgMjkgYy0yOSAzNyAtNTIgMjQgLTMzIC0xOCAxNiAtMzQgMzIgLTM5IDczIC0yMiA0NCAxOSAxMTAgMTkgMTI1IDIgNiAtOCAxNCAtMjkgMTggLTQ3IGw2IC0zMyAtNDkgNiBjLTI3IDQgLTYxIDEwIC03NSAxMyAtMjUgNiAtMjYgNCAtMjUgLTMzIGwxIC0zOCAtNTcgLTMgYy0zMiAtMiAtNTggLTcgLTU4IC0xMyAwIC0yMiAyOSAtNzggNTkgLTExMSAxNyAtMjAgMzEgLTQzIDMxIC01MSAwIC0yMCAtNDggLTU2IC0xMzAgLTk3IGwtNjUgLTMzIDQ4IC00MyBjNjEgLTU1IDE1MyAtMTAwIDI0MiAtMTE5IDg3IC0xOCAxMzQgLTE4IDIwNiAtMSAxNDAgMzIgMjI1IDEyMiAyODUgMzAwIDEzIDM4IDMyIDc1IDQxIDgyIDE0IDEwIDE1IDEzIDQgMTQgLTExIDAgLTEwIDMgMyAxMyAxNiAxMiAxNyAxNSAzIDIwIC04IDMgLTMwIDM1IC00NyA3MiAtNDIgODggLTg4IDEyMCAtMTc0IDEyMCAtNDQgMCAtNzQgLTcgLTEwOCAtMjQgLTU3IC0yOSAtNzggLTIzIC03OCAyMiAwIDQzIC0xNSA1NyAtNjIgNTcgLTI3IDAgLTQwIDUgLTQ4IDIwIC0xMyAyNCAtMjggMjYgLTM2IDV6IG00NDYgLTIxNSBjMTIgLTggMTEgLTEwIC03IC0xMCAtNDIgMCAtMzIgLTU5IDEwIC02MSAxMiAwIDE2IC0zIDkgLTYgLTIzIC05IC02MyA3IC03MSAzMCAtMTYgNDMgMjAgNzIgNTkgNDd6IG0zMCAtMzAgYzAgLTUgLTQgLTEwIC05IC0xMCAtNiAwIC0xMyA1IC0xNiAxMCAtMyA2IDEgMTAgOSAxMCA5IDAgMTYgLTQgMTYgLTEweiIvPgo8L2c+Cjwvc3ZnPg=="/>

<img src="https://img.shields.io/badge/library-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white"/> <img src="https://img.shields.io/badge/sweetalert-FF3850?style=for-the-badge"/> <img src="https://img.shields.io/badge/lombok-46E3B7?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMCIgd2lkdGg9IjIwMC4wMDAwMDBwdCIgaGVpZ2h0PSIyMDAuMDAwMDAwcHQiIHZpZXdCb3g9IjAgMCAyMDAuMDAwMDAwIDIwMC4wMDAwMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPgoKPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMDAwMDAsMjAwLjAwMDAwMCkgc2NhbGUoMC4xMDAwMDAsLTAuMTAwMDAwKSIgZmlsbD0id2hpdGUiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik0zNzAgMTgyMiBjLTExMSAtMTI0IC0xNzAgLTMxNSAtMTcwIC01NTUgMCAtNjMgLTMgLTcyIC0zNSAtMTExIC02MCAtNzMgLTgwIC0xMzAgLTc5IC0yMjEgMSAtMTAzIDIxIC0xNDYgMTE3IC0yNTYgMTMxIC0xNTAgMjg2IC0yNjkgNDYyIC0zNTUgMjc2IC0xMzQgNTU2IC0xNjkgNzcwIC05NSAxMTkgNDEgMzQzIDE1MiAzODMgMTg5IDQwIDM4IDQzIDc4IDcgOTIgLTI5IDExIC03NiAzIC0yNTUgLTQyIC0yOTAgLTc0IC01MTAgLTI4IC02NzggMTQwIC02MSA2MCAtNjUgNjMgLTk0IDUzIC0yNiAtOSAtMzUgLTcgLTc0IDIwIC01MCAzNCAtNTQgNDYgLTE4IDU1IDIyIDYgMjQgMTAgMTkgMzUgLTUgMjIgLTMgMjkgOSAyOSAyMCAwIDIwIDQgLTMgNjUgLTEwIDI4IC0yNCA3NyAtMzEgMTEwIC0zMyAxNjQgLTE1MiAyODUgLTI4MSAyODUgLTQ2IDAgLTQ2IDAgLTUzIDM4IC0zIDIwIC02IDc5IC02IDEyOSAwIDc0IDUgMTA2IDI1IDE1OCAyNiA3MCA2NyAxMzUgMTA5IDE3NCAxNCAxNCAyNiAyNyAyNiAzMSAwIDQgLTIyIDI2IC00OSA0OCBsLTQ5IDQyIC01MiAtNTh6IG04NCAtMTEgYzE3IC0xOCAxNiAtMjEgLTIwIC02OCAtODggLTExNCAtMTE5IC0yMzMgLTEwNCAtMzk4IDEyIC0xMjkgMTIgLTEyNSAtMyAtMTI1IC03IDAgLTI5IC05IC01MCAtMTkgbC0zNyAtMTkgMCAxMTcgYzAgMjI3IDQ2IDM4MCAxNDggNDk0IDM5IDQzIDQzIDQ0IDY2IDE4eiBtLTE1NyAtNzA3IGMzIC05IC0yIC02MCAtMTIgLTExMyAtMjEgLTExNSAtMTYgLTE2MiAyNSAtMjUwIDUxIC0xMDYgMjExIC0yNDggNDAzIC0zNTUgNDggLTI2IDg3IC01MCA4NyAtNTEgMCAtNiAtMTAyIDM2IC0xNTggNjQgLTE4OSA5NiAtNDQxIDMzMiAtNDgxIDQ1MCAtMzUgMTA2IDI2IDI3MSAxMDAgMjcxIDE4IDAgMzIgLTYgMzYgLTE2eiBtMTg4IC0yODEgYzM0IC0xMCA3MyAtMTMgMTIxIC05IDY3IDUgNzIgNCA3NyAtMTYgMTAgLTM2IC0yIC00MSAtOTIgLTM1IC0xMTEgNiAtMTk1IDM0IC0xOTkgNjcgLTMgMjAgLTEgMjIgMjAgMTUgMTIgLTQgNDYgLTEzIDczIC0yMnoiLz4KPC9nPgo8L3N2Zz4="/> 

<img src="https://img.shields.io/badge/IDE-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/Spring Tool Suite3-6DB33F?style=for-the-badge&logo=spring&logoColor=white"/> <img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code"/> <img src="https://img.shields.io/badge/DBeaver-4D2B1A?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMCIgd2lkdGg9IjEyOC4wMDAwMDBwdCIgaGVpZ2h0PSIxMjguMDAwMDAwcHQiIHZpZXdCb3g9IjAgMCAxMjguMDAwMDAwIDEyOC4wMDAwMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPgoKPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMDAwMDAsMTI4LjAwMDAwMCkgc2NhbGUoMC4xMDAwMDAsLTAuMTAwMDAwKSIgZmlsbD0id2hpdGUiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik02OTkgMTA5MiBjLTI0IC0xNiAtNTYgLTQzIC03MCAtNjAgLTE4IC0yMSAtMzcgLTMyIC02MCAtMzQgLTMzIC0zIC0zNCAtNCAtMzIgLTQzIDEgLTIyIDQgLTU0IDggLTcwIDUgLTI1IC0yIC00OSAtMzggLTExOSBsLTQ0IC04OCA1IDU0IGM2IDc2IC0xNCAyMjAgLTM3IDI2NiAtNDYgOTAgLTE4MyA5MiAtMjM2IDIgLTE3IC0zMCAtMjAgLTUyIC0yMCAtMTUwIDAgLTEwNiAzIC0xMjMgMzcgLTIxNyA2MSAtMTc0IDE3MiAtMzU1IDI1OCAtNDIzIDY3IC01MyAxMTYgLTcwIDIwNyAtNzAgNTAgMCA4NSA0IDg5IDExIDQgOCAyMiA5IDUzIDQgNjIgLTEwIDExNyAtOCAxNDEgNSAyMiAxMiAyNyA0NSA5IDU2IC04IDUgLTkgMjYgLTMgNzMgNSAzNiA5IDExNiA5IDE3NiAwIDkwIC00IDEyMyAtMjQgMTgyIGwtMjQgNzIgMjcgNjEgYzI5IDY1IDM3IDE1MSAxNyAxODkgLTYgMTEgLTExIDMyIC0xMSA0NyAwIDI2IC0xIDI2IC00NyAyMCAtMjcgLTMgLTYyIC04IC04MCAtMTIgLTIwIC00IC00MyAwIC02NCAxMCAtNTUgMjcgLTY0IDIyIC01OSAtMzMgMSAtMTUgLTExIC0zNyAtMzMgLTYwIC03NSAtNzkgLTg4IC0xMjggLTM5IC0xNDkgMjYgLTExIDI1IC0xMSAtMTQgLTggbC00MiA0IC0yNiAtNjcgYy00MSAtMTAxIC01NiAtMTY5IC01NiAtMjUyIDAgLTc4IDIwIC0xNjUgNDcgLTIwOSBsMTYgLTI1IC0yMSAxOSBjLTEyIDExIC0zNCA0NCAtNDkgNzUgLTM3IDc4IC00MiAxNzIgLTE1IDI4MCAyMyA4OSA3MCAyMDMgODIgMTk2IDMgLTIgNyAxNSA3IDM4IDAgNTMgMzMgMTIzIDg1IDE4MiA0NyA1MyA4MyA3NCAxNDcgODUgbDQ2IDggLTUxIDEgYy0zOSAxIC02MCAtNSAtOTUgLTI3eiBtMjI5IC0zMTUgYy03IC0yMCAtMTcgLTM2IC0yMiAtMzYgLTUgMSAtMTIgLTUgLTE2IC0xMiAtMTIgLTE5IC00MCAtMiAtNDAgMjUgMCAxOSA3IDI2IDI5IDMxIDE2IDMgMzUgMTMgNDIgMjEgMTggMjIgMjEgMTEgNyAtMjl6Ii8+CjwvZz4KPC9zdmc+">

<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"> <img alt="Html" src ="https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="Css" src ="https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt="JavaScript" src ="https://img.shields.io/badge/JavaScriipt-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=black"/> <img src="https://img.shields.io/badge/java-%23ED8B00?style=for-the-badge&logo=openjdk&logoColor=white"> 

<img src="https://img.shields.io/badge/DB-%23121011?style=for-the-badge"> <img alt="Oracle" src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"/> 

<img src="https://img.shields.io/badge/server-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black"/>

<img src="https://img.shields.io/badge/OS-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white"/>

<img src="https://img.shields.io/badge/hosting-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white"/>

<img src="https://img.shields.io/badge/other-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"/> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white"/> <img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/> <img src="https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white"/> 

#### :hammer: API 및 기타 도구들
Category| Detail
:--:|:--:
API | ```JavaMail API```, ```Apache Commons FileUpload```, ```Fullcalendar```, ```KakaoMap```, ```KakaoLogin```, ```NaverLogin```, ```Iamport```, ```NaverCloud SMS```,```JDBC```
Diagram | ```ERDCloud```

## ⛳ <a id="function-implementation">기능 구현</a>

### 1. 일반 유저
#### 1-1.일반 로그인
![login](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/eb274a56-e224-4e12-bd8b-d7d830e37c1e)
* 먼저 회원 가입을 진행해야 하며, 이메일 인증을 통해 6자리 인증번호를 입력해야 가입할 수 있다.(Gmail SMTP)

#### 1-2.카카오 소셜 로그인
![kakaoLogin](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/ed22fb34-c8fd-4e29-a93b-e5df096437ba)
* REST API중 HttpURLConnection을 사용하여 구현
* 최초 로그인 시 이메일, 프로필 사진,닉네임 등을 가져올 수 있다
* 실제로 사업자 등록을 하고 비즈 앱 신청을 해야만 유저의 다른 정보들을 가져올 수 있기에 현재는 이메일을 아이디로 써서 로그인

#### 1-3.네이버 소셜 로그인
![naverLogin](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/7d68c337-7f3f-4713-bb20-996ff3b1bf0c)
* scribejava API로 구현
* 최초 로그인 시 휴대전화, 이름, 이메일을 가져올 수 있으며, 이메일 정보로 로그인

#### 1-4.예약
![book](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/43be5d9b-ec61-4347-8d8f-4ccc7864e892)
* 오늘 이전 날짜는 예약이 불가능.
* 캘린더를 통해 예약 날짜를 선택할 수 있다(FullCalendar API)
* 기본적으로 최소 4시간 이상만 예약이 가능하며, 파트너의 승인을 받아야 결제를 진행할 수 있다

#### 1-5.결제
![pay](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/0e6e90be-6e14-407f-ab98-fec88a65f5c3)
* Iamport API를 HttpsURLConnection으로 구현
* 보안이 중요한만큼 자바스크립트에서 한번(결제 후), 자바에서 한번 검증을 거친다(결제 전)
* 승인된 건에 대해서만 결제가 가능
* 결제 완료 시, 마이페이지의 결제 내역으로 이동

#### 1-6.환불
![refund](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/8d405c31-31e6-49d8-8a10-a9fc4a1aded6)
* 환불 사유를 필수적으로 입력해야 함
* 마이페이지의 지난내역, 환불내역에서 확인할 수 있다

#### 1-7.상품 상세
![productDetail](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/5757f19a-9edd-4296-b2d2-ef451fe854fb)
* 파트너가 등록한 상품 상세 설명이 있으며, 문의나 후기도 확인할 수 있음
* 하단에는 주소에 해당하는 위치를 지도로 확인할 수 있게 표시(카카오맵 API)

#### 1-8.문의
![question1](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/c71ef156-2e89-42c2-910d-e3bfbebb6d91)
* 자기가 쓴 문의만 수정, 삭제가 가능

#### 1-9.후기
![review](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/6d01bb88-a58b-40c4-b0f9-c167485c341a)
* 예약했던 이력이 있는 사람만 후기 등록 가능
* 1개의 리뷰 사진을 올릴 수 있음

### 2. 파트너
#### 2-1.파트너 등록
![patnerRegister](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/34479f7a-f97b-4434-81be-1cfff2dd7af1)
* 공공데이터 포털 API를 활용하여 해당 사업자 번호가 존재하는지 여부로 1차 인증.
* 등록 버튼 클릭 시 "사업자 번호+대표자명+개업일자"일치하는지 여부 확인하여 불일치 시 파트너 신청 불가
* 관리자가 파트너 신청을 승인해준 후부터 상품 등록이 가능하다
  
#### 2-2.예약 승인 
![bookApproval](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/09ffcc0b-d2b5-44a2-adc0-2e8baf286323)
* 캘린더로 예약 미승인 건(빨간색)과 예약 건(연두색)을 확인할 수 있다(FullCalendar API)
* 캘린더를 클릭 시, 예약 관련 상세 정보를 우측에 표시
* 예약을 거절했을 경우에는 예약자에게 문자가 발송된다

#### 2-3.파트너 페이지
![partnerManage](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/7cd524ba-0893-411c-9f40-528183015834)
* 파트너 관리, 상품 관리, 예약 관리, 환불 관리로 나눠져 있음
* 파트너는 자신이 등록한 상품들에 대해서만 수정 및 삭제가 가능
* 환불 관리는 바로 환불이 되지 않는 경우(예약일 4일전부터 환불 신청한 건)에 대해 관리할 수 있는 페이지

#### 2-4.상품 등록
![productAdd](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/506a9421-6c34-4fb5-9a1b-b7d839d4ca11)
* SummberNote API를 적용
* 상품 관련 이미지를 최대 5개까지 등록할 수 있음

#### 2-5.상품 목록
![productList](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/4242bda9-fc3a-48d2-8bc2-bd61eb87ee93)
* 검색(상품명, 내용)을 통해 원하는 상품을 찾을 수 있게 해놓음
* 최신 등록순, 높은 가격순, 낮은 가격순으로 조회 가능

### 3. 관리자 및 기타
#### 3-1.공지사항
![notice](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/9350a4fd-b594-4f64-8110-5f92233ad09b)
* 오직 관리자만 공지사항 작성, 수정, 삭제 가능
* 1개의 파일 첨부 가능

#### 3-2.관리자 페이지
![partnerApproval](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/c638db96-f1e2-405c-9fb4-81c238a65c95)
* 파트너 승인 및 취소 가능

#### 3-3.메인 페이지
![mainPage](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/6d84f767-a749-4b57-b505-1b92d3e19e81)
* 상품들을 최신순으로 정렬해놓음
  
#### 3-4.자주 찾는 질문(FAQ)
![FAQ](https://github.com/chan-hyeok-kim/I_Like_Kitchen/assets/132668682/9e3b3557-434a-4fb0-8951-6c4c3f62f67c)
* 우측에 고정해놓아서 언제든 찾을 수 있음

