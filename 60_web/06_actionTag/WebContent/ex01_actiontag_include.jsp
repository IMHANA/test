<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>액션태그-include</title>
</head>
<body>
<%--
	JSP 액션태그 : JSP 페이지 흐름제어할때 사용
	사용형태 : <jsp:액션명령></jsp:액션명령>
			<jsp:액션명령 />
 --%>
	<h1>디렉티브/액션태그 - include</h1>
	<hr>
	<h2>디렉티브(지시어) - include : 복사 & 붙여넣기 형태 처리</h2>
	<h3>---ex01_includee.jsp---</h3>
	<%@ include file="ex01_includee.jsp" %>
	<h3>---ex01_includee2.jspf---</h3>
	<%@ include file="ex01_includee2.jspf" %>
	
	<%--====================================================== --%>
	<hr><hr>
	<h1>액션태그 (include : 실행결과가 삽입된다) - jsp:include</h1>
	<h3>---ex01_includee.jsp---</h3>
	<jsp:include page="ex01_includee.jsp"></jsp:include>
	<h3>---ex01_includee2.jspf---</h3>
	<jsp:include page="ex01_includee2.jspf" />
	<hr>
	
	<%request.setCharacterEncoding("UTF-8"); %>
	<h2>액션태그 - jsp:include(파라미터 전달)</h2>
	<jsp:include page="ex01_includee3_param.jsp">
		<jsp:param name="name" value="김유신" />
		<jsp:param name="age" value="27" />
		</jsp:include>
	
</body>
</html>