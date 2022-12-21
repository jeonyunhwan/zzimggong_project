<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "dao.MemberDao"
    import = "vo.userMemberVo"%>
   
<%
request.setCharacterEncoding("utf-8");
%>    

<%
String uids = request.getParameter("uid"); // 파라미터값 받아옴  
if(uids == null) uids = "";
MemberDao chIds = new MemberDao(); // dao 객체 연결 
%>
<!-- json을 통해서 가져옴 -->
{"chId":<%=chIds.IdCheck(uids) %>} 
