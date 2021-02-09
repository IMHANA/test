package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request 객체로부터 파라미터 값 추출
		//1. getParameter(파라미터명) : 하나의 파라미터 값 추출 (사용)
		//2. getParameterValues(파라미터명) : 배열 형태 값 추출(체크박스 등)
		//3. getParameterMap() : 파라미터 값을 Map 형태로 추출
		// 기타 getParameterNames() : 파라미터명 확인시 사용
		//---------------------------------------------
		
		//request 객체로부터 파라미터 값 추출
		String name = request.getParameter("name");
		String kor = request.getParameter("kor");
		String eng = request.getParameter("eng");
		String math = request.getParameter("math");
		
		int total = Integer.parseInt(kor) + Integer.parseInt(eng) + Integer.parseInt(math);
//		double avg = ((int)(100*((double)total)/3))/100.0;
		double avgOld = Math.round(total / 3.0 * 100) / 100.0;
		double avg = total / 3.0;
		
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(math);
		
		//1. getParameter(파라미터명) : 하나의 파라미터 값 추출 (사용)
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h2>성적처리 결과</h2>");
		out.println("<table border>");
		out.println("<tr>");
		out.println("<th>이름</th>");
		out.println("<td>" + name + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>국어</th>");
		out.println("<td>" + kor + "</td>");
		out.println("</tr>");
		out.println("<th>영어</th>");
		out.println("<td>" + eng + "</td>");
		out.println("</tr>");
		out.println("<th>수학</th>");
		out.println("<td>" + math + "</td>");
		out.println("</tr>");
		out.println("<th>총점</th>");
		out.println("<td>" + total + "</td>");
		out.println("</tr>");
		out.println("<th>평균</th>");
		out.println("<td>" + String.format("%.2f", avg) + "</td>");
		out.println("</tr>");
		out.println("<th>평균 Old</th>");
		out.println("<td>" + avgOld + "</td>");
		out.println("</tr>");
		
		out.println("</table>");	
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("do Post()");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
