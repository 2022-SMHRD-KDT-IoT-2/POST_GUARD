package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.requestDAO;


// 택배사에 수거 요청 컨트롤러

@WebServlet("/requestCon")
public class requestCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. req시퀀스.. 프론트에서 받는 정보가 아니므로 삭제
		String mem_id = request.getParameter("memid");
		// 2. company시퀀스.. 마찬가지로 프론트에서 받는 정보가 아니라서 삭제함
		String deli_type = request.getParameter("delitype"); // 택배 종류
		String req_type = request.getParameter("reqtype"); // 요청 구분
		// 3. 택배접수시간 삭제.. 프론트에서 주는 정보가 아니라 관련 dao함수가 실행될 때 sysdate로 들어감!
		String pin = request.getParameter("pin");

		
		// req_seq, company_seq 받는 부분 삭제.
		// dao에서 받아와야 하는 정보
		// 변수는 남겨둠. 만약 이 두 변수를 사용할 곳이 있다면 dao에서 받아오는 방식으로 변수 초기화 바람!
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
