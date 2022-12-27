<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="dao.MemberDao"
    import="vo.userMemberVo"
    import="java.io.PrintWriter"%>
<jsp:useBean id = "mMgr" class = "dao.MemberDao"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>

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
	String nik = mMgr.sessionNick(email);
	//세션값설정
	session.setAttribute("nikey",nik);
%>
<script>alert("로그인 성공 메인페이지로 이동합니다.")</script>	
<% 	
	response.sendRedirect("index.jsp");
}else if(checkNum==0){
%>
<script>alert("아이디와 비밀번호를 확인하세요.")</script>
<% 
	response.sendRedirect(redirectUrl);	
}else if(checkNum==-1){
%>
<script>alert("아이디와 비밀번호가 없습니다.\n 회원가입을 진행하세요.")</script>
<% 
	response.sendRedirect("signUp.jsp");
}else{
%>
<script>alert("오류입니다.");</script>
<% 
}
%>

</html>