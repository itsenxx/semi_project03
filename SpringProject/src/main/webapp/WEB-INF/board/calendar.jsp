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
                                    <option value="${date.year+2}" <c:if test="${date.year + 2 == param.year}">selected</c:if>>${date.year+2}년</option>
                                    <option value="${date.year+1}" <c:if test="${date.year + 1 == param.year}">selected</c:if>>${date.year+1}년</option>
                                    <option value="${date.year}" <c:if test="${date.year == param.year}">selected</c:if>>${date.year}년</option>
                                    <option value="${date.year-1}" <c:if test="${date.year - 1 == param.year}">selected</c:if>>${date.year-1}년</option>
                                    <option value="${date.year-2}" <c:if test="${date.year - 2 == param.year}">selected</c:if>>${date.year-2}년</option>
                                    <option value="${date.year-3}" <c:if test="${date.year - 3 == param.year}">selected</c:if>>${date.year-3}년</option>
                                </select>
                                <select class="custom-select" name="month" id="mon">
                                    <option value="">선택하세요</option>
                                    <option value="1" <c:if test="${1 == param.month}">selected</c:if>>1월</option>
                                    <option value="2" <c:if test="${2 == param.month}">selected</c:if>>2월</option>
                                    <option value="3" <c:if test="${3 == param.month}">selected</c:if>>3월</option>
                                    <option value="4" <c:if test="${4 == param.month}">selected</c:if>>4월</option>
                                    <option value="5" <c:if test="${5 == param.month}">selected</c:if>>5월</option>
                                    <option value="6" <c:if test="${6 == param.month}">selected</c:if>>6월</option>
                                    <option value="7" <c:if test="${7 == param.month}">selected</c:if>>7월</option>
                                    <option value="8" <c:if test="${8 == param.month}">selected</c:if>>8월</option>
                                    <option value="9" <c:if test="${9 == param.month}">selected</c:if>>9월</option>
                                    <option value="10" <c:if test="${10 == param.month}">selected</c:if>>10월</option>
                                    <option value="11" <c:if test="${11 == param.month}">selected</c:if>>11월</option>
                                    <option value="12" <c:if test="${12 == param.month}">selected</c:if>>12월</option>
                                </select>
                                <button class="blue-button" id="calendarBtn">
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
                                                <input type="text"class="cl-subject cl-text text" name="writer">

                                                <label>내용:</label>
                                                <textarea class="cl-content cl-text text" name="content" rows="8" cols="50" ></textarea>
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
                                                    <input class="partEa" type="text" class=""placeholder="수량" >
                                                <!--재고 작성-->
                                                </div>
                                                <input class="clear pretty-button" type="button" value="작성">
                                                <input class="add blue-button" type="button" value="추가">
                                                <input class="close red-button" type="button" value="닫기">
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach items="${calendarList}" var="calendar">
                                        <c:if test="${i == calendar.cl_date}">
                                            <div class="date_note" onclick=''>
                                                <div class="date_subject"><c:out value="${calendar.cl_subject}"/></div>
                                            	<div class="date_content"><c:out value="${calendar.cl_content}"/></div>
                                            </div>
                                            <div class="note hide">
                                                <div class="notebox">
                                                <div class="buttonbox">
                                                    <label>작성자:</label><br>
                                                    <input type="text"class="cl-text emp_name" name="name" value='<c:out value="${calendar.emp_name}"/>' readonly><br>
                                                    <label>제목:</label>
                                                    <input type="text"class="cl-text text sch_subject" name="subject" value='<c:out value="${calendar.cl_subject}"/>' readonly>

                                                    <label>내용:</label>
                                                    <textarea class="cl-text text sch_content" name="content" rows="8" cols="50" readonly><c:out value="${calendar.cl_content}"/></textarea>
                                                    <div class="partnote">
                                                        <c:forEach items="${putList}" var="put">
                                                            <c:if test="${put.st_num eq calendar.cl_num}">
                                                                <div class="partnote">
                                                                    <select class="custom-select partSelect" disabled>
                                                                        <option value="" ${put.part == '' ? 'selected' : ''}>선택하세요</option>
                                                                        <option value="cpu" ${put.part == 'cpu' ? 'selected' : ''}>CPU</option>
                                                                        <option value="gpu" ${put.part == 'gpu' ? 'selected' : ''}>GPU</option>
                                                                        <option value="mainboard" ${put.part == 'mainboard' ? 'selected' : ''}>MAINBOARD</option>
                                                                        <option value="ram" ${put.part == 'ram' ? 'selected' : ''}>RAM</option>
                                                                        <option value="power" ${put.part == 'power' ? 'selected' : ''}>POWER</option>
                                                                        <option value="case" ${put.part == 'case' ? 'selected' : ''}>CASE</option>
                                                                    </select>
                                                                    <select class="custom-select partNameSelect" disabled>
                                                                        <option value="${put.part_name}">${put.part_name}</option>
                                                                    </select>
                                                                    <input class="partEa" type="text" value="${put.part_ea}" readonly>개
                                                                <!--재고 작성-->
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                    <input class="modify pretty-button" type="button" value="수정">
                                                    <input class="modifyFinal blue-button hide" type="button" value="수정">
                                                    <input class="close red-button" type="button" value="닫기">
                                                    <input class="cancel red-button hide" type="button" value="취소">
                                                    <input class="blue-button clearFinal" type="button" value="납품완료">
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
                // 스케줄 클릭 이벤트 처리
                var note;
                var button;
                for (let i = 0; i < ${date.lastdate}; i++) {
                    for (let j = 0; j < 2; j++) {
                        $('#collecter').children('.date:eq(' + i + ')').children('.date_note').eq(j).click(function(){
                            var index = $(this).closest('.date').index('.date');
                            note = $('#collecter').children('.date:eq(' + i + ')').children('.note').eq(j);
                            button = note.children('.notebox').children('.buttonbox');
                            note.removeClass('hide');

                            // 스케줄 상세 보기 닫기
                            button.children('.close').click(function(){
                                note.addClass('hide');
                            });

                            var schPartOption;
                            var schPNameOption;
                            var schEa;
                            var subject;
                            var content;
                            var empNum = 1;
                            var empName = 'name';
                            var eaModify;

                            // 수정 버튼 클릭 시 초기값 저장
                            button.children('.modify').click(function(){
                                $(this).addClass('hide');
                                button.children('.modifyFinal').removeClass('hide');
                                button.children('.close').addClass('hide');
                                button.children('.cancel').removeClass('hide');
                                button.children('.clearFinal').addClass('hide');
                                button.find('.partSelect').prop('disabled', false);
                                button.find('.partNameSelect').prop('disabled', false);
                                button.find('.partEa').removeAttr('readonly');
                                button.children('.sch_content').removeAttr('readonly');
                                button.children('.sch_subject').removeAttr('readonly');
                                
                                schPartOption = button.find('.partSelect').val();
                                schPNameOption = button.find('.partNameSelect').val();
                                schEa = button.find('.partEa').val();
                                subject = button.children('.sch_subject').val();
                                content = button.children('.sch_content').text();
                                
                            });

                            button.children('.clearFinal').click(function(){
                                alert('제품 납품이 완료되었습니다.');
                                location.reload(true);
                            });

                            // 수정 취소 버튼 클릭 시 초기값으로 복원
                            button.children('.cancel').click(function(){
                                button.children('.modify').removeClass('hide');
                                button.children('.modifyFinal').addClass('hide');
                                button.children('.cancel').addClass('hide');
                                button.children('.close').removeClass('hide');
                                button.children('.clearFinal').removeClass('hide');
                                button.find('.partSelect').prop('disabled', true);
                                button.find('.partNameSelect').prop('disabled', true);
                                button.find('.partEa').attr('readonly', 'readonly');
                                button.children('.sch_content').attr('readonly', 'readonly');
                                button.children('.sch_subject').attr('readonly', 'readonly');
                                
                                // 초기값으로 복원
                                button.find('.partSelect').val(schPartOption);
                                button.find('.partNameSelect').val(schPNameOption);
                                button.find('.partEa').val(schEa);
                                button.children('.sch_subject').val(subject);
                                button.children('.sch_content').val(content);
                            });

                            // 수정 완료 버튼 클릭 시 처리
                            button.children('.modifyFinal').click(function(){
                                
                                if(schPartOption != button.find('.partSelect').val()){schPartOption = button.find('.partSelect').val();}
                                if(schPNameOption != button.find('.partNameSelect').val()){schPNameOption = button.find('.partNameSelect').val();}
                                if(subject != button.children('.sch_subject').val()){subject = button.children('.sch_subject').val();}
                                if(content != button.children('.sch_content').text()){content = button.children('.sch_content').text();}
                                eaModify = button.find('.partEa').val();

                                schModify(
                                    {sch_num: index, emp_num: empNum, emp_name: empName,cl_content: content,cl_subject: subject,part: schPartOption,name: schPNameOption,ea: schEa,eaModify: eaModify},
                                    function(success){
                                        alert('수정되었습니다.' + index);
                                        location.reload(true);
                                    }
                                );
                                alert('수정완료했습니다' + index);
                                location.reload(true);
                            });
                        });
                    }
                }
            });

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

                            $partSelect.off("change").on("change", function(){
                                $partNameSelect.empty().append("<option value=''>선택하세요</option>");
                                var partname = $(this).siblings('.partNameSelect');
                                const part = $(this).val();
                                console.log(part);
                                productRead(part, function(list){
                                    var options = "<option value=''>선택하세요</option>";
                                    list.forEach(function(item){
                                        console.log(item.name);
                                        options += "<option value='" + item.name + "'>" + item.name + "</option>";
                                    });
                                    partname.html(options);
                                });
                            });
                        });

                        insertbutton.children('.add').off("click").on("click", function(){
                            var $partnote = $(this).siblings('.partnote');
                            $partnote.append("<select class='custom-select partSelect'><option value=''>선택하세요</option><option value='cpu'>CPU</option><option value='gpu'>GPU</option><option value='mainboard'>MAINBOARD</option><option value='ram'>RAM</option><option value='power'>POWER</option><option value='case'>CASE</option></select><select class='custom-select partNameSelect'><option value=''>선택하세요</option></select><input type='text' class='' placeholder='수량'>");
                        });

                        insertbutton.children('.clear').off("click").on("click", function(){ // 여기서 .off() 메소드를 사용하여 기존 이벤트 핸들러 제거
                            var empNum = 1;
                            var empName = 'name';
                            var creationDate = '${date.year}-${date.month}-' + (index+1);
                            var content =  insertbutton.children('.cl-content').val();
                            var subject = insertbutton.children('.cl-subject').val();
                            var part = insertbutton.children('.partnote').children('.partSelect').val();
                            var partname = insertbutton.children('.partnote').children('.partNameSelect').val();
                            var partea = insertbutton.children('.partnote').children('.partEa').val();
                            scheduleAdd(
                                {emp_num: empNum, emp_name: empName, creation_date: creationDate,cl_content: content,cl_subject: subject,part: part,name: partname,ea: partea},
                                function(success){
                                    alert('작성되었습니다.' + index);
                                    location.reload(true);
                                }
                            );
                        });

                        insertbutton.children('.close').click(function(){
                            insertnote.addClass('hide');
                            // 추가된 ".add" 요소 제거
                            insertnote.find('.partnote').children('select, input').remove();
                        });
                    });
                }).on('mouseleave', '.date_num', function(){
                    $(this).children('.material-symbols-outlined').addClass('hide');
                });
            });

            $(document).ready(function(){
                // 달력 검색 버튼 클릭 이벤트 처리
                $('#calendarBtn').click(function(){
                    var year = $('#ye').val();
                    var month = $('#mon').val();
                    location.href = "calendar?year=" + year + "&month=" + month;
                });
            });
        </script>
    </body>
</html>