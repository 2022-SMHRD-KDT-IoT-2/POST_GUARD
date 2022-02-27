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

import com.dao.MemberDAO;


// 유저 정보를 수정하는 컨트롤러
@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String getid = request.getParameter("mem_id");
		String getpw = request.getParameter("mem_pw");
		String getphone = request.getParameter("mem_phone");
		String getemail = request.getParameter("mem_email");
		String getaddr = request.getParameter("mem_addr");

		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(getpw, getphone, getemail, getaddr, getid);

		if (cnt > 0) {
			response.sendRedirect("");
		} else {
			response.sendRedirect("");
		}
	}

}
