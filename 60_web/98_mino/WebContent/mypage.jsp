<%@page import="domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member user = (Member) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Page</title>
</head>
<body>
	<h2>접속한 유저 아이디 : <%=user.getId() %></h2>
	<!-- 유저리스트, 로그아웃 -->
	<form action="">
		<button type="button" id="user-list">user list</button>
		<button type="button" id="logout">logout</button>
		
	</form>
	<script>
		document.querySelector("#user-list").addEventListener("click", function () {
			//alert("user List");
			location.href = "user-list.jsp"
		});
		
		document.querySelector("#logout").addEventListener("click", function () {
			alert("logout");
			this.form.action = "loginController"
			this.form.method = "get";
			this.form.submit();
		});
	</script>
	
</body>
</html>