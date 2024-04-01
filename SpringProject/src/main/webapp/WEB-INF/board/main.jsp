<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<%@ include file="../includes/header.jsp" %>

        <div id="layoutSidenav">
            <%@ include file="../includes/sideDiv.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        공지 사항
                                    </div>
                                    <div class="card-body">
                                        <table class="datatablesSimple">
                                            <thead>
                                                <tr>
                                                    <th>Subject</th>
                                                    <th>Content</th>
                                                    <th>CreationDate</th>
                                                    <th>EMPName</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>Subject</th>
                                                    <th>Content</th>
                                                    <th>CreationDate</th>
                                                    <th>EMPName</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        제품 등록 현황
                                    </div>
                                    <div class="card-body">
                                        <table class="datatablesSimple">
                                            <thead>
                                                <tr>
                                                    <th>Part</th>
                                                    <th>PartName</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>Part</th>
                                                    <th>PartName</th>
                                                    <th>Price</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <c:forEach items="${productList}" var="product">
                                                    <tr>
                                                        <td>${product.part}</td>
                                                        <td>${product.partName}</td>
                                                        <td>${product.partPrice}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                스케줄표
                            </div>
                            <div class="card-body">
                                <table class="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Subject</th>
                                            <th>Content</th>
                                            <th>CreationDate</th>
                                            <th>EMPName</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Subject</th>
                                            <th>Content</th>
                                            <th>CreationDate</th>
                                            <th>EMPName</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${calendarList}" var="calendar">
                                            <tr>
                                                <td>${calendar.cl_subject}</td>
                                                <td>${calendar.cl_content}</td>
                                                <td>${calendar.creation_date}</td>
                                                <td>${calendar.emp_name}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
