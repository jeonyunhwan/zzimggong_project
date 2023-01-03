<%@page import="hds.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="jyh.model.*"
    import="hds.*"
    import="ymw.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 승인 및 거절</title>
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
        padding-bottom: 20px;

    }

    .content p{
        color: #601986;
        font-weight: 400;
        font-size: 16px;
        line-height: 50px;
    }

    .info_wrap{
        line-height: 30px;
        color: #601986;
        padding: 10px 0;
    }

    .info_wrap img{
        padding-right: 14px;
    }

    /* 버튼 디자인 */

    .btn_wrapper{
        display: flex;
        justify-content: center;
        gap: 50px;
        padding-top: 45px;
    }

    .btn{
        background-color: #601986;
        width: 94px;
        height: 43px;
        text-align: center;
        border-radius: 10px;
        line-height: 43px;
        font-weight: 400;
        font-size: 16px;
        cursor: pointer;
        color: #fff;
    }

    .btn a{
        color: #fff;
        line-height: 43px;
        font-weight: 400;
        font-size: 16px;
    }
    
    .get_font{
		color: #222;
	    font-size: 22px;
	    font-weight: 600;
    }

</style>

<script>
/*
 
 */
</script>
</head>
<body>

<jsp:useBean id="dao" class="hds.reservation_Dao"/>

<%

String user_email = "hds123@naver.com";
String resNum = "123-45-67890";
String reserve_start_time = "2023-01-05 17:00";
%>



<div class="wrapper">
<%
      memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
   %>
   <c:if test="${empty sesID }">
       <header class="head1">
           <h1 class="logo"><img src="/index_markup/img/main_logo.png" alt=""></h1>
            <nav class="gnb">
               <ul>
                   <li><a href="/jyh/views/login.jsp">로그인</a></li>
                   <li><a href="/jyh/views/insertMember.jsp">회원가입</a></li>
               </ul>
            </nav>
       </header>
    </c:if>
    <c:if test="${not empty sesID }">
       <header class="head2">
        <h1 class="logo"><img src="/index_markup/img/main_logo.png" alt=""></h1>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    </c:if>
    <section>
        <div class="content">
            <h3>예약 승인 및 거절</h3>
            <p>* 예약 신청 정보</p>
<%
for(Reservation r : dao.showApproval(user_email, reserve_start_time, resNum)) {
%>
            <div class="info_wrap">
                <img src="/index_markup/img/myPageImg.png" alt="">
                방문인원 : <span class="get_font"><%=r.getReserve_apply_person()%>명</span>
            </div>
            <div class="info_wrap">
                <img src="/index_markup/img/date_icon.png" alt="">
                방문일시 : <span class="get_font"><%=r.getReserve_start_time()%></span>
            </div>
<%
}
%>
            <div class="btn_wrapper">
                <div class="btn" id="addBtn">승인</div>
                <div class="btn" onclick="location.href='pg_1004.html'">거절</div>
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
<%--
pg1003_DB.jsp?user_email=hds123@naver.com&resNum=2023-01-05 17:00&reserve_start_time=123-45-67890전송 완료!

 --%>
<script type="text/javascript">
	var addBtnOb = document.querySelector("#addBtn");
	
	addBtnOb.onclick=function(){
		res_approval();
	}
	
	 function res_approval() {
		var qstr = "?user_email="+"<%=user_email%>"
				+"&resNum="+"<%=resNum%>"
				+"&reserve_start_time="+"<%=reserve_start_time%>";
			console.log(qstr);
			callAjax(qstr);
		}	
	 
	
	function callAjax(qstr) {
		var xhr = new XMLHttpRequest()
		xhr.open("get","pg1003_DB.jsp"+qstr, true);
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 & xhr.status==200){
				console.log("pg1003_DB.jsp"+qstr+"전송 완료!");
			}
		}
	}
</script>
</html>