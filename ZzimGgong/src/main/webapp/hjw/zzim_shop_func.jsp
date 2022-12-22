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
    <script type="text/javascript" src="./script/shop_loginJS.js"></script>
</head>

<body>

    <div class="wrapper">
        <header>
            <h1 class="logo"><img src="../index_markup/img/main_logo.png" alt=""></h1>
            <nav class="gnb">
                <ul>
                    <li><a href="#"><img src="../index_markup/img/myPageImg.png" alt="" onclick="logout()"></a></li>
                    <li><button onclick="logout()">종료</button></li>
                </ul>
            </nav>
        </header>
        <section>
            <div class="content">
                <div class="myshop_header">
                    <span class="myshop_name">${res.res_name }</span>
                    
                    <input type="button" class="myshop_edit" onclick="location.href='zzim_shop_func_edit.jsp'"
                        value="정보수정">
                </div>

                <hr>
                <div class="myshop_img-contain">
                    <img class="myshop_img"
                        src="https://github.com/jeonyunhwan/zzimggong_project/blob/main/ZzimGgong/src/main/webapp/index_markup/img/shop_cafeImg.png?raw=true"
                        alt="">
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
<script type="text/javascript">

</script>

</html>