<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커피주문</title>
</head>
<body>
	<h1>커피주문</h1>
	<!-- <form action="ex07_resp.jsp"> -->
	<form action="실습01.jsp">
		<input type="radio" name="coffee" value="1" checked>아메리카노(3000)<br>
		<input type="radio" name="coffee" value="2">카페모카(3500)<br>
		<input type="radio" name="coffee" value="3">에스프레소(2500)<br>
		<input type="radio" name="coffee" value="4">카페라떼(4000)<br>
		<hr>
		수량 : <input type="number" name="su" size="3" value="1"><br>
		입금액 : <input type="number" name="money" size="10" value="0"><br>
		<input type="submit" value="주문처리">
	</form>
	
</body>
</html>