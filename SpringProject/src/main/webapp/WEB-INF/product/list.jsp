

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<link href="/resources/css/calendar.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
  body {
    color: #666;
    font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
  }
  table {
    border-collapse: separate;
    border-spacing: 0;
    width: 100%;
  }
  th,
  td {
    padding: 6px 15px;
  }
  th {
    background: #42444e;
    color: #fff;
    text-align: left;
  }
  tr:first-child th:first-child {
    border-top-left-radius: 6px;
  }
  tr:first-child th:last-child {
    border-top-right-radius: 6px;
  }
  td {
    border-right: 1px solid #c6c9cc;
    border-bottom: 1px solid #c6c9cc;
  }
  td:first-child {
    border-left: 1px solid #c6c9cc;
  }
  tr:nth-child(even) td {
    background: #eaeaed;
  }
  tr:last-child td:first-child {
    border-bottom-left-radius: 6px;
  }
  tr:last-child td:last-child {
    border-bottom-right-radius: 6px;
  }
  
  select {
    width: 100%; /* 원하는 너비설정 */
    padding: .3em .3em;
    font-family: inherit;
    border: 1px solid #999;
    border-radius: 0px;
    border:none;
    background-color: inherit;
  }
  
  .intextbox-part,
  .intextbox-name,
  .intextbox-price {
      border:none;
      width: 100%;
      height: 100%;
      background-color: inherit;
  }
  
  </style>
<%@ include file="../includes/header.jsp" %>

        <div id="layoutSidenav">
            <%@ include file="../includes/sideDiv.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                  <h2>제품 리스트</h2><button onclick="location.href='regist'">제품등록</button>
                  <button onclick="location.href='partIn'">제품입고</button>

                  <table>
                      <thead>
                          <tr>
                              <th>Part</th>
                              <th>Part Name</th>
                              <th>Price</th>
                          </tr>
                      </thead>
  
                  <tbody>
                      <c:forEach items="${products}" var="product">
                      <tr>
                          <td><c:out value="${product.part}" /></td>
                          <td><c:out value="${product.partName}" /></td>
                          <td><c:out value="${product.partPrice}" /></td>
                      </tr>
                       </c:forEach>
                  </tbody>
                </main>
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