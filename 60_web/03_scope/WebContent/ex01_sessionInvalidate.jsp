<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션 초기화 작업후 되돌아가기 --%>
<%
	//세션 초기화
	session.invalidate();

	//재요청처리
	response.sendRedirect("ex01_session.jsp");
%>