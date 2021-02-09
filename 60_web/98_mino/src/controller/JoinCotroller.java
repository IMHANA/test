package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import repository.MemberRepository;


@WebServlet("/join")
public class JoinCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		ServletContext application = this.getServletContext();
		MemberRepository repository = (MemberRepository) application.getAttribute("repository");
		
		
		if (repository.findById(id) == null) {
			repository.addMember(new Member(id, password));		
		} else {
			System.out.println("중복된 id가 존재합니다.");
		}
			
		
		// 테스트 코드
		System.out.println("repository.findIdAll(); = " + repository.findIdAll());
		
		response.sendRedirect("welcome");
		
	}
}
