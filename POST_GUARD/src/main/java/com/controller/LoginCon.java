package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MemberDAO;
import com.vo.MemberVO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.login(mem_id, mem_pw);

		if (vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", vo);
			
			//일단 주석처리 해놓을게여 
			// response.sendRedirect("main.jsp");
		} else {
			//response.sendRedirect("main.jsp");
		}
	}

}
