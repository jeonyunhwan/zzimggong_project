<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">

</head>
<body>
<form method = "post" action="logout.jsp">
<%=session.getAttribute("nikey")%>님
<h1>안뇽~~~</h1>
<input type = "submit" value = "logout"/>
</form>
</body>
<script type = text/javascript>
</script> 
</html>