<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

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

            <body style="background-color: #eeee;">
                <div class="wrapper" style="padding-top:11%;">
                    <header>
                        <h1 class="logo"><img src="../index_markup/img/main_logo.png" alt=""></h1>
                        <nav class="gnb">
                            <ul>
                                <li><a href="#"><img src="../index_markup/img/myPageImg.png" alt=""></a></li>
                            </ul>
                        </nav>
                    </header>
                    <section>
                        <div class="content">
                            <c:remove var="mem" scope="session" />
                            <form action="s01_makeSession.jsp" style="text-align: center; padding-top: 80px;">
                                <p>사용자코드 입력</p>
                                <input type="text" name="resnum">
                                <input type="submit" value="확인">
                            </form>
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