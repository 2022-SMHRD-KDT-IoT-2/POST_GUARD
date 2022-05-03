package com.controller;


// �Խñ۵��
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

		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ����ȿ� ������ ������ ���(�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û������ ������ ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ������ �ݺ�����
			sb.append(line); // �о�µ����͸� sb(stringbuffer) �� �߰�
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ������ JSON���� ����

		request.setCharacterEncoding("euc-kr");
		
		String article_title = element.getAsJsonObject().get("article_title").getAsString(); // Ű���� id�� ������
		String article_content = element.getAsJsonObject().get("article_content").getAsString();
		String article_file = element.getAsJsonObject().get("article_file").getAsString();
		String mem_id = element.getAsJsonObject().get("mem_id").getAsString();

		/*
		 * ���ǰ����� �޾� �� �� ������ �ϴ� �ּ�ó�� �س����Կ� 
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



