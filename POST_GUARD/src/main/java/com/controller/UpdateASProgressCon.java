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
import com.dao.DeliveryDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

@WebServlet("/UpdateASProgressCon")
public class UpdateASProgressCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ASDAO dao = new ASDAO();
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		String as_seq = element.getAsJsonObject().get("seq").getAsString();
		String as_progress = element.getAsJsonObject().get("progress").getAsString();

		int parsed_seq = Integer.parseInt(as_seq);

		int cnt = dao.update_AS_progress(parsed_seq, as_progress);

		if (cnt > 0) {
			out.print("updateSuccess");
		} else {
			out.print("updateFailure");
		}
	}
}
