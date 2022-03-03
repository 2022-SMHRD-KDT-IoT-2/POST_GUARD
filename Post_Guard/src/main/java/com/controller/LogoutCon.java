package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutCon")
public class LogoutCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그아웃 
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession userInfo = request.getSession();
		userInfo.removeAttribute("userInfo");
		
		//일단 주석처리 해놓을게여
		//response.sendRedirect("main.jsp");
		
		//....
		
		

	}

}
