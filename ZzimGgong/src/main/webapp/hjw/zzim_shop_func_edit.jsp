<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>찜꽁</title>
    <link rel="stylesheet" href="../index_markup/reset.css">
    <link rel="stylesheet" href="./style.css">
    <style type="text/css">

    </style>
    <script type="text/javascript" src="./script/power.js"></script>
</head>

<body>

    <div class="wrapper">
        <header>
            <h1 class="logo"><img src="../index_markup/img/main_logo.png" alt=""></h1>
            <nav class="gnb">
                <ul>
                    <li><a href="#"><img src="../index_markup/img/myPageImg.png" alt=""></a></li>
                    <li><button onclick="logout()">종료</button></li>
                </ul>
            </nav>
        </header>
        <section>
            <div class="content">
                <div class="myshop_header">
                    <span class="myshop_name">${res.res_name }</span>
                </div>
                <hr>

                <form action="zzim_shop_func.jsp">
                    <p>매장 pick</p>
                    <div class="pick_contain">
                        <label class="pick_label" for="pick1">아늑<input type="checkbox" id="pick1"></label>
                        <label class="pick_label" for="pick2">데이트<input type="checkbox" id="pick2"></label>
                        <label class="pick_label" for="pick3">파티<input type="checkbox" id="pick3"></label>
                        <label class="pick_label" for="pick4">일식<input type="checkbox" id="pick4"></label>
                        <label class="pick_label" for="pick5">양식<input type="checkbox" id="pick5"></label>
                        <label class="pick_label" for="pick6">중식<input type="checkbox" id="pick6"></label>
                    	<input class="upload" type="submit" value="저장">
                    </div>
                </form>
                <div class="myshop_img-contain">
                    <img class="myshop_img" src="../index_markup/img/shop_cafeImg.png" alt="">
                </div>	
            </div>
        </section>
        <footer>
            <nav class="footer_nav">
                <ul>
                    <li><a href="#">서비스 이용약관</a></li>
                    <li><a href="#">개인정보 처리방침</a></li>
                    <li><a href="#">제휴 문의</a></li>
                    <li><a href="#">채용 공고</a></li>
                </ul>
            </nav>
            <p class="jjim_info">
                (주) 찜꽁<br>
                대표 : 이지원<br>
                주소 : 서울특별시 마포구 월드컵북로 21 2층 풍성빌딩<br>
                사업자등록번호 : 202212142126<br>
                개인정보담당 : service@jjimggong.co.kr
            </p>

        </footer>
    </div>

</body>
<script>
    var pickAll = document.querySelectorAll(".pick_label");
    pickAll.forEach(function (pickAll) {
        pickAll.onclick = function () {
            this.style.background = "#995dbb"
            this.style.color = "#f2ebf5"
        }
    })
</script>

</html>