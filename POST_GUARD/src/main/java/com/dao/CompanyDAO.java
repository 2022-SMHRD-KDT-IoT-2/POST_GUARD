package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.CompanyVO;

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
	public ArrayList<CompanyVO> print_company() {
		ArrayList<CompanyVO> al = new ArrayList<CompanyVO>();
		try {
			DB();
			
			String sql = "select * from t_company";
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				int company_seq =rs.getInt(1);
				String company_name = rs.getString(2);
				String company_addr = rs.getString(3);
				String company_tel = rs.getString(4);
				String company_ceo = rs.getString(5);
				String company_homepage = rs.getString(6);
				
				CompanyVO vo  = new CompanyVO(company_seq, company_homepage, company_homepage, company_homepage, company_homepage, company_homepage);
				al.add(vo);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return al;
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
