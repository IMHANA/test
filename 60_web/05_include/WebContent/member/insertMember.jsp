<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 파라미터 값(id)을 DB에 입력하고 화면이동 
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
<%
	// 1. 전달받은 데이터(파라미터) 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");

	//DB 연동 프로그램 작성
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);

		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);

		String sql = "" 
				+ "INSERT INTO UNIMEMBER " 
				+ " (IDX, ID, PWD, NAME, AGE, ADDRESS, REG) "
				+ " VALUES (UNIMEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE) "; 

		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, address);

		//4. SQL 실행
		pstmt.executeUpdate();
		
		// 정상입력 처리된 경우
		response.sendRedirect("selectAll.jsp");
		
	} catch (Exception e) {
		//e.printStackTrace();
		//try구문 실행 중 예외발생
		response.sendRedirect("erorr.jsp");
	} finally {
		//6. 사용자원 반납(close)
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>



<%!
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	private int insert(String id, String pw, String name, int age, String address){

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
			String sql = "" 
					+ " INSERT INTO UNIMEMBER" 
					+ " ( IDX, ID, PWD, NAME, AGE, ADDRESS, REG)" 
					+ " VALUES (UNIMEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";

			pstmt = conn.prepareStatement(sql);

			//4. SQL 실행
			//4-1. 실행시 파라미터 전달
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setInt(4, age);
			pstmt.setString(5, address);

			result = pstmt.executeUpdate();

			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}%>
