package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PostDAO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String getid = request.getParameter("mem_id");
		String getpw = request.getParameter("mem_pw");
		String getname = request.getParameter("mem_name");
		String getphone = request.getParameter("mem_phone");
		String getemail = request.getParameter("mem_email");
		String getaddr = request.getParameter("mem_addr");
		String getjoindate = request.getParameter("mem_joindate");
		String getadmin = request.getParameter("admin_yesno");

		PostDAO dao = new PostDAO();
		int cnt = dao.join(getid, getpw, getname, getphone, getemail, getaddr, getjoindate, getadmin);

		if (cnt > 0) {
			response.sendRedirect("");
		} else {
			response.sendRedirect("");
		}

	}

}
