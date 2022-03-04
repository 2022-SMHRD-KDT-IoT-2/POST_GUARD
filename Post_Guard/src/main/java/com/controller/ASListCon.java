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
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

@WebServlet("/ASListCon")
public class ASListCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// AS게시판 컨트롤러입니다.

		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		String mem_id = element.getAsJsonObject().get("mem_id").getAsString();
		String as_title = element.getAsJsonObject().get("as_title").getAsString();
		String as_content = element.getAsJsonObject().get("as_content").getAsString();
		String as_file = element.getAsJsonObject().get("as_file").getAsString();
		String as_category = element.getAsJsonObject().get("as_category").getAsString();

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("t_member");

		ASDAO dao = new ASDAO();
		int cnt = dao.write_AS(as_category, as_title, as_content, as_file, mem_id, as_category);

		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			out.print("succuss");
		} else {
			out.print("fail");
		}
	}

}
