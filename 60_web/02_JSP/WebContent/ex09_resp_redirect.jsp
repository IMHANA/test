<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청한 웹사이트로 이동처리
	String site = request.getParameter("site");

	switch(site) {
	case "naver" : //네이버 웹페이지로 이동처리
		response.sendRedirect("http://www.naver.com");
		break;
	case "daum" : 
		response.sendRedirect("http://www.daum.net");
		break;
	case "google" :
		response.sendRedirect("http://www.google.co.kr");
	}
%>
<h1>ex09_resp_redirect.jsp</h1>