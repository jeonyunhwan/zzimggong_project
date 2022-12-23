<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "dao.MemberDao"
    import = "vo.userMemberVo"
    errorPage =""%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">    
<%
request.setCharacterEncoding("utf-8");
MemberDao insUser = new MemberDao();
%> 
    
<%
// 입력받은 것 가져오기 
String userid = request.getParameter("uid");
String password = request.getParameter("pws");
String nickname = request.getParameter("nik");
String address1 = request.getParameter("addr");
String address2 = request.getParameter("detailaddr");
String email = request.getParameter("email");
String emails = request.getParameter("emails");

if(address2==null){
	address2="";
}

//문자열 결합 - 주소
StringBuilder sb = new StringBuilder();
sb.append(address1);
sb.append(" ");
sb.append(address2);

String address = new String(sb);

//이메일 결합 
StringBuilder eb = new StringBuilder();
eb.append(email);
eb.append(emails);

String emailq = new String(eb);

// DAO를 통해서 값 넣기 
// 성공실패여부 로직 
int check = insUser.SignUp(new userMemberVo(userid,password,emailq,nickname,address));
%>
<script type = "text/javascript">
// int 값 
const sc = <%=check%>

window.onload = function(){	
	if(sc < 0){
	alert("회원가입 등록 실패 \n 다시 입력해주세요.");
	//이전페이지로 바로 이동. 
	location.replace('signUp.jsp');
	}
	else{
	alert("회원가입 성공\n 로그인을 해주세요.");
	// 로그인 페이지로 이동 
	location.href = "login.jsp"
   } 
}
</script>
<body></body>
</html>