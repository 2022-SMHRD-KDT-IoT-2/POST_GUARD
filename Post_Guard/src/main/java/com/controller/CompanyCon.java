package com.controller;

import java.io.BufferedReader;

// �ù�� ����ϰ� ���ִ� ��Ʈ�ѷ�

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CompanyDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;


@WebServlet("/CompanyCon")
public class CompanyCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		StringBuffer sb = new StringBuffer(); // �о�� ������ ����
		String line = null; // ����ȿ� ������ ������ ���(�ӽ�����)

		BufferedReader reader = request.getReader(); // ��û������ ������ ���
		while ((line = reader.readLine()) != null) { // ���� �����Ͱ� ������ �ݺ�����
			sb.append(line); // �о�µ����͸� sb(stringbuffer) �� �߰�
		}

		JsonParser parser = new JsonParser(); // �Ľ�(���ڿ� -> JSON)
		JsonElement element = parser.parse(sb.toString()); // ���۵����� ���ڿ��� ������ JSON���� ����

		String company_name = element.getAsJsonObject().get("companyName").getAsString(); 
		String company_addr = element.getAsJsonObject().get("companyAddr").getAsString(); 
		String company_tel = element.getAsJsonObject().get("companyTel").getAsString();
		String company_ceo = element.getAsJsonObject().get("companyCEO").getAsString();
		String company_homepage = element.getAsJsonObject().get("companyPage").getAsString();
		PrintWriter out = response.getWriter();
		
		
		int cnt = 0;
		CompanyDAO dao = new CompanyDAO();
		
		MemberVO vo = (MemberVO)session.getAttribute("userInfo");
		
		if(vo.getMem_id().equals("admin")) {
		   cnt = dao.enroll_company(company_name, company_addr, company_tel, company_ceo, company_homepage); 
		} else {
			out.print("AccessDeny");
		}
		
		if(cnt > 0) {
			out.print("EnrollSuccess");
		}
		else {
			out.print("EnrollFailure");
		}
	}

}
