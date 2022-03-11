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
import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class DeleteASCon
 */
@WebServlet("/DeleteASCon")
public class DeleteASCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ASDAO dao = new ASDAO();
		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) { 
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		String as_seq = element.getAsJsonObject().get("seq").getAsString(); 
		PrintWriter out = response.getWriter();
		int parsed_seq = Integer.parseInt(as_seq);
		int cnt = dao.delete_AS(parsed_seq);
	
		
		if(cnt > 0) {
			out.print("DeleteSuccess");
		}
		else {
			out.print("DeleteFailure");
		}
	}

}
