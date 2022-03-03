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

import com.dao.Faq_commentDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;


@WebServlet("/Faq_commentCon")
public class Faq_commentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버펑안에 데이터 읽을떼 사용(임시저장)

		BufferedReader reader = request.getReader(); // 요청데이터 읽을때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을때 반복수행
			sb.append(line); // 읽어온데이터를 sb(stringbuffer) 에 추가
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경후 JSON으로 변경

		request.setCharacterEncoding("euc-kr");

		int cmt_seq = element.getAsJsonObject().get("cmt_seq").getAsInt(); // 키값이 id인 데이터
		String cmt_content = element.getAsJsonObject().get("cmt_content").getAsString(); // 키값이 pw인 데이터
		String mem_id = element.getAsJsonObject().get("mem_id").getAsString();
		
		System.out.println("번호 : " + cmt_seq);
		System.out.println("댓글 : " + cmt_content);
		System.out.println("작성자 : " + mem_id);

	/*	HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("");
	*/	
		Faq_commentDAO dao = new Faq_commentDAO();
		int cnt = dao.Faq_comment(cmt_seq, cmt_content, mem_id);
		
		PrintWriter out = response.getWriter();
		
		if(cnt > 0) {
			out.print("success");
		}
		else {
			out.print("fail");
		}
	}

}
