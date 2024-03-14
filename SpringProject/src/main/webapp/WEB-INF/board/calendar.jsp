<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<link href="/resources/css/calendar.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<%@ include file="../includes/header.jsp" %>

        <div id="layoutSidenav">
            <%@ include file="../includes/sideDiv.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div id="box1">
                        <div id="box2">
                            <div>
                                <select name="year" id="ye">
                                    <option value="">선택하세요</option>
                                    <option value='<c:out value="${date.year+2}"/>'><c:out value="${date.year+2}"/>년</option>
                                    <option value='<c:out value="${date.year+1}"/>'><c:out value="${date.year+1}"/>년</option>
                                    <option value='<c:out value="${date.year}"/>'><c:out value="${date.year}"/>년</option>
                                    <option value='<c:out value="${date.year-1}"/>'><c:out value="${date.year-1}"/>년</option>
                                    <option value='<c:out value="${date.year-2}"/>'><c:out value="${date.year-2}"/>년</option>
                                    <option value='<c:out value="${date.year-3}"/>'><c:out value="${date.year-3}"/>년</option>
                                </select>
                                <select name="month" id="mon">
                                    <option value="">선택하세요</option>
                                    <option value="1">1월</option>
                                    <option value="2">2월</option>
                                    <option value="3">3월</option>
                                    <option value="4">4월</option>
                                    <option value="5">5월</option>
                                    <option value="6">6월</option>
                                    <option value="7">7월</option>
                                    <option value="8">8월</option>
                                    <option value="9">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                                <button>
                                    검색
                                </button>
                            </div>
                        </div>
                        <!--달력 시작-->
                        <div id="collecter">
                            <div class="day"><h3>SUN</h3></div>
                            <div class="day"><h3>MON</h3></div>
                            <div class="day"><h3>TUE</h3></div>
                            <div class="day"><h3>WEN</h3></div>
                            <div class="day"><h3>THU</h3></div>
                            <div class="day"><h3>FRI</h3></div>
                            <div class="day"><h3>SAT</h3></div>
                            <c:forEach var="i" begin="0" end="${date.day}">
                                <div class="none"></div>
                            </c:forEach>
                            <c:forEach var="i" begin="1" end="${date.lastdate}">
                                <div class="date">
                                    <div class="date_num"><c:out value="${i}"/>
                                    <a href="" class="material-symbols-outlined hide" id="add">add</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </main>
                <%@ include file="../includes/footer.jsp" %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
