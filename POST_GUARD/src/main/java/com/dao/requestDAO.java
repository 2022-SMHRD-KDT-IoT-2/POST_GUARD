package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class requestDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void DB() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbid = "campus_d_5_0216";
			String dbpw = "smhrd5";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	// 그냥 request 라는 이름을 붙이면 어떤걸 요청하는지 식별하기 어려움이 있다.
	// 따라서 함수 명 변경 (request -> deliveryRequest)
	public int deliveryRequest(int req_seq, String mem_id, int company_seq, String req_type, int pin) {
		int cnt = 0;
		
		try {
			DB();
			
			String sql = "insert into t_dlrequest values(?, ?, ?, ?, sysdate, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, req_seq);
			psmt.setString(2, mem_id);
			psmt.setDouble(3, company_seq);
			psmt.setString(4, req_type);
			psmt.setInt(5, pin);
					
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
}
