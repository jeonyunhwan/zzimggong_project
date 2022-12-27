<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.userMember"
	import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="mMgr" class="dao.MemberDao" />
<jsp:useBean id="mem" class= "vo.userMember"/>
<jsp:setProperty property = "*" name = "mem"/>

<%
request.setCharacterEncoding("UTF-8");
String id = (String)request.getParameter("uid");
String email = request.getParameter("email");
String nik = request.getParameter("nik");

int result = mMgr.kakaoSignUp(new userMember(email,nik));
int result1;
//등록성공 user 테이블 
if(result > 0){ 
	//토큰 테이블 등록성공
    result1 = mMgr.kakaoTokenInsert(email,id);
    if(result1>0){
%>
       <c:if test ="${not empty mMgr.sessionNick(mem)}">
    <c:set var = "mem" scope = "session" value = "${mMgr.sessionNick(mem)}"></c:set>
    </c:if>
    
    <script type = "text/javascript">
            alert("회원가입성공하셨습니다.\n메인페이지로 이동합니다.");
            location.href = "index.jsp";
    </script>
<% 
    }else{
%>
     <script type = "text/javascript">
            alert("회원가입성공하셨습니다.\n메인페이지로 이동합니다.");
            location.href = "index.jsp";
    </script>
<% 
    }
}else{
%>
     <script type = "text/javascript">
            alert("회원가입 실패\n동의화면에서 필수동의 체크후에 이용해주세요.");
            location.href = "login.jsp";
     </script>
<% 	
   }

%>


