<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                        <div class="myshop_contain_info">
                                            <p class="myshop_info_smallHead">영업정보</p>
                                            <div class="myshop_edit_myshop">
                                                <div class="myshop_edit_myshop_left">
                                                    <p>가게이름</p>
                                                    <p>가게이메일</p>
                                                    <p>가게주소</p>
                                                    <p>가게 전화번호</p>
                                                    <p>영업시간</p>
                                                    <p>휴무일</p>
                                                    <p>편의시설</p>
                                                    <p>소개</p>
                                                    <p>보증금</p>
                                                    <p>등록일</p>
                                                    <p>웨이팅</p>
                                                    <p>즉시예약</p>
                                                </div>
                                                <div class="myshop_edit_myshop_right">
                                                    <p>: <input type="text" value="${res.res_name }"></p>
                                                    <p>: <input type="text" value="${res.res_email }"></p>
                                                    <p>: <input type="text" value="${res.res_addresss }"></p>
                                                    <p>: <input type="text" value="${res.res_phonenum }"></p>
                                                    <p>: <input type="text" value="${res.business_hours }"></p>
                                                    <p>: <input type="text" value="${res.day_off }"></p>
                                                    <p>: <input type="text" value="${res.convenient }"></p>
                                                    <p>: <input type="text" value="${res.introduce }"></p>
                                                    <p>: <input type="text" value="${res.deposit }원"></p>
                                                    <p>: <input type="text" value="${res.enroll_dateS }"></p>
                                                    <p>: <input type="text" value="${res.wating }"></p>
                                                    <p>: <input type="text" value="${res.reservation }"></p>
                                                </div>
                                            </div>


                                            <p class="myshop_info_smallHead">매장픽</p>
                                            <div class="pick_wrapper">
                                                <c:set var="moodArr" value="${fn:split(pick.mood,'/') }" />
                                                <c:forEach var="moodL" items="${moodArr}">
                                                    <span class="pick_span">${moodL}</span>
                                                </c:forEach>
                                                <span class="pick_span">${pick.purpose }</span>
                                                <span class="pick_span">${pick.food_type }</span>
                                                <span class="pick_span">${pick.table_type }</span>
                                            </div>
                                            <p class="myshop_info_smallHead">메뉴</p>
                                            <p>메뉴종류 : ${menu.mcategory }</p>

                                            <c:set var="menuArr" value="${fn:split(menu.menuname,'/') }" />
                                            <c:set var="priceArr" value="${fn:split(menu.price,'/') }" />
                                            <c:forEach var="i" begin="0" end="${fn:length(menuArr)-1 }">
                                                <div class="shop_menu_contain">
                                                    <div class="shop_menu_contain_left">
                                                        <p class="shop_menu_contain_p">${menuArr[i]}</p>
                                                        <p class="shop_menu_contain_p">${priceArr[i]} 원</p>

                                                    </div>
                                                    <div class="shop_menu_contain_right">
                                                        <img class="shop_menu_img" src="${menu.food_img }">
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="pick_contain">
                                            <label class="pick_label" for="pick1">아늑<input type="checkbox"
                                                    id="pick1"></label>
                                            <label class="pick_label" for="pick2">데이트<input type="checkbox"
                                                    id="pick2"></label>
                                            <label class="pick_label" for="pick3">파티<input type="checkbox"
                                                    id="pick3"></label>
                                            <label class="pick_label" for="pick4">일식<input type="checkbox"
                                                    id="pick4"></label>
                                            <label class="pick_label" for="pick5">양식<input type="checkbox"
                                                    id="pick5"></label>
                                            <label class="pick_label" for="pick6">중식<input type="checkbox"
                                                    id="pick6"></label>
                                            <input class="upload" type="submit" value="저장">
                                            <input type="text" value="${res.res_name }" />
                                        </div>
                                        <input type="checkbox">gd
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
                        function is_checked() {

                            // 1. checkbox element를 찾습니다.
                            const checkbox = document.getElementById('pick3');
                            // 2. checked 속성을 체크합니다.
                            const is_checked = checkbox.checked;
                            // 3. 결과를 출력합니다.
                            document.getElementById('result').innerText = is_checked;

                        }


                        var pickAll = document.querySelectorAll(".pick_label");
                        pickAll.forEach(function (pickAll) {
                            pickAll.onclick = function () {
                                this.style.background = "#995dbb"
                                this.style.color = "#f2ebf5"
                                const checkbox = document.getElementById('pick3');
                                const is_checked = checkbox.checked;
                                console.log(is_checked)
                            }
                        })
                    </script>

                    </html>