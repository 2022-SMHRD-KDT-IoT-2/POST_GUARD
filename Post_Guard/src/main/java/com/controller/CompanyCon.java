package com.controller;

import java.io.BufferedReader;

// 택배사 등록하게 해주는 컨트롤러

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
		
		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버펑안에 데이터 읽을떼 사용(임시저장)

		BufferedReader reader = request.getReader(); // 요청데이터 읽을때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을때 반복수행
			sb.append(line); // 읽어온데이터를 sb(stringbuffer) 에 추가
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경후 JSON으로 변경

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
