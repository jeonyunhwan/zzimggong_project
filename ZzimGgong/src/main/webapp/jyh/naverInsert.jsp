<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
    import ="vo.userMember"
    %>
<jsp:useBean id = "mMgr1" class ="dao.MemberDao"/>

<%
request.setCharacterEncoding("UTF-8");
String id = (String)request.getParameter("id");
String email = request.getParameter("email");
String nik = request.getParameter("nik");

int result = mMgr1.naverSignUp(new userMember(email,nik));
int result1 = 0;
if(result > 0){
	//토큰 아이디 db 삽입.
    result1 = mMgr1.naverTokenInsert(email, id);
    if(result1>0){
    session.setAttribute("nikey",nik);
    response.sendRedirect("index.jsp");
    }else{
    	//alert 처리해주기.
        response.sendRedirect("login.jsp");
    }
}else{
	//alert 처리 해주기. 
	response.sendRedirect("login.jsp");
}
%>