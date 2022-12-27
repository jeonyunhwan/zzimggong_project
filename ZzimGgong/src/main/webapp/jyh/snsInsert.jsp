<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.userMember"%>
<jsp:useBean id="mMgr" class="dao.MemberDao" />


<%
request.setCharacterEncoding("UTF-8");
String id = (String)request.getParameter("uid");
String email = request.getParameter("email");
String nik = request.getParameter("nik");

int result = mMgr.kakaoSignUp(new userMember(email,nik));
int result1;
if(result > 0){ 
    result1 = mMgr.kakaoTokenInsert(email,id);
    if(result1>0){
    	session.setAttribute("nikey",nik);
    	response.sendRedirect("index.jsp");
    }else{
    	//alert 처리 
    	response.sendRedirect("login.jsp");
    }
}else{
	//alert 처리
	response.sendRedirect("login.jsp");
}
%>


