<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.bc.mybatis.CommVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 삭제 요청한 데이터를 DB에서 삭제하고 
	- 삭제 후 화면전환 : 목록페이지(list.jsp)로 이동
	- 삭제 실패(댓글있는 경우) : 댓글이 있어서 삭제할 수 없다 메시지 표시하고
		상세페이지로 (view.jsp)로 이동처리--%>
<%
	System.out.println("session bvo : " + session.getAttribute("bvo"));
	//전달받은 데이터 추출 : 세션에 있는 bvo
	String b_idx = ((BBSVO)session.getAttribute("bvo")).getB_idx();
	//BBSVO bvo = (BBSVO) session.getAttribute("bvo");
	//String b_idx = bvo.getB_idx();
	
	//DB 데이터 삭제 처리s
	try {
		DAO.delete(b_idx);
		//정상삭제 처리 되었을 때
		response.sendRedirect("list.jsp?cPage=" + session.getAttribute("cPage"));
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("error.jsp");
		//response.sendRedirect("view.jsp?b_idx=" + b_idx + "&cPage=" + session.getAttribute("cPage"));
	}
%>