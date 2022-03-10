package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DeliveryDAO;
import com.vo.DeliveryVO;
import com.vo.MemberVO;

/**
 * Servlet implementation class ArduinoCon
 */
@WebServlet("/ArduinoCon")
public class ArduinoCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DeliveryDAO dao = new DeliveryDAO();
		ArrayList<DeliveryVO> al = dao.select_all_tracking_num();
		String pin = request.getParameter("box");
		String adminPassword = "147*";

		for (int i = 0; i < al.size(); i++) {
			if (al.get(i).getDelivery_no()
					.substring(al.get(i).getDelivery_no().length() - 4, al.get(i).getDelivery_no().length())
					.equals(pin) || pin.equals(adminPassword)) {
				response.setStatus(200);
			} else {
				response.setStatus(400);
			}
		}
	}
}
