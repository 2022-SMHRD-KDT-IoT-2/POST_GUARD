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
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

/**
 * Servlet implementation class DeleteTrackingNumCon
 */
@WebServlet("/DeleteTrackingNumCon")
public class DeleteTrackingNumCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		DeliveryDAO dao = new DeliveryDAO();
		PrintWriter out = response.getWriter();

		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		String delivery_no = element.getAsJsonObject().get("seq").getAsString();
		
		
		int cnt = dao.delete_tracking_num(delivery_no);

		
		if (cnt > 0) {
			out.print("NumberEnrollSuccess");
		} else {
			out.print("NumberEnrollFailure");
		}
		
	}

}
