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

/**
 * Servlet implementation class SocialLoginCon
 */
@WebServlet("/SocialLoginCon")
public class SocialLoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 소셜 로그인 컨트롤러입니다!
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

		String social_mem_id = element.getAsJsonObject().get("id").getAsString();
		String social_mem_name = element.getAsJsonObject().get("name").getAsString();

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.social_login(social_mem_id, social_mem_name); 

		if (vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", vo);
			out.print("socialLoginSuccess");

		} else {
			out.print("socialLoginFailure");
		}
	}

}
