<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<div id="bigDiv">
        <c:import url="/WEB-INF/views/temp/mypageMenu.jsp"></c:import>
    
        <menu id="listDiv">
            <div>
                <h3>진행 내역</h3>
            </div>

            <div id="gridDiv">
                <div id="imgDiv">
                    <img src="../../img/kitchen01.jpg">
                </div>            
                <div id="contentsDiv">
                    <table>
                        <tr>
                            <th>상품명</th>
                            <td>공유 주방</td>
                        </tr>
                        <tr>
                            <th>예약 번호</th>
                            <td>80286</td>
                        </tr>
                        <tr>
                            <th>사용 기간</th>
                            <td>2023-08-25 ~ 2023-08-25</td>
                        </tr>
                    </table>

                    <button id="detailBtn">상세 내역</button>
                </div>
            </div>
            <div id="gridDiv">
                <div id="imgDiv">
                    <img src="../../img/kitchen01.jpg">
                </div>            
                <div id="contentsDiv">
                    <table>
                        <tr>
                            <th>상품명</th>
                            <td>공유 주방</td>
                        </tr>
                        <tr>
                            <th>예약 번호</th>
                            <td>80286</td>
                        </tr>
                        <tr>
                            <th>사용 기간</th>
                            <td>2023-08-25 ~ 2023-08-25</td>
                        </tr>
                    </table>

                    <button id="detailBtn">상세 내역</button>
                </div>
            </div>
        </menu>
    </div>
</body>
</html>