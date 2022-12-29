<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hds.*"
   %>

<jsp:useBean id="dao" class="hds.reservation_Dao"/>
{"test":${dao.res_insert("test@email.com", "테스트-사업자번호", param.reserve_apply_person, reserve_start_time, reserve_request)}}

<%--
	pstmt.setString(1, user_email);
	pstmt.setString(2, resNum);
	pstmt.setInt(3, reserve_apply_person);
	pstmt.setString(4, reserve_start_time);
	pstmt.setString(5, reserve_request);
	
"?reserve_apply_person="+resCntVal+"&reserve_start_time="+resDateVal+" "+resTimeVal+"&reserve_request="+addReqVal;
			
 --%>