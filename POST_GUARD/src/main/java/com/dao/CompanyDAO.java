package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void DB() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu-ddns.net:1524:xe";
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
	
	public int enroll_company(String company_name, String company_addr, String company_tel, String company_ceo, String company_homepage) {
		int cnt = 0;
		
		
		try {
			DB();
			
			String sql = "insert into t_company values(?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, company_name);
			psmt.setString(2, company_addr);
			psmt.setString(3, company_tel);
			psmt.setString(4, company_ceo);
			psmt.setString(5, company_homepage);
			
			cnt = psmt.executeUpdate();
			
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
