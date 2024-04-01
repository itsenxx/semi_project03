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
                            <h4><c:out value="${date.month}"/>월</h4>
                            <div>
                                <select class="custom-select" name="year" id="ye">
                                    <option value="">선택하세요</option>
                                    <option value='<c:out value="${date.year+2}"/>'><c:out value="${date.year+2}"/>년</option>
                                    <option value='<c:out value="${date.year+1}"/>'><c:out value="${date.year+1}"/>년</option>
                                    <option value='<c:out value="${date.year}"/>'><c:out value="${date.year}"/>년</option>
                                    <option value='<c:out value="${date.year-1}"/>'><c:out value="${date.year-1}"/>년</option>
                                    <option value='<c:out value="${date.year-2}"/>'><c:out value="${date.year-2}"/>년</option>
                                    <option value='<c:out value="${date.year-3}"/>'><c:out value="${date.year-3}"/>년</option>
                                </select>
                                <select class="custom-select" name="month" id="mon">
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
                                <button class="blue-button">
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
                                    <div class="date_num">
                                        <c:out value="${i}"/>
                                        <div class="material-symbols-outlined hide" id="add">add</div>
                                    </div>
                                    <div class="insertnote hide">
                                        <div class="insertnotebox">
                                            <div class="insertbuttonbox">
                                                <label>작성자:</label><br>
                                                <input type="text"class="cl-text" name="name" value='name' readonly><br>
                                                <label>제목:</label>
                                                <input type="text"class="cl-text text" name="writer">

                                                <label>내용:</label>
                                                <textarea class="cl-text text" name="content" rows="8" cols="50" ></textarea>
                                                <div class="partnote">
                                                    <select class="custom-select partSelect">
                                                        <option value="">선택하세요</option>
                                                        <option value="cpu">CPU</option>
                                                        <option value="gpu">GPU</option>
                                                        <option value="mainboard">MAINBOARD</option>
                                                        <option value="ram">RAM</option>
                                                        <option value="power">POWER</option>
                                                        <option value="case">CASE</option>
                                                    </select>
                                                    <select class="custom-select partNameSelect">
                                                        <option value="">선택하세요</option>
                                                    </select>
                                                    <input type="text" class=""placeholder="수량" >
                                                <!--재고 작성-->
                                                </div>
                                                <input class="clear pretty-button" type="button" value="작성">
                                                <input class="add blue-button" type="button" value="추가">
                                                <input class="close red-button" type="button" value="닫기">
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach items="${calendarList}" var="calendar">
                                        <c:if test="${i == calendar.date}">
                                            <div class="date_note" onclick=''>
                                                <div class="date_subject"><c:out value="${calendar.cl_subject}"/></div>
                                            	<div class="date_content"><c:out value="${calendar.cl_content}"/></div>
                                            </div>
                                            <div class="note hide">
                                                <div class="notebox">
                                                <div class="buttonbox">
                                                    <label>작성자:</label><br>
                                                    <input type="text"class="cl-text" name="writer" value='<c:out value="${calendar.emp_name}"/>' readonly><br>
                                                    <label>제목:</label>
                                                    <input type="text"class="cl-text text" name="writer" value='<c:out value="${calendar.cl_subject}"/>' readonly>

                                                    <label>내용:</label>
                                                    <textarea class="cl-text text" name="content" rows="8" cols="50" readonly><c:out value="${calendar.cl_content}"/></textarea>
                                                    <div class="partnote">
                                                        <c:forEach items="${putList}" var="put">
                                                            <c:if test="${put.st_num eq calendar.cl_num}">
                                                                <label>${put.part}:${put.part_name}  ${put.part_ea}개</label>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                    <input class="modify pretty-button" type="button" value="수정">
                                                    <input class="close red-button" type="button" value="닫기">
                                                    <input class="cancel red-button hide" type="button" value="취소">
                                                    <input class="blue-button clear" type="button" value="납품완료" onclick=location.href=''>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
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
        <script src="/resources/js/calendar.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script>
        /* 스케줄 클릭 함수 */
        $(document).ready(function(){
            var note;
            var button;
            for(let i=0; i<${date.lastdate}; i++){
                for(let j =0; j<2; j++){
                    $('#collecter').children('.date:eq('+i+')').children('.date_note').eq(j).click(function(){
                        note = $('#collecter').children('.date:eq('+i+')').children('.note').eq(j);
                        button = note.children('.notebox').children('.buttonbox');
                        note.removeClass('hide');

                        button.children('.close').click(function(){
                            note.addClass('hide');
                        });

                        button.children('.modify').click(function(){
                            $(this).addClass('modifyFianl');
                            button.children('.close').addClass('hide');
                            button.children('.cancel').removeClass('hide');
                            button.children('.clear').addClass('hide');
                            $('.text').removeAttr('readonly');
                            $('.text').focus();
                        });

                        button.children('.cancel').click(function(){
                            $(this).removeClass('modifyFianl');
                            button.children('.cancel').addClass('hide');
                            button.children('.close').removeClass('hide');
                            button.children('.clear').removeClass('hide');
                            $('.text').attr('readonly', 'readonly');
                        });
                    });
                }
            }
            $(document).ready(function(){
                var insertnote;
                var insertbutton;

                $('#collecter').on('mouseenter', '.date_num', function(){
                    var index = $(this).index('.date_num');
                    var $materialSymbol = $(this).children('.material-symbols-outlined');
                    $materialSymbol.removeClass('hide');

                    $materialSymbol.one('click', function(){
                        insertnote = $('#collecter').children('.date').eq(index).children('.insertnote');
                        insertbutton = insertnote.children('.insertnotebox').children('.insertbuttonbox');
                        insertnote.removeClass('hide');

                        insertbutton.children('.partnote').each(function(){
                            var $partSelect = $(this).find('.partSelect');
                            var $partNameSelect = $(this).find('.partNameSelect');

                            // 이벤트 핸들러를 한 번만 등록하도록 수정
                            $partSelect.off("change").on("change", function(){
                                $partNameSelect.empty().append("<option value=''>선택하세요</option>");
                                var partname = $(this).siblings('.partNameSelect');
                                const part = $(this).val();
                                productRead(part, function(list){
                                    var options = "<option value=''>선택하세요</option>";
                                    list.forEach(function(item){
                                        options += "<option value='" + item.name + "'>" + item.name + "</option>";
                                    });
                                    partname.html(options);
                                });
                            });
                        });

                        insertbutton.children('.add').off("click").on("click", function(){
                            var $partnote = $(this).siblings('.partnote');
                            $partnote.append("<select class='custom-select partSelect'><option value=''>선택하세요</option><option value='cpu'>CPU</option><option value='gpu'>GPU</option><option value='mainboard'>MAINBOARD</option><option value='ram'>RAM</option><option value='power'>POWER</option><option value='case'>CASE</option></select><select class='custom-select partNameSelect'><option value=''>선택하세요</option></select><input type='text' class=''placeholder='수량' >");
                        });

                        insertbutton.children('.clear').click(function(){
                            alert('작성되었습니다.' + index);
                            location.reload(true);
                        });
                        insertbutton.children('.close').click(function(){
                            insertnote.addClass('hide');
                            // ".add"로 추가된 것 제거
                            insertnote.find('.partnote').children('select, input').remove();
                        });
                    });
                }).on('mouseleave', '.date_num', function(){
                    $(this).children('.material-symbols-outlined').addClass('hide');
                });
            });
        });


        </script>
    </body>
</html>
