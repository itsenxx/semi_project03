<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<link href="/resources/css/calendar.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<%@ include file="../includes/header.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>Product Registration</title>
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

.intextbox-name,
.intextbox-price {
    border:none;
    width: 100%;
    height: 100%;
    background-color: inherit;
}

</style>

</head>

<body>
    <div id="layoutSidenav">
    <%@ include file="../includes/sideDiv.jsp" %>
        <div id="layoutSidenav_content">
            <main>

                <h2>제품 등록</h2>
                <br>

                <form id="partsForm" action="/product/submitParts" method="post" onsubmit="return false">
                <table id="partsTable">
                    <thead>
                        <tr>
                            <th>Part</th>
                            <th>Part Name</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>
                                <select name="part1">
                                    <option value=""></option>
                                    <option value="CPU">CPU</option>
                                    <option value="MAINBOARD">MAINBOARD</option>
                                    <option value="GPU">GPU</option>
                                    <option value="RAM">RAM</option>
                                    <option value="POWER">POWER</option>
                                    <option value="CASE">CASE</option>
                                </select>
                            </td>
                            <td>
                                <input id="partCheck1" class="intextbox-name" type="text" name="part_name1" placeholder="제품 이름">
                            </td>
                            <td>
                                <input class="intextbox-price" type="number" name="part_price1" style="border:none;" placeholder="가격" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="part2">
                                    <option value=""></option>
                                    <option value="CPU">CPU</option>
                                    <option value="MAINBOARD">MAINBOARD</option>
                                    <option value="GPU">GPU</option>
                                    <option value="RAM">RAM</option>
                                    <option value="POWER">POWER</option>
                                    <option value="CASE">CASE</option>
                                </select>
                            </td>
                            <td>
                                <input class="intextbox-name" type="text" name="part_name2" placeholder="제품 이름">
                            </td>
                            <td>
                                <input class="intextbox-price" type="number" name="part_price2" style="border:none;" placeholder="가격" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="part3">
                                    <option value=""></option>
                                    <option value="CPU">CPU</option>
                                    <option value="MAINBOARD">MAINBOARD</option>
                                    <option value="GPU">GPU</option>
                                    <option value="RAM">RAM</option>
                                    <option value="POWER">POWER</option>
                                    <option value="CASE">CASE</option>
                                </select>
                            </td>
                            <td>
                                <input class="intextbox-name" type="text" name="part_name3" placeholder="제품 이름">
                            </td>
                            <td>
                                <input class="intextbox-price" type="number" name="part_price3" style="border:none;" placeholder="가격" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="part4">
                                    <option value=""></option>
                                    <option value="CPU">CPU</option>
                                    <option value="MAINBOARD">MAINBOARD</option>
                                    <option value="GPU">GPU</option>
                                    <option value="RAM">RAM</option>
                                    <option value="POWER">POWER</option>
                                    <option value="CASE">CASE</option>
                                </select>
                            </td>
                            <td>
                                <input class="intextbox-name" type="text" name="part_name4" placeholder="제품 이름">
                            </td>
                            <td>
                                <input class="intextbox-price" type="number" name="part_price4" style="border:none;" placeholder="가격" >
                            </td>
                        </tr>
                    </tbody>
                </table>
            <button class="btn btn-dark" type="button" onclick="addPart()" style="width: 100%;">Add Part</button>
            <br>
            <br>
            <input class="btn btn-success" id="submitButton" type="submit" value="REGISTER" style="width: 100%;"/>

            </form>
        </main>
        </div>
    </div>
</body>

</html>
<script>
$(document).ready(function() {
                        //blur or input - 입력시마다 확인하거나 영역을 벗어날 때 확인하거나
    $('.intextbox-name').on('input', function() {
        var productName = $(this).val().trim();

        var inputName = $(this);
        var tdInput = inputName.closest('td');

        if (productName === '') {
            tdInput.css('border', '');
            $('#partsForm').attr('onsubmit', 'return false;');
            return; // 값이 없으면 실행하지 않음
        }

        $.ajax({
            type: 'POST',
            url: '/product/checkName',
            data: { productName: productName },
            success: function(response) {

                if (response !== 'true') {
                    console.log('제품명이 존재하지 않습니다. 등록 가능');
                    tdInput.css('border', '1px solid green');
                    $('#partsForm').removeAttr('onsubmit');

                } else {
                    tdInput.css('border', '');
                    $('#partsForm').attr('onsubmit', 'return false;');
                }
            },
            error: function(xhr, status, error) {
                console.error('에러 발생: ' + error);
            }

        });
    });
});

function addPart() {

        var partsTable = document.getElementById("partsTable");
        var startIndex = partsTable.rows.length; // 현재 행 수를 시작 인덱스로 사용

        for (var i = 0; i < 4; i++) {
            var newRow = partsTable.insertRow(-1);
            var cell1 = newRow.insertCell(0);
            var cell2 = newRow.insertCell(1);
            var cell3 = newRow.insertCell(2);

            var partIndex = startIndex + i; // 각 행의 인덱스 계산

            cell1.innerHTML = `
                <select name="part` + partIndex + `">
                    <option value=""></option>
                    <option value="CPU">CPU</option>
                    <option value="MAINBOARD">MAINBOARD</option>
                    <option value="GPU">GPU</option>
                    <option value="RAM">RAM</option>
                    <option value="POWER">POWER</option>
                    <option value="CASE">CASE</option>
                </select>
            `;
            cell2.innerHTML = `<input class="intextbox-name" type="text" name="part_name` + partIndex + `" placeholder="제품 이름">`;
            cell3.innerHTML = `<input class="intextbox-price" type="number" name="part_price`+partIndex + `" style="border:none;" placeholder="가격">`;
        }

}

</script>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="/resources/js/calendar.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
