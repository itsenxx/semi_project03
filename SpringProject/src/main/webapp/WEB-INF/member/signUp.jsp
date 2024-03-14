<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous">
</script>
    <style>
        @font-face {
            font-family: 'SOYOMapleBoldTTF';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        * {
            font-family: 'SOYOMapleBoldTTF';
        }

        body {
            background-color: #1b1b1b;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #fff;
        }

        .signup-container {
            background-color: #2b2b2b;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .signup-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .signup-form button,
        .signup-form select {
            background-color: #eeff00;
            color: #1f1f1f;
            padding: 10px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
        }

        #btn {
            background-color: #ff0000;
            color: #fff;
            padding: 10px;
            margin-top: 45px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
        }

        #btn:hover {
            background-color: #08088A;
        }
    </style>

    <script defer src="./js/jquery-3.7.1.min.js"></script>
</head>
<body>

<div class="signup-container">
    <h1>CompuZoon SignUp</h1>
    <form class="signup-form" action="/member/signUp" method="post" id="form1" onsubmit="return false">
        <input type="text" id="emp_id" name="emp_id" placeholder="id"><br>
        <input type="text" id="emp_name" name="emp_name" placeholder="name"><br>
        <input type="password" id="emp_pw" name="emp_pw" placeholder="pw"><br>
        <select id="emp_pos" name="emp_pos">
            <option value="" disabled selected hidden>Select the position</option>
            <option value="staff">staff</option>
            <option value="Manager">Manager</option>
            <option value="Master">Master</option>
        </select>
        <br>

        <input id="btn" type="submit" value="Sign up" onClick="javascript:checkBox();">
    </form>
</div>

<script>

    function checkBox() {
        if (!$('#emp_id').val()) {
            alert('아이디를 입력하세요');
            $('#emp_id').focus();
            return;
        }

        if (!$('#emp_name').val()) {
            alert('이름을 입력하세요.');
            $('#emp_name').focus();
            return;
        }
        if (!$('#emp_pw').val()) {
            alert('암호를 입력하세요.');
            $('#emp_pw').focus();
            return;
        }
        if (!$('#emp_pos').val()) {
            alert('직급을 선택하세요');
            $('#emp_pos').focus();
            return;
        }
        document.getElementById('form1').submit();
    }
</script>
</body>
</html>