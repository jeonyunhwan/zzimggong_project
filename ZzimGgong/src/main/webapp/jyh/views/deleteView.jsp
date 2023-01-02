<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜꽁 로그인</title>
<style type = "text/css">
 .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }
</style>
<link href="login_css.css" rel="stylesheet">
</head>
<script type="text/javascript">
</script>
<body>
<div class="wrapper">
    <header>
        <a href = "#" class="logo"><img src="/views/index_markup/img/main_logo.png" alt="#"></a>
    </header>
    <section>
        <div class="content">
            <form action="/loginController" method="POST" onsubmit= "return userLoginCheck()">
                <div class="input-box">
                    <input id="username" type="text" name="email" placeholder="이메일">
                    <label for="username">이메일</label>
                </div>
    
                <div class="input-box">
                    <input id="username" type="text" name="reEmail" placeholder="이메일 재입력">
                    <label for="username">이메일 재입력</label>
                </div>
                
                <input type="submit" value="삭제 하기">
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
</html>