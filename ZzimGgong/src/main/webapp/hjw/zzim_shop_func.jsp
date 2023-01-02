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
                <script type="text/javascript" src="./script/shop_loginJS.js"></script>
            </head>

            <body>

                <div class="wrapper">
                    <header>
                        <h1 class="logo"><img src="../index_markup/img/main_logo.png" alt=""></h1>
                        <nav class="gnb">
                            <ul>
                                <li><a href="#"><img src="../index_markup/img/myPageImg.png" alt=""
                                            onclick="logout()"></a></li>
                                <li><button onclick="logout()">종료</button></li>
                            </ul>
                        </nav>
                    </header>
                    <section>
                        <div class="content">
                            <div class="myshop_header">
                                <span class="myshop_name">${res.res_name }</span>

                                <input type="button" class="myshop_edit"
                                    onclick="location.href='zzim_shop_func_edit.jsp'" value="정보수정">
                            </div>

                            <hr>
                            <div class="myshop_img_contain">
                                <img class="myshop_img" src="${res.res_img }" alt="">
                            </div>
                            <div class="myshop_contain_info">
                                <p>가게번호 : ${res.resnum }</p>
                                <p>가게이름 : ${res.res_name }</p>
                                <p>가게이메일 : ${res.res_email }</p>
                                <p>가게주소 : ${res.res_addresss }</p>
                                <p>가게 전화번호 :${res.res_phonenum }</p>
                                <p>영업시간 : ${res.business_hours }</p>
                                <p>휴무일 : ${res.day_off }</p>
                                <p>편의시설 : ${res.convenient }</p>
                                <p>소개 : ${res.introduce }</p>
                                <p>보증금 : ${res.deposit }</p>
                                <p>등록일 : ${res.enroll_date }</p>
                                <p>웨이팅 : ${res.wating }</p>
                                <p>예약 : ${res.reservation }</p>

                                <p>Mood : ${pick.mood }</p>
                                <p>Purpose : ${pick.purpose }</p>
                                <p>FoodType : ${pick.food_type }</p>
                                <p>TableType : ${pick.table_type }</p>

                                <p>메뉴종류 : ${menu.mcategory }</p>
                                <p>메뉴이름 : ${menu.menuname }</p>
                                <p>가 격 : ${menu.price }</p>
                                <p>음식사진 : ${menu.food_img }</p>
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