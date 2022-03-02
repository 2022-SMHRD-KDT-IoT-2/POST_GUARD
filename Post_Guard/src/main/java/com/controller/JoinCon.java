package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

// ȸ������ ��Ʈ�ѷ�
@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		//String mem_id = request.getParameter("mem_id");
		//String mem_pw = request.getParameter("mem_pw");
		//String mem_name = request.getParameter("mem_name");
		//String mem_phone = request.getParameter("mem_phone");
		//String mem_email = request.getParameter("mem_email");
		//String mem_addr = request.getParameter("mem_addr");
		
		// Join �ϴµ� ���� �ð��̶� ���� ������ ���� �ʿ䰡 ����
		// getParameter�� ����Ʈ���� �����ִ� ������ ���� �� ���
		
		
		// GSON ���̺귯���� ����Ʈ���� �����ִ� ȸ�� ��ü �޾Ƽ� DB�� �����ϴ� �ڵ� ¥�ּ���! �ʵ��Դϴ�!
		// GSON ���̺귯���� user��ü �޾Ƽ�, dao.join �Ķ���ͷ� �������ֽø� �ɰ̴ϴ�!
		// ���� getParameter ���, �޾ƿ��ø� �ɰ̴ϴ�! (����)
		// �̷��� �ϴ� ������, ����Ʈ���� �񵿱� ������� �����͸� ������, �鿣�忡�� �����ϴ� �����͸� �ٽ� �޾Ƽ�
		// �� �����͸� ���� �ٸ� ����� �����ϱ� �����Դϴ�! �鿣�� ���ֽô� �е� ������ ���ּ���!
		// �ϴٰ� ����� �� ������ ���� �����ּ���. �׻� �����ְŵ��~ - ����
		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ����ȿ� ������ ������ ���(�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û������ ������ ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ������ �ݺ�����
			sb.append(line); // �о�µ����͸� sb(stringbuffer) �� �߰�
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ������ JSON���� ����

		request.setCharacterEncoding("euc-kr");

		String mem_id = element.getAsJsonObject().get("mem_id").getAsString(); 
		String mem_pw = element.getAsJsonObject().get("mem_pw").getAsString(); 
		String mem_name = element.getAsJsonObject().get("mem_name").getAsString();
		String mem_phone = element.getAsJsonObject().get("mem_phone").getAsString();
		String mem_email = element.getAsJsonObject().get("mem_email").getAsString();
		String mem_addr = element.getAsJsonObject().get("mem_addr").getAsString();
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(mem_id, mem_pw, mem_name, mem_phone, mem_email, mem_addr);

		
		// ����Ʈ�ܿ��� ������ �̵� �����ٰſ���!!
		if (cnt > 0) {
			out.print("joinSuccess");
		} else {
			out.print("joinFailure");
		}

	}

}
