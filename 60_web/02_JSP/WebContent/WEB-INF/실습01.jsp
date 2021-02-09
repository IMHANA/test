<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//(실습) 주문한 내역에 따라 계산하고 결과를 표시
	// 1. 주문확인 (파라미터 값 추출) input
	String coffee = request.getParameter("coffee");
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));

	// 2. 계산처리 processing
	if ("1".equals(coffee)) {
		System.out.println(coffee + " : 아메리카노, 3000원" );
		
	}
	
	// 3. 결과출력 output
	
%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 계산 결과</title>
</head>
<body>
	<h2>주문 계산 결과</h2>
	<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원 (단가 * 수량)
	-----------------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
	--%>

	 

</body>
</html>