<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id = "mMgr" class = "dao.MemberDao"/>
<jsp:useBean id = "mem" class = "vo.userMember"/>
<jsp:setProperty property = "*" name = "mem"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String email = request.getParameter("email");
String pwd = request.getParameter("password");
%>
<%
int checkNum = mMgr.loginCheck(email, pwd);
String redirectUrl = "login.jsp";
// 로그인 성공 
if(checkNum==1){
	//db에서 닉을 받아옴.
	//세션값설정
%>
<c:if test ="${not empty mMgr.sessionNick(mem)}">
<c:set var = "mem" scope = "session" value = "${mMgr.sessionNick(mem)}"></c:set>
</c:if>
    <script type= "text/javascript">
        alert("로그인이 되었습니다.\n 즐거운 이용하세요.");
        location.href = "index.jsp";
    </script>
<% 
}else if(checkNum==0){
%>
    <script>
    alert("아이디와 비밀번호를 확인하세요.");
    location.href = "login.jsp";
    </script>
<%
	response.sendRedirect(redirectUrl);	
}else if(checkNum==-1){
%>
      <script>
      alert("아이디와 비밀번호가 없습니다. \n 회원가입을 진행하세요.");
      location.href = "signUp.jsp";
      </script>
<%
}else{
%>
      <script>
       alert("오류입니다.");
       location.href = "login.jsp";
      </script>
<%
}
%>
</body>
</html>