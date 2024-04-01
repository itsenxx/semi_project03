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
                <div class="panel-body">
                    <h5>게시글 작성</h3>
                	<form method="post" action="">
                		<label>작성자</label>
                        <input class="form-control" name="writer" value="유저" readonly>
                        <label for="title">제목:</label><br>
                        <input type="text" id="title" name="title"><br>
                        <label for="content">내용:</label><br>
                        <textarea id="content" name="content" rows="8" cols="50"></textarea><br>
                		<input type="submit" class="pretty-button" value="글 등록하기" style="margin-top: 50px;">
                		<input type="button" class="pretty-button" value="목록보기"
                								onClick="" style="margin-top: 50px;">
                	</form>
                </div>
            </div>
        </main>
    <%@ include file="../includes/footer.jsp" %>
    </div>
</div>
</body>
</html>
