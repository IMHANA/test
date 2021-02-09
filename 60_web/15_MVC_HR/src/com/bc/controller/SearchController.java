package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/search")
public class SearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">doGet 실행! ");
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println(">idx : " + idx + ">keyword : " + keyword);
		
		//if (keyword == null || keyword.length > 1) {	//keyword에 빈문자열이 들어왔냐
		
		if (keyword == null || keyword.equals("")) {	//keyword에 빈문자열이 들어왔냐
			// search.jsp로 이동
			request.getRequestDispatcher("search.jsp").forward(request, response);
		
		} else {	//검색값이 입력되었음 - DB에서 검색처리
			List<EmployeeVO> list = DAO.getSearch(idx, keyword);
			System.out.println(">> 동적검색결과 list : " + list);
			
			//동적 검색 형태 확인
			String title = "";
			switch (idx) {
				case "0" : title = "사번"; break;
				case "1" : title = "이름"; break;
				case "2" : title = "직종"; break;
				case "3" : title = "부서"; break;
			}
			
			//동적검색 결과를 응답페이지로 전달하기
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			
			//응답 페이지로 이동(searchList.jsp)
			request.getRequestDispatcher("searchList.jsp").forward(request, response);;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
