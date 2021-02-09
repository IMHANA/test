package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/fullnameList")
public class FullnameListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터 값 추출 (이 작업은 파라미터 값이 있으면 하고 없으면 패스하는 작업) - input
		String fullname = req.getParameter("fullname");
		
		//2. DAO 사용해서 데이터 조회 - process
		List<EmployeeVO> list = DAO.getFullnameList(fullname);
		
		//3. 조회된 데이터 request에 저장 - process
		req.setAttribute("list", list);
		
		//4. 응답페이지로 위임처리 - output
		req.getRequestDispatcher("fullnameList.jsp").forward(req, resp);;
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
}
