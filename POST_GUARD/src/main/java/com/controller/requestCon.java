package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.requestDAO;


// �ù�翡 ���� ��û ��Ʈ�ѷ�

@WebServlet("/requestCon")
public class requestCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. req������.. ����Ʈ���� �޴� ������ �ƴϹǷ� ����
		String mem_id = request.getParameter("memid");
		// 2. company������.. ���������� ����Ʈ���� �޴� ������ �ƴ϶� ������
		String deli_type = request.getParameter("delitype"); // �ù� ����
		String req_type = request.getParameter("reqtype"); // ��û ����
		// 3. �ù������ð� ����.. ����Ʈ���� �ִ� ������ �ƴ϶� ���� dao�Լ��� ����� �� sysdate�� ��!
		String pin = request.getParameter("pin");

		
		// req_seq, company_seq �޴� �κ� ����.
		// dao���� �޾ƿ;� �ϴ� ����
		// ������ ���ܵ�. ���� �� �� ������ ����� ���� �ִٸ� dao���� �޾ƿ��� ������� ���� �ʱ�ȭ �ٶ�!
		int req_seq = 0;
		int company_seq = 0;
		
		int parsed_pin = Integer.parseInt(pin);

		requestDAO dao = new requestDAO();

		int cnt = dao.deliveryRequest(mem_id, deli_type, req_type, parsed_pin);

		if (cnt > 0) {
			response.sendRedirect("");
		} else {
			response.sendRedirect("");
		}
	}

}
