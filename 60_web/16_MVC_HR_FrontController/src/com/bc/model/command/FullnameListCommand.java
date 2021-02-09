package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class FullnameListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1. 파라미터 값 추출 (이 작업은 파라미터 값이 있으면 하고 없으면 패스하는 작업) - input
		String fullname = request.getParameter("fullname");
				
		//2. DAO 사용해서 데이터 조회 - process
		List<EmployeeVO> list = DAO.getFullnameList(fullname);
		
		//3. 조회된 데이터 request에 저장 - process
		request.setAttribute("list", list);
		
		return "fullnameList.jsp";
	}

}
