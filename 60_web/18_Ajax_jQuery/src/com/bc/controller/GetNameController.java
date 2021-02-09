package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getIdName")
public class GetNameController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(">> id: " + id + ", pwd: " + pwd);
		
		//DB연동해서 로그인 확인 후 성공시 아이디와 이름을 JSON형태로 만들어서 RETURN
		//JSON 형태 값으로 응답 처리
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//{"id":"admin", "name":"관리자"}
		String result = "{\"id\":\"admin\", \"name\":\"관리자\"}";
		// 저 관리자 라던지 name은 이름 바꾸기 나름
		out.print(result);
	}
}
