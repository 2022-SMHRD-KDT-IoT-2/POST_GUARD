package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DeliveryDAO;
import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

/**
 * Servlet implementation class EnrollTrackingNumCon
 */

// 운송장 번호를 등록하는 컨트롤러 입니다.
@WebServlet("/EnrollTrackingNumCon")
public class EnrollTrackingNumCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		DeliveryDAO dao = new DeliveryDAO();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");

		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		int delivery_no = Integer.parseInt(element.getAsJsonObject().get("trackingNumber").getAsString());
		
		
		int cnt = dao.enroll_tracking_num(delivery_no, userInfo.getMem_id(), "n");

		
		// 프론트단에서 페이지 이동 시켜줄거에요!!
		if (cnt > 0) {
			out.print("NumberEnrollSuccess");
		} else {
			out.print("NumberEnrollFailure");
		}
		
	}

}
