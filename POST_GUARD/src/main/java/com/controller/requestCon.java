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
		String memid = request.getParameter("memid");
		// 2. company������.. ���������� ����Ʈ���� �޴� ������ �ƴ϶� ������
		String rqtype = request.getParameter("reqtype");
		// 3. ��û�ð� ����.. deliveryRequest�� �̹� �������� ����Ͽ� �����͸� �ְ��ֱ⶧���� ���ʿ�..
		String pin = request.getParameter("pin");

		
		// req_seq, company_seq �޴� �κ� ����.
		// dao���� �޾ƿ;� �ϴ� ����
		// ������ ���ܵ�. dao���� �޾ƿ��� ������� ���� �ʱ�ȭ �ٶ�!
		int req_seq = 0;
		int company_seq = 0;
		int pincode = Integer.parseInt(pin);

		requestDAO dao = new requestDAO();

		int cnt = dao.deliveryRequest(req_seq, memid, company_seq, rqtype, pincode);

		if (cnt > 0) {
			response.sendRedirect("");
		} else {
			response.sendRedirect("");
		}
	}

}
