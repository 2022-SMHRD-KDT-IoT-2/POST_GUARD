package com.controller;

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

// ȸ������ ��Ʈ�ѷ�
@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email");
		String mem_addr = request.getParameter("mem_addr");
		
		// Join �ϴµ� ���� �ð��̶� ���� ������ ���� �ʿ䰡 ����
		// getParameter�� ����Ʈ���� �����ִ� ������ ���� �� ���
		
		
		// GSON ���̺귯���� ����Ʈ���� �����ִ� ȸ�� ��ü �޾Ƽ� DB�� �����ϴ� �ڵ� ¥�ּ���! �ʵ��Դϴ�!
		// GSON ���̺귯���� user��ü �޾Ƽ�, dao.join �Ķ���ͷ� �������ֽø� �ɰ̴ϴ�!
		// ���� getParameter ���, �޾ƿ��ø� �ɰ̴ϴ�! (����)
		// �̷��� �ϴ� ������, ����Ʈ���� �񵿱� ������� �����͸� ������, �鿣�忡�� �����ϴ� �����͸� �ٽ� �޾Ƽ�
		// �� �����͸� ���� �ٸ� ����� �����ϱ� �����Դϴ�! �鿣�� ���ֽô� �е� ������ ���ּ���!
		// �ϴٰ� ����� �� ������ ���� �����ּ���. �׻� �����ְŵ��~ - ����
		
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
