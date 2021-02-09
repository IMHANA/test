<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 파라미터 값(id)을 사용해서 DB데이터 삭제하고 화면이동 
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
<%
	String id = request.getParameter("id");

	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	int result = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		String sql = "DELETE FROM UNIMEMBER WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL문 실행
		//4-1. 실행시 파라미터 전달
		pstmt.setString(1, id);
		
		result = pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
		} catch(Exception e) {}
		try {
			if (conn != null) conn.close();
		} catch(SQLException e) {}
	}
	if (result == 0) { 
%>		
	<script>
		alert("[삭제실패] 대상이 없어서 삭제하지 못했습니다.");
		location.href="error.jsp";
	</script>
<%	
		return;
	}	else if (result > 0) {
%>
	<script>
		alert("[삭제완료] 삭제처리 완료");
		location.href="selectAll.jsp";
	</script>

<% 	
		return;
	}
%>	