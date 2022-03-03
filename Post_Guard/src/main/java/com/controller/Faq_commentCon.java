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
		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ����ȿ� ������ ������ ���(�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û������ ������ ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ������ �ݺ�����
			sb.append(line); // �о�µ����͸� sb(stringbuffer) �� �߰�
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ������ JSON���� ����

		request.setCharacterEncoding("euc-kr");

		int cmt_seq = element.getAsJsonObject().get("cmt_seq").getAsInt(); // Ű���� id�� ������
		String cmt_content = element.getAsJsonObject().get("cmt_content").getAsString(); // Ű���� pw�� ������
		String mem_id = element.getAsJsonObject().get("mem_id").getAsString();
		
		System.out.println("��ȣ : " + cmt_seq);
		System.out.println("��� : " + cmt_content);
		System.out.println("�ۼ��� : " + mem_id);

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
