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
		request.setCharacterEncoding("euc-kr");

		//String mem_id = request.getParameter("mem_id");
		//String mem_pw = request.getParameter("mem_pw");
		//String mem_name = request.getParameter("mem_name");
		//String mem_phone = request.getParameter("mem_phone");
		//String mem_email = request.getParameter("mem_email");
		//String mem_addr = request.getParameter("mem_addr");
		
		// Join 하는데 가입 시간이랑 어드민 권한을 받을 필요가 없음
		// getParameter는 프론트에서 보내주는 정보를 받을 때 사용
		
		
		// GSON 라이브러리로 프론트에서 보내주는 회원 객체 받아서 DB에 저장하는 코드 짜주세요! 필독입니다!
		// GSON 라이브러리로 user객체 받아서, dao.join 파라미터로 전달해주시면 될겁니다!
		// 위의 getParameter 대신, 받아오시면 될겁니다! (추측)
		// 이렇게 하는 이유는, 프론트에서 비동기 통신으로 데이터를 보내고, 백엔드에서 응답하는 데이터를 다시 받아서
		// 그 데이터를 토대로 다른 기능을 수행하기 위함입니다! 백엔드 해주시는 분들 수고좀 해주세요!
		// 하다가 어려운 점 있으면 갠톡 보내주세요. 항상 깨어있거든요~ - 종재
		StringBuffer sb = new StringBuffer(); // 읽어온 데이터 저장
		String line = null; // 버펑안에 데이터 읽을떼 사용(임시저장)

		BufferedReader reader = request.getReader(); // 요청데이터 읽을때 사용
		while ((line = reader.readLine()) != null) { // 읽을 데이터가 있을때 반복수행
			sb.append(line); // 읽어온데이터를 sb(stringbuffer) 에 추가
		}

		JsonParser parser = new JsonParser(); // 파싱(문자열 -> JSON)
		JsonElement element = parser.parse(sb.toString()); // 버퍼데이터 문자열로 변경후 JSON으로 변경

		request.setCharacterEncoding("euc-kr");

		String mem_id = element.getAsJsonObject().get("mem_id").getAsString(); 
		String mem_pw = element.getAsJsonObject().get("mem_pw").getAsString(); 
		String mem_name = element.getAsJsonObject().get("mem_name").getAsString();
		String mem_phone = element.getAsJsonObject().get("mem_phone").getAsString();
		String mem_email = element.getAsJsonObject().get("mem_email").getAsString();
		String mem_addr = element.getAsJsonObject().get("mem_addr").getAsString();
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
