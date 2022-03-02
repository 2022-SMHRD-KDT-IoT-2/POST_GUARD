package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.FaqVO;
import com.vo.MemberVO;

public class FaqDAO {

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

	public int write_FAQ(String article_title, String article_content, String article_file, String mem_id) {
		int cnt = 0;

		try {
			DB();

			String sql = "insert into t_faq values(article_seq.nextval, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, article_title);
			psmt.setString(2, article_content);
			psmt.setString(3, article_file);
			psmt.setString(4, mem_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<FaqVO> getList() {
		ArrayList<FaqVO> al = new ArrayList<FaqVO>();

		try {
			DB();

			String sql = "select article_seq, article_title, mem_id, sysdate, article_cnt from t_feq";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int getArticle_seq = rs.getInt(1);
				String getArticle_tl = rs.getString(2);
				String getMem_id = rs.getString(3);
				int getArticle_cnt = rs.getInt(4);

				FaqVO vo = new FaqVO(getArticle_seq, getArticle_tl, getMem_id, getArticle_cnt);
				al.add(vo);

			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}
		return al;
	}

	public FaqVO select_FAQ(int article_seq) {

		FaqVO vo = null;

		try {
			DB();

			String sql = "select article_title, mem_id, article_content, article_file from t_faq where article_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, article_seq);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getArticle_tl = rs.getString(1);
				String getMem_id = rs.getString(2);
				String getArticle_ct = rs.getString(3);
				String getArticle_fl = rs.getString(4);

				vo = new FaqVO(getArticle_tl, getMem_id, getArticle_ct, getArticle_fl);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
}
