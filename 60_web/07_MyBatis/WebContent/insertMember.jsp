<%@page import="javax.xml.ws.Response"%>
<%@page import="sun.security.provider.certpath.ResponderId"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값(id)을 DB에 입력하고 화면이동 
	1. 파라미터 값을 MemberVO 타입의 객체(memberVO)에 저장
	2. mapper에 memberVO 전달해서 입력처리
	3. 페이지 전환
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
	<jsp:useBean id="memberVO" class="com.mystudy.mybatis.MemberVO" />
	<jsp:setProperty property="*" name="memberVO" />
	
<%
		System.out.println("memberVO : " + memberVO);

		SqlSession ss = DBService.getFactory().openSession(); //오토커밋 아닌상태

		try {
			int result = ss.insert("member.insertMember", memberVO);
			System.out.println("result : " + result);
			ss.commit();	// 명시적으로 commit 처리
			response.sendRedirect("selectAll.jsp");	//정상처리시 보내는곳
			
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
			response.sendRedirect("error.jsp");	//예외발생시 보내는곳
			
		} finally {
			System.out.println(">>> finally는 언제는 실행 !!!");
			ss.close();
		}
		System.out.println("끝!!!");
	%>