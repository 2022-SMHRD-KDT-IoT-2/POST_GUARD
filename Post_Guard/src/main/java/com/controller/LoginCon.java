package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// login 컨트롤러입니다.
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");

		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		String mem_id = element.getAsJsonObject().get("id").getAsString();
		String mem_pw = element.getAsJsonObject().get("pw").getAsString();

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.login(mem_id, mem_pw);

		if (vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", vo);
			out.print("loginSuccess");
			
		} else {
			out.print("loginFailure");
		}
	}

}