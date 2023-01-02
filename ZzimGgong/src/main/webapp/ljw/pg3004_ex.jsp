<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="../index_markup/reset.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        
        /* 지원 -추가*/
        position:relative;
        background-color: #797B84; 
    }
    
    /* 지원 */
    .content_in{
    	width:100%;
    	height:499px;
    	border-radius:45px 45px 0px 0px;
    	background-color:#fff;
    	position:absolute;
    	bottom:0px;
    }
    .rmt_info{
    	display:flex;
    	justify-content: center; /* 가운데정렬 */
    	padding-top:120px;
    	color:#61188B;
    	font-size:16px;
    }
	.rmt_info h3{
		padding:5px 0 17px;
		font-size:25px;
	}
	
	.rmt_cnt_wrapper{
		display:flex;
    	justify-content: center; /* 가운데정렬 */
    	gap:13px;
 
	}
	.rmt_cnt_wrapper img{
		width:30px;
		height:30px;
		line-height:40px;
		margin-top: 5px;
		
	}
	.rmt_cnt_wrapper input{
        border: 2px solid #601986;
        border-radius: 16px;
        width: 180px;
        height: 43px;
        text-align: center;
        display: block;
        font-size: 20px;
	}
	.rmt_wt{
		display: flex;
		justify-content: center; 
    	padding-top: 60px;
    	padding-bottom: 20px;
    	font-size: 20px;
    	color: #333;
    }
	.rmt_confirm {
   		display:flex;
   		justify-content:center;
   		color:#fff;
	    background-color:#601986;
	    border-radius:5px;
	    font-size:25px;
	    font-weight:900;
	    width:80%;
	    margin:0px auto;
	    line-height:45px; 
   }

</style>
</head>
<body>

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
        <div class="content_in">
        
 			<div id="exbutton">원격줄서기</div>
   		        
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
	
	<%-- DB로딩 --%>
	<jsp:useBean id="dao" class="ljw.WaitingDao"/>
	<jsp:useBean id="wcount" class="vo.Waiting"/>
	<jsp:setProperty property="*" name="wcount"/>
	
	<%--
	<c:if test="${empty param.wstarttimeS }">${wcount.setWstarttimeS("23/01/06") }</c:if>
	<c:if test="${empty param.resnum }">${wcount.setResnum("123-45-67895") }</c:if>
	 --%>
	
	<c:set var="bfwc" scope="session" value="${dao.countWaiting(wcount) }"/>
	<%-- <h2>${bfwc.wstarttimeS}</h2>  --%>
	<h2>${bfwc.resnum}</h2> 
	<%-- <h2>${bfwc.countResnum}</h2> --%>
</body>
<script>
	var exbtOb = document.querySelector("#exbutton");
	
	exbtOb.addEventListener("click", function(){
		
		//var wstrtime ='${bfwc.wstarttimeS}'
		//var rsnum ='${bfwc.resnum}'
		
		//var wc ='${bfwc.countResnum}';
		
		//if(wstrtime=='23/01/06'&&rsnum=='123-45-67895'){
			var result = confirm("예상대기시간/t"+(5+wc*5)+"분/n원격줄서기를 신청하시겠습니까?")
			if(result==true){
				location.href="../ljw/pg3004.jsp";
			}
		//}
	})
</script>
</html>