<%@page import="com.mystudy.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- DB에서 전체 데이터 조회(검색)해서 화면 출력 --%>
<%
	// SqlSession 객체 얻기
	
	//openSession(true) : auto commit 상태 (자동커밋)로 세션객체 생성(SQL실행 후 자동커밋)
	//openSession(),openSession(false) : auto commit 해제상태 (트랜잭션 필요)
	//		- insert, update, delete 작업 후 명시적으로 commit 처리가 필요하다 (자동커밋안되니까)
	SqlSession ss = null;
	
	// SqlSession selectList(mapper의 id명) : select결과 여러개인 경우 List형태로 받기
	// qlSession selectOne(mapper의 id명) : select결과가 0이거나 1인 경우 
	List<MemberVO> memberList = null;
	try {
		ss = DBService.getFactory().openSession();	//SQL세션을 받아오는 문구
		memberList = ss.selectList("selectAll");
	} catch (Exception e){
		e.printStackTrace();
	} finally {		
		ss.close();
	}
	System.out.println("memberList : " + memberList);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표준화면</title>
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>

<%@ include file="includee/menu.jspf" %>

	<hr>
	<h1>전체 데이터 검색</h1>
	<ul>
<%
	if (memberList.size() > 0) {	//데이터가 있으면
		for (MemberVO vo : memberList) {	%>
		<li>
			<%=vo.getIdx() %>	::
			<%=vo.getId() %>	::
			<%=vo.getName() %>	::
			<%=vo.getAddress() %>
		</li>
<%
		}
	} else {	//데이터가 없으면
		out.print("<li>조회(검색)된 데이터가 없습니다");
	}
%>
	</ul>
</body>
</html>
