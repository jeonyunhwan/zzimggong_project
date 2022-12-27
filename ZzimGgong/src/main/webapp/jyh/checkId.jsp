<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "dao.MemberDao"
    import = "vo.userMemberVo"%>
   
<%
request.setCharacterEncoding("utf-8");
%>    
<%
String email = request.getParameter("email"); // 파라미터값 받아옴  
if(email == null) email = "";
MemberDao chIds = new MemberDao(); // dao 객체 연결 
%>
{"chId":"<%=chIds.IdCheck(email) %>"} 
