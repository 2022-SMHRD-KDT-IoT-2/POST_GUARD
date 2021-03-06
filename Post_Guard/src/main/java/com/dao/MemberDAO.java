package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.vo.MemberVO;

// 유저 관련 DAO
public class MemberDAO {
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

	public int join(String mem_id, String mem_pw, String mem_name, String mem_phone, String mem_email,
			String mem_addr) {

		int cnt = 0;
		String sql = "";
		try {

			DB();
			if(mem_id.equals("admin")) {
				sql = "insert into t_member values(?, ?, ?, ?, ?, ?, sysdate, 'y')";				
			} else {
				sql = "insert into t_member values(?, ?, ?, ?, ?, ?, sysdate, 'n')";
			}
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, mem_pw);
			psmt.setString(3, mem_name);
			psmt.setString(4, mem_phone);
			psmt.setString(5, mem_email);
			psmt.setString(6, mem_addr);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 비밀번호 제외 수정
	public int update(String mem_id, String mem_name, String mem_addr, String mem_email, String mem_phone) {
		int cnt = 0;
		try {

			DB();

			String sql = "update t_member set mem_name = ?, mem_addr = ?, mem_email = ?, mem_phone = ? where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_name);
			psmt.setString(2, mem_addr);
			psmt.setString(3, mem_email);
			psmt.setString(4, mem_phone);
			psmt.setString(5, mem_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	
	// 비밀번호 수정
	public int passwordUpdate(String mem_id, String mem_pw) {
		int cnt = 0;
		try {
			DB();

			String sql = "update t_member set mem_pw = ?  where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_pw);
			psmt.setString(2, mem_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public MemberVO login(String mem_id, String mem_pw) {
		MemberVO vo = null;
		try {

			DB();

			String sql = "select * from t_member where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getMem_id = rs.getString(1);
				String getMem_pw = rs.getString(2);
				String mem_name = rs.getString(3);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String addr = rs.getString(6);

				if (mem_pw.equals(getMem_pw)) {
					vo = new MemberVO(getMem_id, getMem_pw, mem_name, phone, email, addr, false);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		// 로그인 성공 시 vo 객체 리턴
		return vo;
	}
	
	public MemberVO social_login(String mem_id, String mem_pw) {
		MemberVO vo = null;
		try {

			DB();

			String sql = "select * from t_member where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getMem_id = rs.getString(1);
				String getMem_pw = rs.getString(2);
				String mem_name = rs.getString(3);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String addr = rs.getString(6);

				if (mem_pw.equals(getMem_pw)) {
					vo = new MemberVO(getMem_id, getMem_pw, mem_name, phone, email, addr, true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		// 로그인 성공 시 vo 객체 리턴
		return vo;
	}
	
	public String return_id (String mem_id) {
		String id = "";
		try {
			DB();

			String sql = "select mem_id from t_member where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String getMem_id = rs.getString(1);
				id = getMem_id;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return id;
	}
	
	public int delete_user (String mem_id) {
		int cnt = 0;
		try {
			DB();

			String sql = "delete from t_member where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
}
