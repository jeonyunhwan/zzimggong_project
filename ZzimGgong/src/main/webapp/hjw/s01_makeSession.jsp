<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import = "java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script>
/*
 
 */
</script>
</head>
<jsp:useBean id="dao" class="hjw.ZzimDao"/>
<jsp:useBean id="res" class="hjw.Restaurant"/>
<jsp:setProperty property="*" name="res"/>
<body>
   <c:if test="${not empty dao.login(res)}">
		<c:set var="res" scope="session" 
         value="${dao.login(res)}"/> 
   </c:if>
<%--
	
--%>
</body>
<script>
	var isFail='${res.resnum}'
	if(isFail==''){
	   alert("사용자코드를 입력해주세요.")
	   location.href="shop_login.jsp"
	}else if(isFail!=''){
	   alert("가게정보를 불러오는데 성공했습니다.")
	   location.href="zzim_shop.jsp?resnum=${param.resnum}"
	}
/*

 */
</script>
</html>