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

import com.dao.ASDAO;
import com.dao.CompanyDAO;
import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

/**
 * Servlet implementation class DeleteMemberCon
 */
@WebServlet("/DeleteMemberCon")
public class DeleteMemberCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession userInfo = request.getSession();
		MemberDAO dao = new MemberDAO();
		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) { 
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		String user_id = element.getAsJsonObject().get("userId").getAsString(); 
		PrintWriter out = response.getWriter();
		int cnt = dao.delete_user(user_id);
	
		
		if(cnt > 0) {
			userInfo.removeAttribute("userInfo");
			out.print("DeleteSuccess");
		}
		else {
			out.print("DeleteFailure");
		}
	}
}
