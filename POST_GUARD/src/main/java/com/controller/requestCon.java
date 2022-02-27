package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.requestDAO;



@WebServlet("/requestCon")
public class requestCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reseq = request.getParameter("reseq");
		String memid = request.getParameter("memid");
		String companyseq = request.getParameter("companeyseq");
		String rqtype = request.getParameter("rqtype");
		String acceptTime = request.getParameter("acceptTime");
		String pin = request.getParameter("pin");

		Double reseq1 = Double.parseDouble(reseq);
		Double companyseq1 = Double.parseDouble(companyseq);
		int pincode = Integer.parseInt(pin);

		requestDAO dao = new requestDAO();

		int cnt = dao.request(reseq1, memid, companyseq1, rqtype, pincode);

		if (cnt > 0) {
			response.sendRedirect("");
		} else {
			response.sendRedirect("");
		}
	}

}
