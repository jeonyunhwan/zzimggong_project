<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<jsp:useBean id="mMgr" class = "dao.MemberDao"></jsp:useBean>
</head>
<body>
<%
String id = request.getParameter("email");
String sessionNick = mMgr.sessionNick(id);
if(sessionNick == "" || sessionNick == null){
	// 오류 
	sessionNick = "";
}else{
	session.setAttribute("nikey", sessionNick);
	response.sendRedirect("index.jsp");
}

%>

</body>
</html>