<%@page import="com.bc.model.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map<k,v></h1>
	<h2>배열(Array) 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"}</p>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
%>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	
	<h2>배열(Array) 일부데이터만 사용(2,3번째 : 1, 2번 인덱스)</h2>
	<ul>
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<li>${str }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- =========== List 출력 ===================== --%>
	<%-- List 는 순서가 있어서 순서대로 특정 데이터를 가져다 쓸수있다 --%>
	<h2>List 출력</h2>
<%
	List<Integer> list = new ArrayList<Integer>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist", list);
%>
	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- =========== Set 출력 ===================== --%>
	<%-- Set 은 순서없고 중복데이터 허용 안한다 --%>
	<h2>Set 출력</h2>
<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("김유신");
	set.add("강감찬");
	set.add("을지문덕");
	set.add("을지문덕");
	pageContext.setAttribute("hset", set);
	System.out.println("set.size() : " + set.size());
	System.out.println("set.contains(\"홍길동\") : " + set.contains("홍길동"));
%>
	<p>hset.size() : ${hset.size() }</p>
	<p>hset.contains("홍길동") : ${hset.contains("홍길동") }</p>
	<ul>
	<c:forEach var="name" items="${hset }">
		<li>${name }</li>
	</c:forEach>
	</ul>
	
	<%-- =========== Map key-value 데이터 사용 ===================== --%>
	<%-- Map  순서없다 (순서있게하려면 treeMap) --%>
	<h1>Map key-value 데이터 출력</h1>
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	pageContext.setAttribute("hmap", map);
%>
	<c:forEach var="mapData" items="${hmap }">
		<p>${mapData.key } - ${mapData.value }</p>
	</c:forEach>
	
	<%-- ================================================= --%>
	<h1>VO가 저장된 List 사용</h1>
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동", "27"));
	listBean.add(new PersonVO("김유신", "30"));
	listBean.add(new PersonVO("강감찬", "40"));
	listBean.add(new PersonVO("을지문덕", "50"));
	pageContext.setAttribute("persons", listBean);
	
	for (PersonVO person : listBean) {
		System.out.println(person.getName() + " - " + person.getAge());
		//System.out.println(person);
	}
%>
	<%--(실습) persons에 있는 PersonVO의 이름, 나이 화면 출력 --%>
	<ul>
	<c:forEach var="plist" items="${persons }">
		<li>${plist.name }${plist.age }</li>
	</c:forEach>
	</ul>

</body>
</html>