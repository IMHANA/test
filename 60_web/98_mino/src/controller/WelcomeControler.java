package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import repository.JdbcMemberRepository;
import repository.MapMemberRepository;
import repository.MemberRepository;


@WebServlet("/welcome")
public class WelcomeControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletConfig conf = this.getServletConfig();	//서블릿 환경정보
		ServletContext application = conf.getServletContext();	//서블릿에 담겨있는 정보를 얻어온다
		
		//application 얻고 users라는 map 생성
		MemberRepository repository = (MemberRepository) application.getAttribute("repository");
		
		
		if (repository == null) {
			repository = new JdbcMemberRepository();
			
			// minho 추가
			Member admin = new Member("admin", "1234");
			try {
				repository.findByMember(admin); // admin이 없으면 exception
				System.out.println("이미 admin계정이 존재합니다.");
			} catch (Exception e) {
				repository.addMember(admin);
			}
			application.setAttribute("repository", repository);
		}
		
		//세션얻기
		HttpSession session = request.getSession();
		
		Member user = (Member)session.getAttribute("user");
		
		if (user == null) {
			//로그인 된 상태 => redirect login page 이동
			System.out.println("로그인이 안되있어요");
			response.sendRedirect("login.html");
			//로그인 안된상태 => login page 이동
			
		} else {
			//로그인 안된 상태 => my page로 이동
			System.out.println("user : " + user);
			response.sendRedirect("mypage.jsp");
		}
	}
}
