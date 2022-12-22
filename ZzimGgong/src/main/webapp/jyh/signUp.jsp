<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="signUpCss.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }
</style>
</head>
<body>

<div class="wrapper">
    <header>
        <h1 class="logo"><img src="./img/main_logo.png" alt=""></h1>
         <nav class="gnb">
            <ul>
                <li><a href="#"><img src="./img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    <section>
        <div class="content">
            <div class ="cont_header">
                <h2 id = "s01">회원가입</h2>
            </div>
            <div class = "content_form">
                <form action ="insertMember.jsp" method = "post" onsubmit="return joinform_check()">
                    <div id = "e_form">
                    <div class="insert_form">
                        <b>아이디</b><span name = "idCheck"></span><br>
                        <input type = "text" name = "uid" maxlength="12" placeholder="영문자로 시작하는 5~13자 영문자 또는 숫자"/>
                        <button type = "button" onclick = "checkingId()">중복확인</button>             
                    </div>
                    <div class = "insert_form">
                        <b>비밀번호</b><span name = "pwCheck"></span><br>
                        <input type = "password" name = "pws" minlength="8" placeholder="(최소8자)1개 이상 숫자,문자포함 특수문자 1개 포함"/>
                        
                    </div>
                    <div class = "insert_form">
                        <b>비밀번호 재확인</b><span name = "rePwCheck"></span><br>
                        <input type = "password" name = "pwRe" placeholder="비밀번호 재설정"/>
                    </div>
                    <div class = "insert_form">
                        <b>닉네임</b><span name = "nikCheck"></span><br>
                        <input type = "text" name = "nik" placeholder="2자 이상 8자 이하 영어,숫자,한글로 구성"/>
                    </div>
                    <div class = "s_form">
                        <b>이메일</b><span name = "emailCheck"></span><br>
                        <input type = "text" name = "email" placeholder="영문자로 시작하는 5~13자 영문자 또는 숫자"/>
                        @
                        <select style ="width:150px; height:30px;"
                        name = "emails" id = "email-select">
                        <option value = "1">이메일 선택하기</option>
                        <option value = "@naver.com">naver.com</option>
                        <option value = "@gmail.com">gmail.com</option>
                        <option value = "@daum.net">daum.net</option>
                        </select>
                    </div>
                    <div class = "s_form">
                        <b>주소입력</b><span name = "addrCheck"></span><br>
                        <input id="member_post"  type="text" placeholder="Zip Code" readonly onclick="findAddr()">
                        <input id="member_addr" type="text" name = "addr" placeholder="Address" readonly> <br>
                        <input type="text" name = "detailaddr" placeholder="Detailed Address">
                    </div>
                    <div class = "insert_form01">
                            <input type = "checkbox" id = "check_all" name = "check_all" value = "1">
                            <label for = "check_all">  전체 동의</label><br>
                            <input type = "checkbox" id = "agree01"  name = "agree" value = "2">
                            <label for = "agree"><span>(필수)</span> 서비스 이용약관 동의</label><br>
                            <input type = "checkbox" id = "agree02" name = "agree" value = "3">
                            <label for = "agree"><span>(필수)</span> 개인정보 처리 방침 동의</label><br>
                            <input type = "checkbox" id = "agree03" name = "agree" value = "4">
                            <label for = "agree"><b>(선택)</b> 마케팅 메일 수신 동의</label><br>   
                    </div>
                    <div id = "sub_form">
                    <input type = "submit" id = "request01" value = "가입하기"/>
                    </div>
                </div>
                </form>
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
<script src = "event_signUp.js" type = "text/javascript"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</html>