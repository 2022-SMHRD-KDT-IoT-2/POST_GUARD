package com.controller;

// 택배사 등록하게 해주는 컨트롤러

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
		// 1. getParameter로 아이디 가져 오면 안됨.. 세션에서 가져와야함.. 왜냐하면 택배사 등록은 이미 로그인 한 상태에서 하는것이기때문에..
		// 2. 시퀀스 삭제, 시퀀스는 데이터베이스에서 값이 추가되면 자동으로 생성되는 값이라서, 따로 프론트에서 받아서 등록하거나 할 필요가 없음.
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
		   // 택배사 등록할 때 시퀀스 값 매개변수로 줄 필요 없음. 이유 : 시퀀스는 테이블에서 자동으로 생성되는 데이터
		   // 즉 프론트에서 꺼내기만 하면 되는 데이터지, 백엔드에서 어디에 넣거나 해 줄 필요가 없다는 의미
		} else {
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
