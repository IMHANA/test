<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 선택된 데이터 삭제 처리 (파라미터 pwd 값과 session 데이터 사용)
	전달받은 파라미터 pwd와 session에 저장된 vo객체의 pwd값과 비교해서
	일치하면 : 삭제 후 목록페이지로 이동 (삭제완료 메시지 표시)
	불일치하면 : 이전페이지로 이동
--%>
<%
	//0. 한글처리 encoding 설정
	request.setCharacterEncoding("UTF-8");

	String pwd = request.getParameter("pwd");
	
	//세션에 저장된 vo객체 확인
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
	System.out.println("delete_ok session vo : " + vo);
	
	//암호 일치여부 확인
	if(!pwd.equals(vo.getPwd())) { //암호가 같지 않을 경우
%>
	<script>
		alert("암호 불일치, 암호를 확인하세요");
		history.back();
	</script>
<%		
		return;
	} 
	// 암호 일치하는 경우 : 삭제처리
	SqlSession ss = DBService.getFactory().openSession(true);
	try {
		int result = ss.delete("guestbook.delete", Integer.valueOf(vo.getIdx()));
%>
	<script>
		alert("삭제되었습니다. 목록페이지로 이동");
		location.href = "list.jsp";
	</script>

<%
	} catch(Exception e) {
		e.printStackTrace();
%>

	
%>
<script>
	alert("[예외발생]삭제 실패");
	history.go(-1);
</script>
<%
	} finally {
		ss.close();
	}
%>