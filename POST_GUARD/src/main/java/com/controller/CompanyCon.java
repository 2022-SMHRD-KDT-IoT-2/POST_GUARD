package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CompanyDAO;
import com.vo.PostVO;


@WebServlet("/CompanyCon")
public class CompanyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		String company_seq = request.getParameter("company_seq");
		String company_name = request.getParameter("company_name");
		String company_addr = request.getParameter("company_addr");
		String company_tel = request.getParameter("company_tel");
		String company_ceo = request.getParameter("company_ceo");
		String company_homepage = request.getParameter("company_homepage");
		
		Double companyseq1 = Double.parseDouble(company_seq);
		int cnt = 0;
		CompanyDAO dao = new CompanyDAO();
		PostVO vo = new PostVO(mem_id);
		
		if(vo.equals("admin")) {
		   cnt = dao.company(companyseq1, company_namel, company_addr, company_tel, company_ceo, company_homepage);
		}
		else {
			System.out.println("권한이 없습니다");
		}
		if(cnt > 0) {
			response.sendRedirect("");
		}
		else {
			response.sendRedirect("");
		}
	}

}
