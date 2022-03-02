package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RequestDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void DB() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
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
	public int deliveryRequest(String mem_id, String dl_type, String req_type, int pin) {
		int cnt = 0;
		
		try {
			DB();
			
			String sql = "insert into t_dlrequest (member_id, dl_type, rq_type pin_code, rq_datatime, accept_time) values(?, ?, ?, ? sysdate, sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, dl_type);
			psmt.setString(3, req_type);
			psmt.setInt(4, pin);
					
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
