<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
	import="ymw.*"
    import="jyh.model.*"
    import="hds.*"
    import="hjw.*"
    import="ljw.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/index_markup/reset.css">
<style type="text/css">
	
	
    /* ㅇㅇ */
    .content{
        width: 100%;
        background-color: #fff;
        padding: 20px 0 45px 20px;
    }

    .content h3{
        font-weight: 600;
        font-size: 24px;
        line-height: 18px;
        color: #601986;
        line-height: 30px;
    }

    .content p{
        color: #601986;
        font-weight: 400;
        font-size: 16px;
        line-height: 50px;
    }

    [type="submit"]{
        width: 94px;
        height: 48px;
        background: #601986;
        border-radius: 10px;
        border: none;
        font-weight: 500;
        font-size: 20px;
        line-height: 18px;
        color: #FFFFFF;
        font-family: inherit;
        display: block;
        margin: auto;
        margin: 20px auto 0;
        cursor: pointer;
    }

    select{
        width: 320px; 
        padding: 10px 7px; 
        border: 1px solid #601986;
        border-radius: 10px;
        font-family: inherit;  
        background: url('../index_markup/img/select_arrow.png') no-repeat 95% 50%; 
        -webkit-appearance: none; 
        -moz-appearance: none;
        appearance: none;
        font-size: 20px;
        margin: 20px auto 0;
        display: block;
    }

</style>
</head>
<body>
<jsp:useBean id="dao" class="hds.reservation_Dao"/>


<div class="wrapper">
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
            <h3>예약 거절 사유 선택</h3>
            <p>
                예약 거절 사유를 선택창에서 고른 후,
                확인 버튼을 눌러 주세요.
            </p>
            <form>
                <select name="deny" id="deny">
                    <option value="deny01">매장 휴무일</option>
                    <option value="deny02">이미 예약 완료된 일시</option>
                    <option value="deny03">재료 소진</option>
                    <option value="deny04">요청사항 반영이 어려움</option>
                    <option value="deny05">기타사유 - 매장으로 직접 문의</option>
                </select><br>
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
<script>
/*

 */
</script>
</html>