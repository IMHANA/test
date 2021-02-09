package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.Member;

public class JdbcMemberRepository implements MemberRepository {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER_ID = "mystudy";
	private final String USER_PW = "mystudypw";
	
	private void connect() throws SQLException {
		conn = DriverManager.getConnection(URL, USER_ID, USER_PW);
	}
	
//	public static void main(String[] args) {
//		JdbcMemberRepository jdbcMemberRepository = new JdbcMemberRepository();
//	}
	
	public JdbcMemberRepository() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 연결 성공 ");
		} catch (ClassNotFoundException e) {
			System.out.println("[예외] 드라이버 로딩 실패!!");
			e.printStackTrace();
		}
	}
	
	private void close() {
		// rs
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// pstmt
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// conn
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void addMember(Member member) {
		try {
			connect();
			
			String sql = "insert into MEMBER " +
						" VALUES(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	@Override
	public Member findByMember(Member member) throws Exception {
		try {
			connect();
			
			String sql = "select id from MEMBER " + 
						" where id = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("로그인 id : " + rs.getString(1));
				return member;
			} else {
				System.out.println("로그인 실패");
				throw new Exception("아이디 , 패스워드 확인하세요");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return null;
	}

	@Override
	public List<String> findIdAll() {
		
		List<String> list = new ArrayList<>();
		
		try {
			connect();
			
			String sql = "select id from Member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("id");
				list.add(id);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

	public Member findById(String id) {
		Member member = null;
		try {
			connect();
			String sql = "select id, password from MEMBER"
					+ " where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				String password = rs.getString("password");
				member = new Member(id, password);
			}
					
		} catch (SQLException e) {
			
		} finally {
			close();
		}
		return member;
	}
	
	
	

}
