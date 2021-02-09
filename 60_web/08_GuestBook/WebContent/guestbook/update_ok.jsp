<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 데이터를 사용해서 DB데이터 수정하고 페이지 전환
	정상수정처리 : 상세페이지로 이동 (onelist.jsp)
	예외발생 : 오류발생 메세지 표시 후 상세페이지로 이동
--%>

<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*"  name="vo"/>

<%
	SqlSession ss = DBService.getFactory().openSession(true);

	try {
	ss.update("guestbook.update", vo);
%>
	<script>
		alert("수정이 완료되었습니다.")
		location.href="onelist.jsp?idx=<%=vo.getIdx() %>";
	</script>
<%
	} catch(Exception e) {	
		e.printStackTrace();
%>
	<script>
		alert("입력 처리중 예외발생")
		history.back();
	</script>
<%
	} finally {
		ss.close();
	}
%>





