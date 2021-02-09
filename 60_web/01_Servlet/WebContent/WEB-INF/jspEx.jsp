<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
	int num = 10;
	String str = "jsp";
	ArrayList<String> list = new ArrayList<String>();
	
	public void jspMethod() {
		System.out.println(" -- jspMethod() --");
	}
	
	%>

</body>
</html>