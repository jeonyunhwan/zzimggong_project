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
<body>
<div class="wrapper">
    <header>
        <a href = "#" class="logo"><img src="./img/main_logo.png" alt="#"></a>
    </header>
    <section>
        <div class="content">
            <form action="checkLogin.jsp" method="POST">
                <div class="input-box">
                    <input id="username" type="text" name="email" placeholder="이메일">
                    <label for="username">이메일</label>
                </div>
    
                <div class="input-box">
                    <input id="password" type="password" name="password" placeholder="비밀번호">
                    <label for="password">비밀번호</label>
                </div>
                <div id="forgot">
                    <div id = "s01">
                    <input type = "checkbox" name = "sVal"> 로그인 유지하기
                    <a href="#">이메일/비밀번호 찾기</a>
                </div>
                </div>
                <input type="submit" value="로그인">
            </form>
            <div id = "insert">
                <input id = "kakao" type = "button" value = "카카오톡으로 시작하기" class = "btnK01" onclick = "kakaoLogin();"/>
                <div id="naver_id_login"></div>
              <!--  <input id="naverIdLogin" type = "button" value = "페이스북으로 시작하기" class = "btnK"/> -->  
                <p id = "insert01">회원이 아니신가요? <a href = "signUp.jsp">회원가입 하러가기</a></p>
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
<!-- 네이버 로그인 sdk  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type = "text/javascript">
Kakao.init('e4257ea38bd8a9059dcbe7d97e0eaa9b'); // 카카오 javascript 인증키 
console.log(Kakao.isInitialized()); // sdk초기화여부판단

// 네이버 로그인 부분 >> 카카오 로그인 버튼 눌렀을 때 
var naver_id_login = new naver_id_login("s6PmXM2Nj4oevJcuSwpd", "http://localhost:9080/ZzimGgong/naverCallback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:9080/ZzimGgong/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();

  	

function kakaoLogin(){
    Kakao.Auth.login({
    	//카카오 로그인 성공 
    	success: function(authObj) {
			Kakao.API.request({
         	    url: '/v2/user/me',
	  			success: function(res) {
	  				// 만약 카카오 로그인이 되어있을 때 
	  				// 카카오 id를 가져옴. k는 카카오 아이디 
	  				var uid = res.id;
	  				var email = res.kakao_account.email;
	  				var nik = res.properties.nickname;
	  				var auth = 1;
	  				// 아이디 중복 체크 
	  				var xhr = new XMLHttpRequest();
	  				xhr.open("get","checkId.jsp?email="+email,true);
	  				xhr.send();
	  				// 만약 계정번호도 불러와야함. 낼 계정번호 정리해서 유효성검사 마무리하기.
	  				xhr.onreadystatechange=function(){
	  					if(xhr.readyState==4 && xhr.status==200){
	  					    var ck = JSON.parse(xhr.responseText);
	  						if(ck.chId =="kakao_auth"){
	  							 //만약 DB 아이디 설정이 있을 때 카카오 아이디가 바뀔수 있어서 
	  							 //db 값을 불러옴 ㅇㅋ? 
	  							 alert("카카오 인증되었습니다.");
	  							 loginform(email);
	  						}else if(ck.chId == "naver_auth"||ck.chId == "zzim_auth"){
	  							alert("다른 연동 계정이 있습니다.");
	  							location.href = "login.jsp";
	  						}else{
	  							alert("회원가입 실행");
	  							createHiddenLoginForm(uid,email,nik);
	  						}
	  					}
	  				}
	  			}
	  		})
	  	},
		fail: function(err) {
		  alert(JSON.stringify(err))
      },
    })
  }
  
function loginform(kakaoId){
		var frm = document.createElement('form');
		frm.setAttribute('method', 'post');
		frm.setAttribute('action', 'sns_Session.jsp');
		var hiddenInput = document.createElement('input');
		hiddenInput.setAttribute('type','hidden');
		hiddenInput.setAttribute('name','email');
		hiddenInput.setAttribute('value',kakaoId);
		frm.appendChild(hiddenInput);
		document.body.appendChild(frm);
		frm.submit();
}

// form 전달하기 위함 
function createHiddenLoginForm(kakaoId,email,nik){
	
	var frm = document.createElement('form');
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', 'snsInsert.jsp');
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','uid');
	hiddenInput.setAttribute('value',kakaoId);
	frm.appendChild(hiddenInput);
	var hiddenInput1 = document.createElement('input');
	hiddenInput1.setAttribute('type','hidden');
	hiddenInput1.setAttribute('name','email');
	hiddenInput1.setAttribute('value',email);
	frm.appendChild(hiddenInput1)
	var hiddenInput2 = document.createElement('input');
	hiddenInput2.setAttribute('type','hidden');
	hiddenInput2.setAttribute('name','nik');
	hiddenInput2.setAttribute('value',nik);
	frm.appendChild(hiddenInput2);
	document.body.appendChild(frm);
	frm.submit();
	
}
function createHiddenform(naverId,email,nik){	
	var fm = document.createElement('form');
	fm.setAttribute('method','post');
	fm.setAttribute('action','naverInsert.jsp');
	var hInput = document.createElement('input');
	hInput.setAttribute('type','hidden');
	hInput.setAttribute('name','id');
	hInput.setAttribute('value',naverId);
	fm.appendChild(hInput);
	var hInput1 = document.createElement('input');
	hInput1.setAttribute('type','hidden');
	hInput1.setAttribute('name','email');
	hInput1.setAttribute('value',email);
	fm.appendChild(hInput1)
	var hInput2 = document.createElement('input');
	hInput2.setAttribute('type','hidden');
	hInput2.setAttribute('name','nik');
	hInput2.setAttribute('value',nik);
	fm.appendChild(hInput2);
	document.body.appendChild(fm);
	fm.submit();
}
</script>
</html>