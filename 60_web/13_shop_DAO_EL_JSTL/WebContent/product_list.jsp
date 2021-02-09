<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 전달받은 품목코드(category) 사용해서 DB데이터 조회하고 화면표시 --%>

	<%-- DAO객체를 session 에 저장해서 사용(세션이 유지되는 동안) --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"/>
<%
	//전달받은 파라미터 값 확인(추출)
	String category = request.getParameter("category");

	//DB 데이터 조회
	//DAO 사용패턴

	List<ShopVO> list = dao.list(category);
	System.out.println("list : " + list);
	for (ShopVO vo : list) {
		System.out.println("list vo : " + vo);
	}
	
	//3. EL, JSTL에서 list 데이터 사용을 위해 scope에 등록
	pageContext.setAttribute("shop_list", list);
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제품목록</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 600px;
		margin: 30px auto 0;	/* 상 좌우 하 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px;}
	th { background-color: #ddd; }
	.red { color: red; }
</style>
</head>
<body>

	<%@ include file="common/menu.jspf" %>

	<%-- 제품목록 표시 영역 --%>
	<h1>제품목록표시영역</h1>
	<table>
		<thead>
			<tr>
				<th width="15%">제품번호</th>
				<th width="10%">이미지</th>
				<th width="20%">제품명</th>
				<th width="20%">판매가격</th>
				<th>비고</th>	<%--%지정안된 마지막거는 나머지%값을 가진다 --%>
			<tr>
		</thead>
		<tbody>
<!-- 			<tr>
				<td>품번-11</td>
				<td>
					<img src="images/pds1.jpg" width="100px" height="95px">
				</td>
				<td>제품명</td>
				<td>할인가:1150원<br>
					<span>(할인율:40%)</span>
				</td>
				<td>가격원가</td>
			</tr> -->
			<%-- 3. SQL 실행 결과 화면에 출력--%>
			<c:if test="${empty shop_list}">
			<tr>
				<td colspan='5'>현재 등록된 제품이 없습니다.
				</td>
			</tr>
			</c:if>
			
			<%-- <c:if test="${list.size() > 0 }"> --%>
			<c:if test="${not empty shop_list}">
			<c:forEach var="vo" items="${shop_list}">
			<tr>
				<td>${vo.p_num}</td>
				<td>
					<img src="images/${vo.p_image_s}" width="100px" height="95px">
				</td>
				<td>
					<a href="product_content.jsp?p_num=${vo.p_num}">${vo.p_name}</a>
				</td>
				<td>할인가 : ${vo.p_saleprice}원<br>
					<span class="red">(할인율 : ${vo.percent}%)</span>
				</td>
				<td>시중가격 : ${vo.p_price}원</td>
			</tr>
			</c:forEach> 
			</c:if>

		</tbody>
	</table>
	
</body>
</html>