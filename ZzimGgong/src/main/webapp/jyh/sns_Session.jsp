<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="mMgr" class = "dao.MemberDao"/>
<jsp:useBean id ="mem" class = "vo.userMember"/>
<jsp:setProperty property = "*" name = "mem"/>

</head>
<body>
<c:if test ="${not empty mMgr.sessionNick(mem)}">
    <c:set var = "mem" scope = "session" value = "${mMgr.sessionNick(mem)}"></c:set>
    </c:if>
<script>
     var isFail = ${mem.email};
     if(isFail==''){
    	 alert("sns 로그인 실패");
    	 location.href = "login.jsp";
     }else if(isFail!=''){
    	 alert("로그인 성공");
    	 location.href = "index.jsp";
     }
</script>
<%
/*
String id = request.getParameter("email");
String sessionNick = mMgr.sessionNick(id);
if(sessionNick == "" || sessionNick == null){
	// 오류 
	sessionNick = "";
}else{
	session.setAttribute("nikey", sessionNick);
	response.sendRedirect("index.jsp");
}
*/
response.sendRedirect("index.jsp");
%>

</body>
</html>