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

import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.vo.MemberVO;

// 회원정보 수정을 위한 컨트롤러
@WebServlet("/EditCon")
public class EditCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");
		MemberVO vo = null;
		request.setCharacterEncoding("UTF-8");

		StringBuffer sb = new StringBuffer();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());

		MemberDAO dao = new MemberDAO();

		String mem_id = userInfo.getMem_id();
		String mem_pw = userInfo.getMem_pw();
		String mem_name = element.getAsJsonObject().get("username").getAsString();
		String mem_addr = element.getAsJsonObject().get("addr").getAsString();
		String mem_email = element.getAsJsonObject().get("email").getAsString();
		String mem_phone = element.getAsJsonObject().get("phone").getAsString();
		// update 해주는거 작성
		int cnt = dao.update(mem_id, mem_name, mem_addr, mem_email, mem_phone);
		
		if(cnt > 0) {
			vo = new MemberVO(mem_id, mem_pw, mem_name, mem_phone, mem_email, mem_addr);
			session.setAttribute("userInfo", vo);
			out.print("updateSuccess");
		} else {
			out.print("updateFailure");
		}
	}

}
