package com.controller;

// �ù�� ����ϰ� ���ִ� ��Ʈ�ѷ�

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CompanyDAO;
import com.vo.MemberVO;


@WebServlet("/CompanyCon")
public class CompanyCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 1. getParameter�� ���̵� ���� ���� �ȵ�.. ���ǿ��� �����;���.. �ֳ��ϸ� �ù�� ����� �̹� �α��� �� ���¿��� �ϴ°��̱⶧����..
		// 2. ������ ����, �������� �����ͺ��̽����� ���� �߰��Ǹ� �ڵ����� �����Ǵ� ���̶�, ���� ����Ʈ���� �޾Ƽ� ����ϰų� �� �ʿ䰡 ����.
		String company_name = request.getParameter("company_name");
		String company_addr = request.getParameter("company_addr");
		String company_tel = request.getParameter("company_tel");
		String company_ceo = request.getParameter("company_ceo");
		String company_homepage = request.getParameter("company_homepage");
		
		int cnt = 0;
		CompanyDAO dao = new CompanyDAO();
		
		MemberVO vo = (MemberVO)session.getAttribute("userInfo");
		
		if(vo.getMem_id().equals("admin")) {
		   cnt = dao.enroll_company(company_name, company_addr, company_tel, company_ceo, company_homepage); 
		   // �ù�� ����� �� ������ �� �Ű������� �� �ʿ� ����. ���� : �������� ���̺��� �ڵ����� �����Ǵ� ������
		   // �� ����Ʈ���� �����⸸ �ϸ� �Ǵ� ��������, �鿣�忡�� ��� �ְų� �� �� �ʿ䰡 ���ٴ� �ǹ�
		} else {
			System.out.println("������ �����ϴ�");
		}
		if(cnt > 0) {
			response.sendRedirect("");
		}
		else {
			response.sendRedirect("");
		}
	}

}
