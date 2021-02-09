<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   		pageEncoding="UTF-8"%>
<%!
	//(실습) 주문한 내역에 따라 계산하고 결과를 표시
	int price = 0;
	String coffeeName = null;
	
	private static class Coffee {
		String name;
		int price;
		Coffee(String name, int price) {
			this.name = name;
			this.price = price;
		}
	}
	
	private final Map<String, Coffee> menu = new HashMap<>();
	
	{
		menu.put("1", new Coffee("아메리카노", 3000));
		menu.put("2", new Coffee("카페모카", 3500));
		menu.put("3", new Coffee("에스프레소", 2500));
		menu.put("4", new Coffee("카페라떼", 4000));
	}
%>
<%
	String value = request.getParameter("coffee");
	Coffee coffee = menu.get(value);
	
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	int totalPrice = su * coffee.price;
	int change = money - totalPrice;
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
	<h3>커피종류 : <%=coffee.name %></h3>
	<h3>단가 : <%=coffee.price %></h3>
	<h3>수량 : <%=su %></h3>
	<h3>구입금액 : <%=totalPrice %></h3>
	<h3>-------------------</h3>
	<h3>입금액 : <%=money %></h3>
	<h3>잔액 : <%=change %></h3>
	 
</body>
</html>