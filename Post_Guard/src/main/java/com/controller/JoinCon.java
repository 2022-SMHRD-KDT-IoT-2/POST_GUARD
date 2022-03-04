package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MemberDAO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

// 회원가입 컨트롤러
@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버펑안에 데이터 읽을떼 사용(임시저장)

		BufferedReader reader = request.getReader(); // 요청데이터 읽을때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을때 반복수행
			sb.append(line); // 읽어온데이터를 sb(stringbuffer) 에 추가
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경후 JSON으로 변경

		String mem_id = element.getAsJsonObject().get("id").getAsString(); 
		String mem_pw = element.getAsJsonObject().get("pw").getAsString(); 
		String mem_name = element.getAsJsonObject().get("username").getAsString();
		String mem_phone = element.getAsJsonObject().get("phone").getAsString();
		String mem_email = element.getAsJsonObject().get("email").getAsString();
		String mem_addr = element.getAsJsonObject().get("addr").getAsString();
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(mem_id, mem_pw, mem_name, mem_phone, mem_email, mem_addr);

		
		// 프론트단에서 페이지 이동 시켜줄거에요!!
		if (cnt > 0) {
			out.print("joinSuccess");
		} else {
			out.print("joinFailure");
		}

	}

}
