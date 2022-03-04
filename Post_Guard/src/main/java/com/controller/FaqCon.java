package com.controller;


// 게시글등록
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import com.dao.FaqDAO;

import com.vo.MemberVO;

@WebServlet("/FaqCon")
public class FaqCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버펑안에 데이터 읽을떼 사용(임시저장)

		BufferedReader reader = request.getReader(); // 요청데이터 읽을때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을때 반복수행
			sb.append(line); // 읽어온데이터를 sb(stringbuffer) 에 추가
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경후 JSON으로 변경

		request.setCharacterEncoding("euc-kr");
		
		String article_title = element.getAsJsonObject().get("article_title").getAsString(); // 키값이 id인 데이터
		String article_content = element.getAsJsonObject().get("article_content").getAsString();
		String article_file = element.getAsJsonObject().get("article_file").getAsString();
		String mem_id = element.getAsJsonObject().get("mem_id").getAsString();

		/*
		 * 세션값으로 받아 올 수 있으니 일단 주석처리 해놓을게요 
		 * HttpSession session = request.getSession();
		 * MemberVO vo = (MemberVO)session.getAttribute("t_member");
		 */
		FaqDAO dao = new FaqDAO();
		int cnt = dao.write_FAQ(article_title, article_content, article_file, mem_id);

		PrintWriter out = response.getWriter();

		if (cnt > 0) {
			out.print("success");
			response.sendRedirect("faq.jsp");
		}

		else {
			out.print("fail");
			response.sendRedirect("faq.jsp");
		}

	}

}



