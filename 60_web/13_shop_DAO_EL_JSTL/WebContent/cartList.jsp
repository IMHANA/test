<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 장바구니 (cart)에 있는 제품목록을 화면에 표시 --%>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session" />

<%
	SqlSession ss = DBService.getFactory().openSession();

	//카트에서 목록 꺼내기
	List<ShopVO> list = cart.getList();
	
	//3. EL, JSTL에서 list 데이터 사용을 위해 scope에 등록
	pageContext.setAttribute("attr_list", list);
	

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니(cart)</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 600px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #ddd; }
	.red { color: red; }
	
	.title { width: 30%; }
	tfoot { text-align: center; height: 3em; font-size: 1.5em; font-weight: bold; }
</style>
</head>
<body>
	<%@ include file="common/menu.jspf" %>
	
	<%-- 카트내용 표시 --%>
	<table>
		<thead>
			<tr>
				<td colspan="6">::장바구니 내용</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%-- 3. SQL 실행 결과 화면에 출력--%>
			<c:if test="${empty attr_list}">
			<tr>
				<td colspan="6">장바구니가 비었습니다</td>
			</tr>
			</c:if>
		
			<c:if test="${not empty attr_list}">
			<c:forEach var="vo" items="${attr_list}">
			<tr>
				<td>${vo.p_num}</td>
				<td>${vo.p_name}</td>
				<td>정가:${vo.p_price}원
					<span class="red">세일가격:${vo.p_saleprice}원</span>
				</td>
				<td>
					<form action="editQuent.jsp" method="get">
						<input type="number" name="su" size="3" value="${vo.quant}">
						<input type="submit" value="수 정">
						<input type="hidden" name="p_num" value="${vo.p_num}">
					</form>
				</td>
				<td>${vo.totalprice}</td>
				<td>
					<input type="button" value="삭제" onclick='delProduct("${vo.p_num}")'>
				</td>
			</tr>
			</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">총 결제금액 : ${cart.total}</td>
			</tr>
		</tfoot>
	</table>
<script>
	function delProduct(pNum) {
		/* alert("pNum : -" + pNum + "-"); */
		location.href = "delProduct.jsp?p_num=" + pNum;
	}
</script>
	 
</body>
</html>






