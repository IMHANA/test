<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리다이렉트(응답)</title>
</head>
<body>
	<h1>[ ex10_resp_redirect.jsp ]</h1>
	<h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
<%
	// 재요청 처리(redirect)
	//response.sendRedirect("ex10_resp_redirect2.jsp");
	
	//전달받은 파라미터 값 전달하면서 재요청 처리
	response.sendRedirect("ex10_resp_redirect2.jsp?id=" + id + "&pwd=" + pwd);
%>
</body>
</html>