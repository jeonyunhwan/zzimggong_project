<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hds.*"
   %>

<jsp:useBean id="dao" class="hds.reservation_Dao"/>

<%

String cnt = request.getParameter("reserve_apply_person");
String startTime = request.getParameter("reserve_start_time");
String requNote = request.getParameter("reserve_request");

int intCnt = Integer.parseInt(cnt);

dao.res_insert("hds123@naver.com", "123-45-67890", intCnt, startTime, requNote);

%>
<%--

?reserve_apply_person=3&reserve_start_time=2022-12-28 15:30&reserve_request=ssss

	pstmt.setString(1, user_email);
	pstmt.setString(2, resNum);
	pstmt.setInt(3, reserve_apply_person);
	pstmt.setString(4, reserve_start_time);
	pstmt.setString(5, reserve_request);
	
"?reserve_apply_person="+resCntVal+"&reserve_start_time="+resDateVal+" "+resTimeVal+"&reserve_request="+addReqVal;
			
 --%>