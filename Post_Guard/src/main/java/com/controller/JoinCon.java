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
		request.setCharacterEncoding("UTF-8");

		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ����ȿ� ������ ������ ���(�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û������ ������ ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ������ �ݺ�����
			sb.append(line); // �о�µ����͸� sb(stringbuffer) �� �߰�
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ������ JSON���� ����

		String mem_id = element.getAsJsonObject().get("id").getAsString(); 
		String mem_pw = element.getAsJsonObject().get("pw").getAsString(); 
		String mem_name = element.getAsJsonObject().get("username").getAsString();
		String mem_phone = element.getAsJsonObject().get("phone").getAsString();
		String mem_email = element.getAsJsonObject().get("email").getAsString();
		String mem_addr = element.getAsJsonObject().get("addr").getAsString();
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
