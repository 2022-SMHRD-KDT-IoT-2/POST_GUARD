package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

@WebServlet("/ASReplyCon")
public class ASReplyCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// AS게시판 댓글 컨트롤러입니다. 
		
		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		int as_cmt_seq = element.getAsJsonObject().get("as_cmt_seq").getAsInt();
		String as_cmt_content = element.getAsJsonObject().get("as_cmt_content").getAsString();

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("as_cmt_content");
	}

}
