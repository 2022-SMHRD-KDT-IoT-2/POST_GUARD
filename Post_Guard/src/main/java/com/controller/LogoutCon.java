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
		
		//�α׾ƿ� 
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession userInfo = request.getSession();
		userInfo.removeAttribute("userInfo");
		
		//�ϴ� �ּ�ó�� �س����Կ�
		//response.sendRedirect("main.jsp");
		
		//....
		
		

	}

}
